-- See the Copyright notice at the end of this file.
--
deferred class UNIXISH_PATH_NAME
	-- A PATH_NAME that is more or less built after the same model as traditional unix path names.

inherit PATH_NAME

feature {ANY} -- Access
	last: STRING is
		deferred
		ensure then
			not Result.has(directory_separator)
		end

	extension: STRING is
		deferred
		ensure then
			is_extension: not Result.is_empty implies Result.first = extension_separator
			is_minimal: Result.occurrences(extension_separator) <= 1
			not Result.has(directory_separator)
		end

	is_valid_file_name (elem: STRING): BOOLEAN is
		do
			Result := not elem.has(directory_separator)
		ensure then
			Result implies not elem.has(directory_separator)
		end

	is_valid_directory: BOOLEAN is True

	is_valid_file: BOOLEAN is
		local
			lst: like last
		do
			lst := last
			Result := not (last.is_empty or else last.is_equal(this_directory) or else last.is_equal(up_directory))
		end

	is_separator (ch: CHARACTER): BOOLEAN is
			-- Is `ch' a possible path separator?
		do
			Result := ch = directory_separator
		ensure
			(ch = directory_separator) implies Result
		end

feature {ANY} -- Operations
	go_up is
		local
			lst: like last
		do
			from
			until
				path.count <= 1 or else not is_separator(path.last)
			loop
				path.remove_last
			end
			if is_empty then
				if not is_absolute then
					add_last(up_directory)
				end
			else
				lst := last
				if lst.is_equal(this_directory) then
					remove_last
					add_last(up_directory)
				elseif lst.is_equal(up_directory) then
					add_last(up_directory)
				else
					remove_last
				end
			end
		end

	join_to (other: PATH_JOINER) is
		local
			p: INTEGER; element: STRING
		do
			p := start_join_to (other)
			if p <= path.upper then
				element := once "a_file_name"
				from
					p := scan_element(p, element)
				until
					p > path.upper
				loop
					join_directory_to(other, element)
					p := scan_element(p, element)
				end
				if not element.is_empty then
					if is_separator(path.last) then
						join_directory_to(other, element)
					else
						join_element_to(other, element)
					end
				end
				other.end_join
			end
		end

feature {ANY} -- Constants
	extension_separator: CHARACTER is
			-- Character used to separate filenames from extensions
		deferred
		end

	directory_separator: CHARACTER is
			-- Character used to separate directories
			-- This character is forbidden in filenames
		deferred
		end

	up_directory: STRING is
		deferred
		end

	this_directory: STRING is
		deferred
		end

feature {PATH_JOINER}
	join_element (element: STRING) is
		do
			if not is_empty and then last.is_equal(this_directory) then
				remove_last
			end
			if not path.is_empty and then not is_separator(path.last) then
				path.extend(directory_separator)
			end
			path.append(element)
		end

	join_extension (an_extension: STRING) is
		do
			path.extend(extension_separator)
			path.append(an_extension)
		end

	join_error: BOOLEAN is False

feature {}
	path: STRING

	start_join_to (other: PATH_JOINER): INTEGER is
		require
			other /= Void
		deferred
		ensure
			Result.in_range(path.lower, path.upper + 1)
		end

	scan_element (p: INTEGER; element: STRING): INTEGER is
		require
			path.valid_index(p)
			element /= Void
		do
			element.clear_count
			from
				Result := p
			until
				Result > path.upper or else not is_separator(path.item(Result))
			loop
				Result := Result + 1
			end
			from
			until
				Result > path.upper or else is_separator(path.item(Result))
			loop
				element.add_last(path.item(Result))
				Result := Result + 1
			end
		ensure
			Result.in_range(p+1, path.upper + 1)
			path.substring(p, Result - 1).has_suffix(element)
		end

	join_directory_to (other: PATH_JOINER; element: STRING) is
		require
			other /= Void
			not element.is_empty
		do
			if element.is_equal(up_directory) then
				other.join_up
			elseif element.is_equal(this_directory) then
			else
				-- *** TODO: handle extensions
				other.join_directory(element)
			end
		end

	join_element_to (other: PATH_JOINER; element: STRING) is
		require
			other /= Void
			not element.is_empty
		do
			if element.is_equal(up_directory) then
				other.join_up
			elseif element.is_equal(this_directory) then
			else
				-- *** TODO: handle extensions
				other.join_element(element)
			end
		end

invariant
	path /= Void

end -- class UNIXISH_PATH_NAME
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