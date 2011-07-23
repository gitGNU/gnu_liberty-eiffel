-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class BOOLEAN_CONSTANT
   --
   -- Root class of E_FALSE and E_TRUE.
   --

inherit
   BASE_TYPE_CONSTANT

feature {ANY}
   extra_bracket_flag: BOOLEAN is False

   value: BOOLEAN is
      deferred
      end

   frozen declaration_type: TYPE is
      once
         Result := smart_eiffel.type_boolean
      end
   
   frozen resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
      end
   
   frozen simplify_1_, frozen simplify_2: like Current is
      do
         Result := Current
      end

feature {}
   make (sp: like start_position) is
      do
         start_position := sp
      end

end -- class BOOLEAN_CONSTANT
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