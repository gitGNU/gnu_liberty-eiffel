-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER108
   --
   -- Test of depassement of INTEGER_64_NUMBER capacity
   -- during a division between a BIG_INTEGER_NUMBER
   -- and a INTEGER_64_NUMBER,
   -- Result is an integer which is symbolized by a
   -- INTEGER_64_NUMBER
   --

insert
   EIFFELTEST_TOOLS
   
create {}
   make

feature {ANY}
   make is
      local
         a, b, q, r: NUMBER
      do
         a := nt.from_string("1000000000000000000000000")
         b := nt.from_string("10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(q.is_positive)
         assert(q @= 100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_zero)
         a := nt.from_string("-1000000000000000000000000")
         b := nt.from_string("10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(not q.is_positive)
         assert(q @= -100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_zero)
         a := nt.from_string("1000000000000000000000000")
         b := nt.from_string("-10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(not q.is_positive)
         assert(q @= -100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_zero)
         a := nt.from_string("-1000000000000000000000000")
         b := nt.from_string("-10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(q.is_positive)
         assert(q @= 100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_zero)
         a := nt.from_string("1000000000000000000000999")
         b := nt.from_string("10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(q.is_positive)
         assert(q @= 100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_positive)
         assert(r @= 999)
         a := nt.from_string("-999999999999999999999001")
         b := nt.from_string("10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(not q.is_positive)
         assert(q @= -100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_positive)
         assert(r @= 999)
         a := nt.from_string("1000000000000000000000999")
         b := nt.from_string("-10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(not q.is_positive)
         assert(q @= -100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_positive)
         assert(r @= 999)
         a := nt.from_string("-999999999999999999999001")
         b := nt.from_string("-10000000000")
         q := a // b
         r := a \\ b
         assert(q.is_integer_general_number)
         assert(q.is_positive)
         assert(q @= 100000000000000)
         assert(r.is_integer_general_number)
         assert(r.is_positive)
         assert(r @= 999)
      end

   nt: NUMBER_TOOLS

end -- class TEST_NUMBER108
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
