<?php
include "config.php";
include "functions.php";

/* todo: "Please look at" in outfile -> link for popup with file */
/* todo: "Warning: " in outfile -> link for popup with file */
// todo: graphical improvements:
//       - use only divs instead of tables
//       - add info div (as popup?)
//       - provide navigation links though the history with the current view "<-" and "->" on left and right side
//       - provide a diff between history
//       - somehow "store" the visible divs over reload and navigation

// todo: move "all" stage content into separate site loads to prevent a big index.html download with "everything green" and none caring about the details
// => CAD: not sure about that; I often download the latest history for offline use, if I need to download more files it is less useful
// Rmk: for me one big site is also acceptable. And the size decreases - the more tests are fixed. My concerns were majorly about the page size / load time. -> we shoulde remove this todo

include "$templates/head.html";

if(array_key_exists("manual_request", $_GET) && $_GET["manual_request"] == 1){
   file_put_contents ($request, "new MANUAL request on " . date($dateFormat));
}

if(array_key_exists('history', $_GET)){
   $history = $_GET["history"];
   if ($history > 0) {
      $stageout = $stageout . "_" . $history;
      $state = "history " . $history . " / " . $historysize;
      $activeJsonObj = $stageout . "/saved.serialjson";
   }
} else {
   $history = 0;
}

if (file_exists($activeJsonObj)) {
   $json_array = unserialize(file_get_contents($activeJsonObj));
} else {
   $json_array = array();
}

// see https://help.github.com/articles/post-receive-hooks
if (array_key_exists('commits', $json_array)) { // old mode, now obsolete but kept for transition
   $json_count = count($json_array['commits']);
   $json_commits = $json_array['commits'];
} else {
   $json_count = 0;
   $json_commits = array();
   foreach ($json_array as $json) {
      $json_count += count($json['commits']);
      $json_commits = array_merge($json_commits, $json['commits']);
   }
}
if ($json_count == 1) {
   echo "<p>1 active commit:</p>\n";
} else {
   echo "<p>" . $json_count . " active commits:</p>\n";
}
echo "<ul>\n";
foreach ($json_commits as $commit){
   $committer = $commit['author']['name'];
   // his email is: $commit['author']['email'];
   $message_lines = explode("\n", $commit['message']);
   $message = $message_lines[0];
   echo "<li><a href=\"" . $commitbaselink . $commit['id'] . "\">" . $message . "</a> by $committer on " . date ($dateFormat, strtotime($commit['timestamp'])) . "</li>\n";
}
echo "</ul>\n";
if(file_exists($lock)){
   $currentStage = file_get_contents("$stageout/current_stage.txt");
   $state = "working on " . file_get_contents($currentStage . "/stagename.txt");
}else{
   $state = "idle";
}
if(file_exists($request)){
   $content = file_get_contents($request);
   $state = $state . " &mdash; " . $content;
}

echo "<p>&nbsp;</p>";

echo "<p>State: $state</p>\n";

function legible_time($time) {
   $seconds = $time % 60;
   $minutes = (int)(($time - $seconds) / 60) % 60;
   $hours = (int)((($time - $seconds) / 60 - $minutes) / 60);
   $days = (int)(((($time - $seconds) / 60 - $minutes) / 60 - $hours) / 24);
   if ($days > 0) {
      $result = $days . " day" . ($days == 1 ? "" : "s") . ", " . $hours . ":" . ($minutes < 10 ? "0" : "") . $minutes . ":" . ($seconds < 10 ? "0" : "") . $seconds . " hour" . ($hours == 1 ? "" : "s");
   } elseif ($hours > 0) {
      $result = $hours . ":" . ($minutes < 10 ? "0" : "") . $minutes . ":" . ($seconds < 10 ? "0" : "") . $seconds . " hour" . ($hours == 1 ? "" : "s");
   } else {
      $result = ($minutes < 10 ? "0" : "") . $minutes . ":" . ($seconds < 10 ? "0" : "") . $seconds . " minute" . ($minutes == 1 ? "" : "s");
   }
   return $result;
}

if (file_exists($lock)) {
   $startTime = filemtime($lock);
   $start = date($dateFormat, $startTime);
   echo "<p>Started on: $start";
   $active_time = time() - $startTime;
   echo " &mdash; " . legible_time($active_time) . " ago</p>\n";
   if (file_exists($timesHistory)) {
      $times = unserialize(file_get_contents($timesHistory));
      if (count($times) > 1) {
         $time_sum = 0;
         $time_count = 0;
         foreach ($times as $time) {
            $time_sum += $time;
            $time_count ++;
         }
         echo "<p style='float:right;font-size:0.875em;'>Estimated completion: ";
         $time_average = (int)($time_sum / $time_count + 0.5);
         if ($active_time < $time_average) {
            $completion = (int)((100.0 * $active_time) / $time_average + 0.5);
            echo "<b>" . $completion . "%</b>\n<br/>ETA: in " . legible_time($time_average - $active_time);
         } else {
            echo "unknown";
         }
         echo "\n<br/>(Based on average running time: " . legible_time($time_average) . " in the " . count($times) . " latest runs)</p>\n";
      }
   }
}

$update = date($dateFormat, filemtime("$stageout/current_stage.txt"));
echo "<p>Last update: $update</p>\n";

echo "<p>&nbsp;</p>";

function filedatecompare($a,$b){
   $ac = filectime($a);
   $bc = filectime($b);
   if($ac == $bc){
      $am = filemtime($a);
      $bm = filemtime($b);
      if($am == $bm){
         return strcmp($a, $b);
      }else{
         return $am - $bm;
      }
   }else{
      return $ac - $bc;
   }
}

function printSubStages($dir){
   global $img;
   global $stage;

   $substageNo = 0;

   $parentStage = $stage;
   $first = true;
   $subs = glob("$dir/*", GLOB_ONLYDIR | GLOB_NOSORT);
   usort($subs, "filedatecompare");

   foreach ($subs as $stagedir){
      if($first){
         echo "<table style=\"width: 100%\">\n";
         $first = false;
      }
      $substageNo++;
      $stage = $parentStage . "_" . $substageNo;

      $stageName = file_get_contents("$stagedir/stagename.txt");
      if(file_exists("$stagedir/result.txt")){
         $stageresult = htmlForResult(file_get_contents("$stagedir/result.txt"));
         $display_style = displayStyleForResult(file_get_contents("$stagedir/result.txt"));
      }else{
         $stageresult = htmlForResult("");
         $display_style = displayStyleForResult("");
      }

      $stageStack = explode("/", $stageName);

      if(file_exists("$stagedir/stagelink.txt")){
         $stagelink = file_get_contents("$stagedir/stagelink.txt");
         $stageHtml = "<a href=\"$stagelink\">" . end($stageStack) . "</a>";
      }else{
         $stageHtml = end($stageStack);
      }

      echo "  <tr><td>" . $stageHtml . "</td><td>" . $stageresult . "</td><td>";
      echo "      <div style=\"display:inline;cursor:pointer;\" onclick=\"document.getElementById('stageout" . $stage . "').style.display='inline'\"><img src=\"$img/Plus_sign.png\" width=\"16\" height=\"16\" alt=\"show details\"/></div>\n";
      echo "      <div style=\"display:inline;cursor:pointer;\" onclick=\"document.getElementById('stageout" . $stage . "').style.display='none'\"><img src=\"$img/Minus_sign.png\" width=\"16\" height=\"16\" alt=\"hide details\"/></div>\n";
      echo "      </td></tr>\n";
      echo "      <tr><td colspan=\"3\"><div style=\"display:" . $display_style . "\" id=\"stageout" . $stage ."\">";
      echo "         <div class=\"substage\">";
      printSubStages($stagedir);
      echo "         </div>";
      echo "         <p class=\"cmd\">" . htmlify(file_get_contents("$stagedir/cmd.txt")) . "</p>\n";
      echo "         <p class=\"out\">" . htmlify(file_get_contents("$stagedir/out.txt")) . "</p>\n";
      echo "         <p class=\"err\">" . htmlify(file_get_contents("$stagedir/err.txt")) . "</p>\n";
      // todo: improve info div (print duration as time)
      // todo: print summary (#of failed, #of warns and #of oks
      /* echo "         <div class=\"info\">\n"; */
      /* echo "         Start: " . file_get_contents("$stagedir/start.txt") . "\n"; */
      /* echo "         End: " . file_get_contents("$stagedir/end.txt") . "\n"; */
      /* echo "         </div>\n"; */
      echo "      </div></td></tr>";
      echo "   \n";

   }

   if(!$first){
      echo "</table>\n";
   }
}


$stage = "";
echo "<div style=\"width:760px;\">\n";
printSubStages($stageout);
echo "\n</div>\n";


/* yes, include config again, to reset $stageout */
include "config.php";

echo "<div name='pager'>";
if($history > 0){
   $i = $history - 1;
   echo "<a href=\"?history=$i\">&lt;&mdash;</a>";
   echo " <a href=\"?history=0\">latest</a>";
} else {
   echo "<b>latest</b>";
}
for($i = 1; $i <= $historysize; $i++){
   if($history == $i){
      echo " <b>$i</b> ";
   } elseif(is_dir($stageout . "_" . $i)){
      echo " <a href=\"?history=$i\">$i</a> ";
   }
}
if($history < $historysize){
   $i = $history + 1;
   if(is_dir($stageout . "_" . $i)){
      echo " <a href=\"?history=$i\">&mdash;&gt;</a>";
   }
}
echo "</div>";
include "$templates/foot.html";
?>