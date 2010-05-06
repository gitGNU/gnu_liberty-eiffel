-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTRAVERSE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = leaves_low_level)  or else
				(a_value = all_low_level)  or else
				(a_value = mask_low_level)  or else
				(a_value = leafs_low_level)  or else
				(a_value = non__leafs_low_level) )
		end

feature -- Setters
	default_create,
	set_leaves is
		do
			value := leaves_low_level
		end

	set_all is
		do
			value := all_low_level
		end

	set_mask is
		do
			value := mask_low_level
		end

	set_leafs is
		do
			value := leafs_low_level
		end

	set_non__leafs is
		do
			value := non__leafs_low_level
		end

feature -- Queries
	is_leaves: BOOLEAN is
		do
			Result := (value=leaves_low_level)
		end

	is_all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	is_mask: BOOLEAN is
		do
			Result := (value=mask_low_level)
		end

	is_leafs: BOOLEAN is
		do
			Result := (value=leafs_low_level)
		end

	is_non__leafs: BOOLEAN is
		do
			Result := (value=non__leafs_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	leaves_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_LEAVES"
 			}"
 		end

	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_ALL"
 			}"
 		end

	mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_MASK"
 			}"
 		end

	leafs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_LEAFS"
 			}"
 		end

	non__leafs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_NON_LEAFS"
 			}"
 		end


end -- class GTRAVERSE_FLAGS_ENUM
