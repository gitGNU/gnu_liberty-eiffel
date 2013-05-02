-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_STRING11

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make is
      local
         c: CHARACTER; s, s1, s2: STRING
      do
         c := 0.hexadecimal_digit
         assert(c = '0')
         c := 1.hexadecimal_digit
         assert(c = '1')
         c := 9.hexadecimal_digit
         assert(c = '9')
         c := 10.hexadecimal_digit
         assert(c = 'A')
         c := 15.hexadecimal_digit
         assert(c = 'F')
         s := "0000"
         s.to_hexadecimal
         assert(("0").is_equal(s))
         s := "1000"
         s.to_hexadecimal
         assert(("8").is_equal(s))
         s := "1111"
         s.to_hexadecimal
         assert(("F").is_equal(s))
         s := "111"
         s.to_hexadecimal
         assert(("7").is_equal(s))
         s := "11111"
         s.to_hexadecimal
         assert(("1F").is_equal(s))
         s := "11111111"
         s.to_hexadecimal
         assert(("FF").is_equal(s))
         create s1.make(1)
         create s2.make(0)
         s1.append(s2)
      end

end -- class TEST_STRING11
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
