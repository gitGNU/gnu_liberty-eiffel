-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CURVE_CLASS_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_curve_class_struct_set_curve_type_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for curve_type_changed field of GTK_CURVE_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_class_struct_set_curve_type_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_curve_class_struct_get_curve_type_changed (a_structure: POINTER): POINTER is
			-- Query for curve_type_changed field of GTK_CURVE_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_class_struct_get_curve_type_changed"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCurveClass"
		}"
		end

end -- class GTK_CURVE_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
