-- See the Copyright notice at the end of this file.
--
class AMIGA_DIRECTORY_NOTATION
	-- The Amiga file path notation looks like:
	--   DEV:SmartEiffel/sys/system.se

inherit
	DIRECTORY_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

	is_parent_directory (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

	to_parent_directory (some_path: STRING) is
		do
			if some_path.last = ':' then
				some_path.clear_count
			else
				from
					some_path.remove_last
				until
					some_path.is_empty or else some_path.last = '/' or else some_path.last = ':'
				loop
					some_path.remove_last
				end
			end
			if not some_path.is_empty and then (some_path.last /= '/' and then some_path.last /= ':') then
				some_path.extend('/')
			end
		end

	to_subdirectory_with (parent_path, entry_name: STRING) is
		do
			inspect
				parent_path.last
			when '/' then
				if entry_name.first = '/' then
					parent_path.remove_last
				end
			when ':' then
			else
				if entry_name.first /= '/' then
					parent_path.add_last('/')
				end
			end
			parent_path.append(entry_name)
			parent_path.extend_unless('/')
		end

	to_file_path_with (parent_path, file_name: STRING) is
		do
			inspect
				parent_path.last
			when ':' then
			when '/' then
				if file_name.first = '/' then
					parent_path.remove_last
				end
			else
				if file_name.first /= '/' then
					parent_path.extend('/')
				end
			end
			parent_path.append(file_name)
		end

	to_subpath_with (parent_path, subpath: STRING) is
		do
			if parent_path.last /= ':' then
				parent_path.extend_unless('/')
			end
			parent_path.append(subpath)
		end

	to_directory_path (path: STRING) is
		do
			path.extend_unless('/')
		end

feature {ANY}
	can_map_drive (source_notation: DIRECTORY_NOTATION; drive: STRING): BOOLEAN is
		do
			--|*** We (c/sh)ould do better than nothing... <24/03/2005>
		end

	to_root (source_notation: DIRECTORY_NOTATION; drive: STRING) is
		do
			check
				False
			end
		end

	to_default_root (directory: STRING) is
		do
			not_yet_implemented
		end

	to_current_directory (directory: STRING) is
		do
			not_yet_implemented
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is True

	is_valid_path, is_valid_directory_path (path: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not path.is_empty
		end

	is_valid_file_name (name: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not name.is_empty
		end

	is_absolute_path (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

feature {DIRECTORY_NOTATION}
	to_notation (path: STRING; destination_notation: DIRECTORY_NOTATION): STRING is
		do
			not_yet_implemented
		end

end -- class AMIGA_DIRECTORY_NOTATION
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------