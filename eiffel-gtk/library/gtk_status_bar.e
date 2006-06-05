indexing
	description: "GtkStatusbar — Report messages of minor importance to the user"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision: "$Revision:$"


			-- Note: since I haven't still understood the utility of the
			-- context ids I completely hide this aspect from the Eiffel
			-- wrapper. Paolo 2006-04-22

	
			-- Description

			-- A GtkStatusbar is usually placed along the bottom of an
			-- application's main GtkWindow. It may provide a regular
			-- commentary of the application's status (as is usually the
			-- case in a web browser, for example), or may be used to
			-- simply output a message when the status changes, (when an
			-- upload is complete in an FTP client, for example). It may
			-- also have a resize grip (a triangular area in the lower
			-- right corner) which can be clicked on to resize the window
			-- containing the statusbar.

			-- Status bars in Gtk+ maintain a stack of messages. The
			-- message at the top of the each bar's stack is the one that
			-- will currently be displayed.

			-- Any messages added to a statusbar's stack must specify a
			-- context_id that is used to uniquely identify the source of
			-- a message. This context_id can be generated by
			-- gtk_statusbar_get_context_id(), given a message and the
			-- statusbar that it will be added to. Note that messages are
			-- stored in a stack, and when choosing which message to
			-- display, the stack structure is adhered to, regardless of
			-- the context identifier of a message.

			-- Status bars are created using gtk_statusbar_new().

			-- Messages are added to the bar's stack with
			-- gtk_statusbar_push().

			-- The message at the top of the stack can be removed using
			-- gtk_statusbar_pop(). A message can be removed from
			-- anywhere in the stack if its message_id was recorded at
			-- the time it was added. This is done using
			-- gtk_statusbar_remove().

class GTK_STATUS_BAR
inherit
	-- Could also be: STACK[STRING] redefine make, with_capacity, push,
	-- pop end  since it provide stack like behaviour
	GTK_HBOX rename make as make_hbox end 
		-- Object Hierarchy

		--   GObject
		--    +----GInitiallyUnowned
		--          +----GtkObject
		--                +----GtkWidget
		--                      +----GtkContainer
		--                            +----GtkBox
		--                                  +----GtkHBox
		--                                        +----GtkStatusbar

		-- Implemented Interfaces: GtkStatusbar implements
		-- AtkImplementorIface.
	
creation make
feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof()"
		end

feature {NONE} -- Creation
	make is
			-- Creates a new GtkStatusbar ready for messages.
		do
			handle := gtk_statusbar_new
			-- create context_ids.make
			create message_ids.make
			context_id := gtk_statusbar_get_context_id (handle, eiffel_context_id.to_external)
			store_eiffel_wrapper
		end

feature {NONE} -- Context ids
	context_id: INTEGER
	eiffel_context_id: STRING  is "Eiffel GTK_STATUS_BAR"
	-- 	context_ids: STACK[INTEGER]
	-- 			-- Note: it should be STACK[NATURAL] since context ids are guint
	
	-- 	set_context_id (a_context_description: STRING) is
	-- 			-- Get a new context identifier, given a description of the
	-- 			-- actual context (`a_context_description').
	-- 		require valid_description: a_context_description /= Void
	-- 		do
	-- 			context_ids.push (gtk_statusbar_get_context_id (handle, a_context_description.to_external))
	-- 		ensure positive: context_ids.top >= 0
	-- 		end
	
feature -- Message ids
	message_ids: STACK[INTEGER]
			-- Note: it should be STACK[NATURAL] since message ids are guint

	is_empty: BOOLEAN is
		do
			Result :=message_ids.is_empty
		end
	
feature -- Stack like behaviour
	push (a_message: STRING) is
			-- Pushes `a_message' onto a statusbar's stack.

			-- The last context id will be used
		do
			message_ids.push (gtk_statusbar_push (handle, context_id,
															  a_message.to_external)
									-- gtk_statusbar_push returns the message's
									-- new message id for use with
									-- gtk_statusbar_remove().
									)
		end

	pop is
			-- Pop last message with current (i.e.: last) context id.
		do
			gtk_statusbar_pop (handle, context_id);
			-- Removes the message at the top of a GtkStatusBar's stack.
		end
-- gtk_statusbar_remove ()

-- void        gtk_statusbar_remove            (GtkStatusbar *statusbar,
--                                              guint context_id,
--                                              guint message_id);

-- Forces the removal of a message from a statusbar's stack. The exact context_id and message_id must be specified.
-- statusbar : 	a GtkStatusBar.
-- context_id : 	a context identifier.
-- message_id : 	a message identifier, as returned by gtk_statusbar_push().
-- gtk_statusbar_set_has_resize_grip ()

-- void        gtk_statusbar_set_has_resize_grip
--                                             (GtkStatusbar *statusbar,
--                                              gboolean setting);

-- Sets whether the statusbar has a resize grip. TRUE by default.
-- statusbar : 	a GtkStatusBar.
-- setting : 	TRUE to have a resize grip.
-- gtk_statusbar_get_has_resize_grip ()

-- gboolean    gtk_statusbar_get_has_resize_grip
--                                             (GtkStatusbar *statusbar);

-- Returns whether the statusbar has a resize grip.
-- statusbar : 	a GtkStatusBar.
-- Returns : 	TRUE if the statusbar has a resize grip.



feature -- Style Properties

--   "shadow-type"          GtkShadowType         : Read

feature -- Signals

-- "text-popped"
--             void        user_function      (GtkStatusbar *statusbar,
--                                             guint         context_id,
--                                             gchar        *text,
--                                             gpointer      user_data)       : Run last
-- "text-pushed"
--             void        user_function      (GtkStatusbar *statusbar,
--                                             guint         context_id,
--                                             gchar        *text,
--                                             gpointer      user_data)       : Run last

-- Property Details
-- The "has-resize-grip" property

--   "has-resize-grip"      gboolean              : Read / Write

-- Whether the statusbar has a grip for resizing the toplevel window.

-- Default value: TRUE

-- Since 2.4
-- Style Property Details
-- The "shadow-type" style property

--   "shadow-type"          GtkShadowType         : Read

-- Style of bevel around the statusbar text.

-- Default value: GTK_SHADOW_IN
-- Signal Details
-- The "text-popped" signal

-- void        user_function                  (GtkStatusbar *statusbar,
--                                             guint         context_id,
--                                             gchar        *text,
--                                             gpointer      user_data)       : Run last

-- Is emitted whenever a new message is popped off a statusbar's stack.
-- statusbar : 	the object which received the signal.
-- context_id : 	the context id of the relevant message/statusbar.
-- text : 	the message that was just popped.
-- user_data : 	user data set when the signal handler was connected.
-- The "text-pushed" signal

-- void        user_function                  (GtkStatusbar *statusbar,
--                                             guint         context_id,
--                                             gchar        *text,
--                                             gpointer      user_data)       : Run last

-- Is emitted whenever a new message gets pushed onto a statusbar's stack.
-- statusbar : 	the object which received the signal.
-- context_id : 	the context id of the relevant message/statusbar.
-- text : 	the message that was pushed.
-- user_data : 	user data set when the signal handler was connected.
-- See Also

-- GtkDialog 	

-- another way of reporting information to the user.
feature {NONE} -- External calls

	gtk_statusbar_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_statusbar_get_context_id (a_statusbar, a_context_description: POINTER): INTEGER  is
			-- Note Result shall be NATURAL since it's a guint
		external "C use <gtk/gtk.h>"
		ensure positive: Result > 0
		end
	
	gtk_statusbar_push (a_statusbar: POINTER; a_context_id: INTEGER;
							  a_text: POINTER): INTEGER  is
		require
			-- Note: `a_context_id' is a guint and shall be a NATURAL
			positive_context_id: a_context_id > 0 
		external "C use <gtk/gtk.h>"
		ensure positive: Result > 0
		end

	gtk_statusbar_pop (a_statusbar: POINTER; a_context_id: INTEGER)  is
		require
			-- Note: `a_context_id' is a guint and shall be a NATURAL
			positive_context_id: a_context_id > 0 
		external "C use <gtk/gtk.h>"
		end

	gtk_statusbar_remove (a_statusbar: POINTER; a_context_id,
								 a_message_id: INTEGER)  is
		require
			-- Note: `a_context_id' and `a_message_id' are guint and shall be NATURAL
			positive_context_id: a_context_id > 0 
			positive_message_id: a_message_id > 0 
		external "C use <gtk/gtk.h>"
		end

	gtk_statusbar_set_has_resize_grip (a_statusbar: POINTER; a_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_statusbar_get_has_resize_grip (a_statusbar: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

end
