-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SCALE_BUTTON_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_scale_button_struct_set_plus_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for plus_button field of GTK_SCALE_BUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_struct_set_plus_button"
		}"
		end

	gtk_scale_button_struct_set_minus_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for minus_button field of GTK_SCALE_BUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_struct_set_minus_button"
		}"
		end

	gtk_scale_button_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTK_SCALE_BUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_scale_button_struct_get_plus_button (a_structure: POINTER): POINTER is
			-- Query for plus_button field of GTK_SCALE_BUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_struct_get_plus_button"
		}"
		end

	gtk_scale_button_struct_get_minus_button (a_structure: POINTER): POINTER is
			-- Query for minus_button field of GTK_SCALE_BUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_struct_get_minus_button"
		}"
		end

	gtk_scale_button_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTK_SCALE_BUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_struct_get_priv"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkScaleButton"
		}"
		end

end -- class GTK_SCALE_BUTTON_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
