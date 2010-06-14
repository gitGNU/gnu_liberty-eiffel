-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIONGROUP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_action_group_set_translate_func (an_action_group: POINTER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gtk_action_group_set_translate_func (node at line 452)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_translate_func"
		}"
		end

	gtk_action_group_new (a_name: POINTER): POINTER is
 		-- gtk_action_group_new (node at line 481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_new"
		}"
		end

	-- `hidden' function _gtk_action_group_emit_pre_activate skipped.
	-- `hidden' function _gtk_action_group_emit_connect_proxy skipped.
	gtk_action_group_get_visible (an_action_group: POINTER): INTEGER_32 is
 		-- gtk_action_group_get_visible (node at line 3352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_visible"
		}"
		end

	-- `hidden' function _gtk_action_group_emit_post_activate skipped.
	gtk_action_group_add_radio_actions (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL_32; a_value: INTEGER_32; an_on_change: POINTER; an_user_data: POINTER) is
 		-- gtk_action_group_add_radio_actions (node at line 8743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_radio_actions"
		}"
		end

	gtk_action_group_set_visible (an_action_group: POINTER; a_visible: INTEGER_32) is
 		-- gtk_action_group_set_visible (node at line 10088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_visible"
		}"
		end

	gtk_action_group_remove_action (an_action_group: POINTER; an_action: POINTER) is
 		-- gtk_action_group_remove_action (node at line 10316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_remove_action"
		}"
		end

	gtk_action_group_add_action (an_action_group: POINTER; an_action: POINTER) is
 		-- gtk_action_group_add_action (node at line 10695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_action"
		}"
		end

	gtk_action_group_set_translation_domain (an_action_group: POINTER; a_domain: POINTER) is
 		-- gtk_action_group_set_translation_domain (node at line 15606)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_translation_domain"
		}"
		end

	-- `hidden' function _gtk_action_group_emit_disconnect_proxy skipped.
	gtk_action_group_add_toggle_actions (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL_32; an_user_data: POINTER) is
 		-- gtk_action_group_add_toggle_actions (node at line 19270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_toggle_actions"
		}"
		end

	gtk_action_group_add_toggle_actions_full (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL_32; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_action_group_add_toggle_actions_full (node at line 23666)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_toggle_actions_full"
		}"
		end

	gtk_action_group_get_type: NATURAL_32 is
 		-- gtk_action_group_get_type (node at line 24218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_type()"
		}"
		end

	gtk_action_group_add_radio_actions_full (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL_32; a_value: INTEGER_32; an_on_change: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_action_group_add_radio_actions_full (node at line 24899)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_radio_actions_full"
		}"
		end

	gtk_action_group_get_name (an_action_group: POINTER): POINTER is
 		-- gtk_action_group_get_name (node at line 26538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_name"
		}"
		end

	gtk_action_group_add_actions (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL_32; an_user_data: POINTER) is
 		-- gtk_action_group_add_actions (node at line 27545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_actions"
		}"
		end

	gtk_action_group_add_actions_full (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL_32; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_action_group_add_actions_full (node at line 28774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_actions_full"
		}"
		end

	gtk_action_group_list_actions (an_action_group: POINTER): POINTER is
 		-- gtk_action_group_list_actions (node at line 30643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_list_actions"
		}"
		end

	gtk_action_group_set_sensitive (an_action_group: POINTER; a_sensitive: INTEGER_32) is
 		-- gtk_action_group_set_sensitive (node at line 31391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_sensitive"
		}"
		end

	gtk_action_group_get_action (an_action_group: POINTER; an_action_name: POINTER): POINTER is
 		-- gtk_action_group_get_action (node at line 36156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_action"
		}"
		end

	gtk_action_group_translate_string (an_action_group: POINTER; a_string: POINTER): POINTER is
 		-- gtk_action_group_translate_string (node at line 36428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_translate_string"
		}"
		end

	gtk_action_group_add_action_with_accel (an_action_group: POINTER; an_action: POINTER; an_accelerator: POINTER) is
 		-- gtk_action_group_add_action_with_accel (node at line 36443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_action_with_accel"
		}"
		end

	gtk_action_group_get_sensitive (an_action_group: POINTER): INTEGER_32 is
 		-- gtk_action_group_get_sensitive (node at line 37508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_sensitive"
		}"
		end


end -- class GTKACTIONGROUP_EXTERNALS