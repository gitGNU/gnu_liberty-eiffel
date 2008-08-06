indexing
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class GLOBALLY_CACHED
	-- A wrapper for an object on 

inherit C_STRUCT

insert ANY undefine copy, is_equal, fill_tagged_out_memory end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	wrappers: HASHED_DICTIONARY [C_STRUCT, POINTER] is
			-- Dictionary storing wrappers created in the program.  Key
			-- is the address (pointer) to the wrapped C structure, value
			-- is the corresponding Eiffel wrapper. This way you can get
			-- back an already-created Eiffel wrapper. Heirs of
			-- SHARED_C_STRUCT, i.e. G_OBJECT could provide alternative
			-- implementation that will not rely on this dictionary.
		once
			create {HASHED_DICTIONARY[GLOBALLY_CACHED,POINTER]}
			Result.make
		end
	
invariant
	stored: wrappers.has(handle)
end -- class GLOBALLY_CACHED
