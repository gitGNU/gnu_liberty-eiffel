-- See the Copyright notice at the end of this file.
--
deferred class EIFFELTEST_TOOLS
	--
	-- Just insert class EIFFELTEST_TOOLS in your TEST_* class.
	-- See also command `eiffeltest'.
	--

insert
	ANY

feature {}
	assert (test: BOOLEAN) is
		do
			label_assert(Void, test)
		end

	label_assert (label: STRING; test: BOOLEAN) is
			-- Check that `test' is actually True. If `test' is True, nothing happens except that the
			-- `assert_counter' is incremented by one. When `test' is False, an error message is printed 
			-- on `std_output' and an `sedb_breakpoint' allow you to find out what is going wrong 
			-- (assuming you are using the -sedb debugger).
		local
			actual_label: STRING
		do
			assert_counter.increment
			if not test then
				sedb_breakpoint
				if label /= Void then
					actual_label := label
				else
					actual_label := once ""
					actual_label.copy(once "number ")
					assert_counter.value.append_in(actual_label)
				end
				std_output.put_string(once "ERROR: {EIFFELTEST_TOOLS}.assert call ")
				std_output.put_string(actual_label)
				std_output.put_string(once " in class ")
				std_output.put_string(generator)
				std_output.put_string(once " failed.%NRerun this test under the -sedb debugger to find out what is going wrong.%N")
				std_output.put_string(once "Assertion level was ")
				std_output.put_string(assertion_flag)
				std_output.put_character('.')
				std_output.put_new_line
			end
		end

	assert_counter: COUNTER is
			-- Unique once COUNTER used to count `assert' calls.
		once
			create Result
		end

	assertion_flag: STRING is
		do
			Current.probe_assertion_level -- call via the explicit "Current" target to force invariant check.
			inspect
				assertion_level
			when assertion_level_check then
				Result := once "all_check"
			when assertion_level_loop_invariant then
				Result := once "loop_check"
			when assertion_level_class_invariant then
				Result := once "invariant_check"
			when assertion_level_ensure then
				Result := once "ensure_check"
			when assertion_level_require then
				Result := once "require_check"
			else
				Result := once "no_check or boost"
			end
		end

	assertion_level: INTEGER
	assertion_level_none: INTEGER is 0
	assertion_level_require: INTEGER is 1
	assertion_level_ensure: INTEGER is 2
	assertion_level_class_invariant: INTEGER is 3
	assertion_level_loop_invariant: INTEGER is 4
	assertion_level_check: INTEGER is 5

	set_require: BOOLEAN is
		do
			assertion_level := assertion_level.max(assertion_level_require)
			Result := True
		end

	set_loop_invariant: BOOLEAN is
		do
			assertion_level := assertion_level.max(assertion_level_loop_invariant)
			Result := True
		end

	set_check: BOOLEAN is
		do
			assertion_level := assertion_level.max(assertion_level_check)
			Result := True
		end

	set_ensure: BOOLEAN is
		do
			assertion_level := assertion_level.max(assertion_level_ensure)
			Result := True
		end

	set_class_invariant: BOOLEAN is
		do
			assertion_level := assertion_level.max(assertion_level_class_invariant)
			Result := True
		end

feature {EIFFELTEST_TOOLS}
	probe_assertion_level is
		require
			set_require
		do
			from
			invariant
				set_loop_invariant
			until
				True
			loop
			end
			check
				set_check
			end
		ensure
			set_ensure
		end

invariant
	set_class_invariant

end -- class EIFFELTEST_TOOLS
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