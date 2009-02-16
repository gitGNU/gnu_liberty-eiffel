deferred class TYPE_TRANSLATOR
	-- Translate names of C symbols into Eiffel features

insert
	SHARED_SETTINGS
	EIFFEL_GCC_XML_EXCEPTIONS
	EXCEPTIONS

feature {ANY} -- Initialization
	make is
		do
			end

feature {ANY} -- Type-system translations
	is_void (an_argument: XML_COMPOSITE_NODE): BOOLEAN is
		require
			argument_not_void: an_argument /= Void
		local
			type: UNICODE_STRING
		do
			if an_argument.name.is_equal(once U"FundamentalType") then
				if an_argument.attribute_at(once U"name").is_equal(U"void") then
					Result := True
				else
					Result := False
				end
			else
				type := an_argument.attribute_at(once U"type")
				if type = Void then
					Result := False
				else
					Result := is_void(types.at(type))
				end
			end
		end
		-- eiffel_type_of_unicode (an_id: UNICODE_STRING): STRING is
		-- 		-- The Eiffel type name correspondent to the C type contained in `an_id'
		-- 	require an_id/=Void
		-- 	local a_type: XML_COMPOSITE_NODE
		-- 	do
		-- 		a_type := types.reference_at(deconst(an_id.as_utf8))
		-- 		if a_type/=Void then Result := eiffel_type_of(a_type) end
		-- 	end

	eiffel_type_of_string (an_id: UNICODE_STRING): STRING is
			-- The Eiffel type name correspondent to the C type contained in `an_id'
		require
			an_id /= Void
		local
			a_type: XML_COMPOSITE_NODE
		do
			a_type := types.reference_at(deconst(an_id))
			if a_type /= Void then
				Result := eiffel_type_of(a_type)
			end
		end

	eiffel_type_of (an_argument: XML_COMPOSITE_NODE): STRING is
			-- The Eiffel type usable to wrap `an_argument'. If it does
			-- not have a proper wrapper type Result is Void and
			-- `last_error' describes the issue using one of the strings
			-- from EIFFEL_GCC_XML_EXCEPTIONS. "Expanded" structures,
			-- unions, references, complex reals (float and double) 
		require
			argument_not_void: an_argument /= Void
		local
			name: STRING; size: INTEGER
			referred: XML_COMPOSITE_NODE
			uniname: UNICODE_STRING
		do
			check 
				-- This SHOULD be useless in Eiffel... just to be sure
				Result = Void 
				-- In fact previous code explicitly assigned it, i.e.:
				-- Result:=Void but this should be redundant in Eiffel since
				-- all reference type Results are set at the beginning of the
				-- feature to the default value for a reference, i.e. Void!
			end
			-- Known nodes: FundamentalType Constructor Ellipsis Typedef
			-- ArrayType Argument Enumeration PointerType EnumValue
			-- Struct GCC_XML CvQualifiedType Namespace FunctionType
			-- Variable File Field Function Union ReferenceType
			inspect an_argument.name.to_utf8
			when "FundamentalType" then
				name := an_argument.attribute_at(once U"name").to_utf8
				if name.is_equal(once "void") then Result := once ""
				else
					size := an_argument.attribute_at(once U"size").to_utf8.to_integer
					if name.has_substring(once "char") then
						-- check size=8 end
						Result := once "CHARACTER"
					elseif name.has_substring(once "complex") then
						-- could be "complex double" "complex float",
						-- "complex long double"
						log("Unhandled complex type found at line @(1): @(2)%N",<<an_argument.line.out,name>>)
						last_error := unhandled_complex_type
					elseif name.has_substring(once "unsigned") then
						-- check name.has_substring(once "int") end
						if are_naturals_used then
							inspect
								size
							when 16 then
								Result := once "NATURAL_16"
							when 32 then
								Result := once "NATURAL_32"
							when 64 then
								Result := once "NATURAL_64"
							else
								std_error.put_line("Unknown unsigned int of size" + size.out)
								last_error := unhandled_unsigned_integer_type
							end
						else
							inspect
								size
							when 16 then
								Result := once "INTEGER_16"
							when 32 then
								Result := once "INTEGER_32"
							when 64 then
								Result := once "INTEGER_64"
							else
								std_error.put_line("Unknown unsigned int of size" + size.out)
								last_error := unhandled_unsigned_integer_type
							end
						end
					elseif name.has_substring(once "int") then
						inspect
							size
						when 16 then
							Result := once "INTEGER_16"
						when 32 then
							Result := once "INTEGER_32"
						when 64 then
							Result := once "INTEGER_64"
						else
							std_error.put_line("Unknown int of size" + size.out)
							last_error := unhandled_integer_type
						end
					elseif name.has_substring(once "float") then
						-- check size=32 end
						Result := once "REAL_32"
					elseif name.has_substring(once "double") then
						inspect
							size
						when 32 then
							std_error.put_line(once "What a pretty strange thing: a 32 bit double! They are usually called float.")
							Result := once "REAL_32"
						when 64 then
							Result := once "REAL_64"
						when 80 then
							Result := once "REAL_80"
						when 128 then
							Result := once "REAL_128"
						else
							std_error.put_line("Double of unhandled length " + size.out + " using REAL_128")
							last_error := unhandled_double_type
						end
					else
						std_error.put_line(unhandled_type + name)
						last_error := unhandled_type
					end
				end
				-- if name.is_equal(once "void")
			when "Argument", "Typedef", "Variable", "Field" then
				-- Recursively discover the correct type: the actual type
				-- of a typedef is the type it is referring to.
				-- It was Result:=eiffel_type_of(types.at(deconst(an_argument.attribute_at(once U"type"))))
				-- but it requires that eiffel_type_of accept a Void argument
				-- and that the types dictionary is always correctly filled.
				uniname := deconst(an_argument.attribute_at(once U"type"))
				std_error.put_line("Looking for type of "+uniname.as_utf8+" an Argument/Typedef/Variable/Field")
				referred := types.reference_at(uniname)
				if referred/=Void then
					Result := eiffel_type_of(referred)
				else
					name := an_argument.attribute_at(once U"name").to_utf8
					std_error.put_line("Warning! "+name+" has no Eiffel type")
				end
			when "Enumeration" then
				Result := once "INTEGER_32"
			when "ArrayType", "PointerType" then
				Result := once "POINTER"
			when "FunctionType" then
				std_error.put_line(once "FunctionType wrapped as a POINTER.")
				Result := once "POINTER"
			when "Struct" then
				last_error := unhandled_structure_type
			when  "Function" then
				std_error.put_line(once "C functions does not have a valid Eiffel wrapper type (a function pointer does have it).")
				last_error := unhandled_type
			when  "Union" then
				last_error := unhandled_union_type
			when  "ReferenceType" then
				std_error.put_line(once "C++ reference does not have a valid Eiffel wrapper type.")
				last_error := unhandled_reference_type
			else
				last_error := unhandled_type
			end
		ensure
			when_void_last_error_is_set: Result = Void implies last_error /= Void
		end

	has_type_error: BOOLEAN is
			-- Is `last_error' related to types?
		do
			Result := last_error = unhandled_type or else last_error = unhandled_complex_type or else last_error = unhandled_unsigned_integer_type or else last_error = unhandled_integer_type or else last_error = unhandled_double_type or else last_error = unhandled_structure_type or else last_error = unhandled_union_type or else last_error = unhandled_reference_type
		end

	last_error: STRING
			-- A description of the latest error occurred

	types: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
			-- Types by their id

	typedefs: LINKED_LIST[XML_COMPOSITE_NODE]

feature {} -- Implementation
	deconst (a_string: UNICODE_STRING): UNICODE_STRING is
			-- `a_string' if it does not end with 'c' or 'r'; otherwise it is a
			-- copy of `a_string' with the last character ('c' or 'r')
			-- removed. In gcc-xml output 'c' should mean that the referred id
			-- shall be constant, 'r' a reference type.
		require
			not_void: a_string /= Void
		do
			inspect
				a_string.last.to_character
			when 'c', 'r' then
				Result := a_string.substring(a_string.lower, a_string.upper - 1)
			else
				Result := a_string
			end
			-- debug 
			-- 	log(once "deconst(@(1))=@(2)",<<a_string.out,Result.out>>)
			-- end
		end

feature {ANY} -- Constants
	integer_size: INTEGER is
		-- The size of an INTEGER in bytes
	once
		Result := {INTEGER_32 1}.object_size // 8
	end

	real_size: INTEGER is
		-- The sice of a REAL_64 in bytes
	once
		Result := {REAL_64 1.0}.object_size // 8
	end
	-- External types are described in
	-- http://smarteiffel.loria.fr/wiki/en/index.php/External_types
	-- could be obsolete.

invariant
	non_void_types: types /= Void
	non_void_typedefs: typedefs /= Void

end -- class TYPE_TRANSLATOR

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
