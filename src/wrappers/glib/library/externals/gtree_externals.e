-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTREE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_tree_traverse (a_tree: POINTER; a_traverse_func: POINTER; a_traverse_type: INTEGER; an_user_data: POINTER) is
 		-- g_tree_traverse (node at line 81)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_traverse"
		}"
		end

	g_tree_search (a_tree: POINTER; a_search_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_tree_search (node at line 1314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_search"
		}"
		end

	g_tree_nnodes (a_tree: POINTER): INTEGER_32 is
 		-- g_tree_nnodes (node at line 1565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_nnodes"
		}"
		end

	g_tree_destroy (a_tree: POINTER) is
 		-- g_tree_destroy (node at line 1794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_destroy"
		}"
		end

	g_tree_insert (a_tree: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- g_tree_insert (node at line 2014)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_insert"
		}"
		end

	g_tree_new (a_key_compare_func: POINTER): POINTER is
 		-- g_tree_new (node at line 2380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_new"
		}"
		end

	g_tree_ref (a_tree: POINTER): POINTER is
 		-- g_tree_ref (node at line 3020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_ref"
		}"
		end

	g_tree_remove (a_tree: POINTER; a_key: POINTER): INTEGER_32 is
 		-- g_tree_remove (node at line 3624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_remove"
		}"
		end

	g_tree_unref (a_tree: POINTER) is
 		-- g_tree_unref (node at line 3771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_unref"
		}"
		end

	g_tree_height (a_tree: POINTER): INTEGER_32 is
 		-- g_tree_height (node at line 4922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_height"
		}"
		end

	g_tree_replace (a_tree: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- g_tree_replace (node at line 5267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_replace"
		}"
		end

	g_tree_new_full (a_key_compare_func: POINTER; a_key_compare_data: POINTER; a_key_destroy_func: POINTER; a_value_destroy_func: POINTER): POINTER is
 		-- g_tree_new_full (node at line 5483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_new_full"
		}"
		end

	g_tree_steal (a_tree: POINTER; a_key: POINTER): INTEGER_32 is
 		-- g_tree_steal (node at line 5885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_steal"
		}"
		end

	g_tree_foreach (a_tree: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_tree_foreach (node at line 6177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_foreach"
		}"
		end

	g_tree_lookup_extended (a_tree: POINTER; a_lookup_key: POINTER; an_orig_key: POINTER; a_value: POINTER): INTEGER_32 is
 		-- g_tree_lookup_extended (node at line 6363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_lookup_extended"
		}"
		end

	g_tree_lookup (a_tree: POINTER; a_key: POINTER): POINTER is
 		-- g_tree_lookup (node at line 6580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_lookup"
		}"
		end

	g_tree_new_with_data (a_key_compare_func: POINTER; a_key_compare_data: POINTER): POINTER is
 		-- g_tree_new_with_data (node at line 6739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tree_new_with_data"
		}"
		end


end -- class GTREE_EXTERNALS
