-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_AND_THEN
   --
   --   Infix operator : "and then".
   --

inherit
   CALL_INFIX
      redefine inline_dynamic_dispatch_
      end

creation {EIFFEL_PARSER, IFTHEN, INTROSPECTION_HANDLER}
   make

creation {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER is 5

   left_brackets: BOOLEAN is False

   operator: STRING is
      do
         Result := as_and_then
      end

   compile_to_jvm (type: TYPE) is
      local
         failure, point2: INTEGER; ca: like code_attribute
      do
         ca := code_attribute
         target.compile_to_jvm(type)
         failure := ca.opcode_ifeq
         arg1.compile_to_jvm(type)
         point2 := ca.opcode_goto
         ca.resolve_u2_branch(failure)
         ca.opcode_iconst_0
         ca.resolve_u2_branch(point2)
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      do
         Result := jvm_standard_branch_if_false(type)
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      do
         Result := jvm_standard_branch_if_true(type)
      end

   accept (visitor: CALL_INFIX_AND_THEN_VISITOR) is
      do
         visitor.visit_call_infix_and_then(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         left: like target; right: like arg1; compound: INSTRUCTION; ifthen: IFTHEN
         sp: POSITION; internal_local2: INTERNAL_LOCAL2
      do
         sp := feature_name.start_position
         target.inline_dynamic_dispatch_(code_accumulator, type)
         left := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         check
            left.resolve_in(type).is_boolean
         end
         create internal_local2.make(sp, Current, feature_name.to_string, True)
         code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, left))
         -- New context for the righ-hand side:
         code_accumulator.open_new_context
         arg1.inline_dynamic_dispatch_(code_accumulator, type)
         right := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         check
            right.resolve_in(type).is_boolean
         end
         code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, right))
         compound := code_accumulator.current_context_to_instruction
         code_accumulator.close_current_context
         -- Non inlining the "and then" with an IFTHEN:
         create ifthen.make(sp, internal_local2, compound)
         code_accumulator.current_context.add_last(ifthen)
         -- Adding the final result:
         code_accumulator.current_context.add_last(internal_local2)
      end
         
feature {}
   make (left: like target; operator_position: POSITION; right: like arg1) is
      require
         left /= Void
         not operator_position.is_unknown
         right /= Void
      do
         target := left
         create feature_name.infix_name(and_then_name, operator_position)
         create arguments.make_1(right)
      ensure
         target = left
         start_position = operator_position
         arguments.first = right
      end

end -- class CALL_INFIX_AND_THEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------