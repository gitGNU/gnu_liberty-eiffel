-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPE_INSTANCE_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gtype_instance_struct_set_g_class (a_structure: POINTER; a_value: POINTER) is
			-- Setter for g_class field of GTYPE_INSTANCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_instance_struct_set_g_class"
		}"
		end

feature {} -- Low-level queries

	gtype_instance_struct_get_g_class (a_structure: POINTER): POINTER is
			-- Query for g_class field of GTYPE_INSTANCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_instance_struct_get_g_class"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeInstance"
		}"
		end

end -- class GTYPE_INSTANCE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
