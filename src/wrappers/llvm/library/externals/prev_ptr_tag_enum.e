-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PREV_PTR_TAG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = zero_digit_tag_low_level)  or else
				(a_value = one_digit_tag_low_level)  or else
				(a_value = stop_tag_low_level)  or else
				(a_value = full_stop_tag_low_level) )
		end

feature -- Setters
	default_create,
	set_zero_digit_tag is
		do
			value := zero_digit_tag_low_level
		end

	set_one_digit_tag is
		do
			value := one_digit_tag_low_level
		end

	set_stop_tag is
		do
			value := stop_tag_low_level
		end

	set_full_stop_tag is
		do
			value := full_stop_tag_low_level
		end

feature -- Queries
	zero_digit_tag: BOOLEAN is
		do
			Result := (value=zero_digit_tag_low_level)
		end

	one_digit_tag: BOOLEAN is
		do
			Result := (value=one_digit_tag_low_level)
		end

	stop_tag: BOOLEAN is
		do
			Result := (value=stop_tag_low_level)
		end

	full_stop_tag: BOOLEAN is
		do
			Result := (value=full_stop_tag_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	zero_digit_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "zeroDigitTag"
 			}"
 		end

	one_digit_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "oneDigitTag"
 			}"
 		end

	stop_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "stopTag"
 			}"
 		end

	full_stop_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fullStopTag"
 			}"
 		end


end -- class PREV_PTR_TAG_ENUM