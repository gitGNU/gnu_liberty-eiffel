-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOBJECT_CONSTRUCT_PARAM_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gobject_construct_param_struct_set_pspec (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pspec field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobject_construct_param_struct_set_pspec"
		}"
		end

	gobject_construct_param_struct_set_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobject_construct_param_struct_set_value"
		}"
		end

feature {} -- Low-level queries

	gobject_construct_param_struct_get_pspec (a_structure: POINTER): POINTER is
			-- Query for pspec field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobject_construct_param_struct_get_pspec"
		}"
		end

	gobject_construct_param_struct_get_value (a_structure: POINTER): POINTER is
			-- Query for value field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobject_construct_param_struct_get_value"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GObjectConstructParam"
		}"
		end

end -- class GOBJECT_CONSTRUCT_PARAM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
