-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class AUTOMATON_CONTEXT[E_]

creation {AUTOMATON}
	make

feature {ANY} -- user data
	data: E_

	is_valid: BOOLEAN

feature {AUTOMATON} -- state memo
	current_state: STATE[E_]

	set_current_state (s: like current_state) is
		do
			current_state := s
		ensure
			current_state = s
		end

	invalidate is
		do
			is_valid := False
		ensure
			not is_valid
		end

feature {}
	make (e: E_) is
		do
			data := e
			is_valid := True
		ensure
			data = e
		end

end -- class AUTOMATON_CONTEXT
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
