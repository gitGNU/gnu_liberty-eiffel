-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_USER_DATA_KEY_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

	cairo_user_data_key_t_struct_set_unused (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for unused field of CAIRO_USER_DATA_KEY_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_data_key_t_struct_set_unused"
		}"
		end

feature {} -- Low-level queries

	cairo_user_data_key_t_struct_get_unused (a_structure: POINTER): INTEGER_32 is
			-- Query for unused field of CAIRO_USER_DATA_KEY_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_data_key_t_struct_get_unused"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__cairo_user_data_key"
		}"
		end

end -- class CAIRO_USER_DATA_KEY_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
