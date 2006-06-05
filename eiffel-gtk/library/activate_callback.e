indexing
	description: "Generic callback for the activate signal"
	copyright: "[
					Copyright (C) 2006 Paolo redaelli, eiffel-libraries team,  GTK+ team and others
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
					]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"
	
class ACTIVATE_CALLBACK
inherit
	CALLBACK
		redefine object, callback
		end
creation make 
feature
	object: GTK_BUTTON

feature
	callback (instance: POINTER) is --  a_button: GTK_BUTTON) is
		do
			-- Empty by design.
			print ("Callback: instance=") print (instance.to_string)	print ("%N")
			create object.from_external_pointer (instance)
			procedure.call ([object])
		end

	connect (an_object: GTK_BUTTON; a_procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]]) is
		do
			debug
				print ("ACTIVATE_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
			handler_id := g_signal_connect_closure (an_object.handle,
																 signal_name.to_external,
																 handle,
																 0 -- i.e. call it before default handler
																 )
			procedure:=a_procedure
		end

		signal_name: STRING is "activate"

	procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]]
end
