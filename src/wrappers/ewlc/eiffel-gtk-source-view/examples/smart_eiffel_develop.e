class SMART_EIFFEL_DEVELOP
inherit
	CLUSTER_VISITOR
	VISITOR

insert
	EXTERNAL_TOOL
	GTK

create {ANY} dummy, make

feature {ANY}
	make
		do
			bootstrap
			
			gtk.initialize
			create window.make
			window.show_all
			gtk.run_main_loop
		end

feature {ANY}
	window: GTK_WINDOW
	buffer: GTK_SOURCE_BUFFER

feature {}
	analyse_cluster (cluster: CLUSTER)
		local
			i: INTEGER
		do
			io.put_string(cluster.name)
			io.put_new_line
			class_files.clear_count
			-- cluster.read_classes_into(class_files)
			from
				i := class_files.lower
			until
				i > class_files.upper
			loop
				io.put_string(class_files.key(i).to_string)
				io.put_new_line
				i := i + 1
			end
			io.put_new_line
		end

	parse_arguments
		do
			print(once "SMART_EIFFEL_DEVELOP.parse_arguments%N")
		end

	is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
		do
			-- This is called by smart_eiffel.ace from a loop similar to the one in
			-- parse_arguments
			Result := is_version_flag(arg)
				or else is_style_warning_flag(arg)
				or else is_no_warning_flag(arg)
				or else is_verbose_flag(arg)
		end

	use_short_mode: BOOLEAN is True

	load_clusters
		local
			i: INTEGER; c: CLUSTER
		do
			from
				i := 0
			until
				i = ace.cluster_count
			loop
				c := ace.cluster_at(i)
				analyse_cluster(c)
				i := i + 1
			end
		end

feature {CLUSTER}
	visit_cluster (visited: CLUSTER)
		do
			check
				False
			end
		end
	
end -- class SMART_EIFFEL_DEVELOP
