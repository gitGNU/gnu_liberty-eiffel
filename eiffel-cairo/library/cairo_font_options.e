indexing
	description: "Font Options -- How a font should be rendered."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "1.2.4"

class CAIRO_FONT_OPTIONS

inherit
	C_STRUCT redefine copy, is_equal end 
	DISPOSABLE
	HASHABLE
	
insert
	CAIRO_FONT_OPTIONS
	CAIRO_ANTIALIAS_TYPE
	CAIRO_HINT_STYLE
	CAIRO_SUBPIXEL_ORDER
	
creation make, from_external_pointer

feature {} -- Creation
	make is
			-- Create a new font options object with all options initialized to
			-- default values.
		do
			from_external_pointer(cairo_font_options_create)
			-- cairo_font_options_create returns a newly allocated
			-- cairo_font_options_t. Free with cairo_font_options_destroy(). This
			-- function always returns a valid pointer; if memory cannot be
			-- allocated, then a special error object is returned where all
			-- operations on the object do nothing. You can check for this with
			-- cairo_font_options_status().
		end

	copy (another: like Current) is
			-- Allocates a new font options object copying the option values from
			-- `another'.
		do
			from_external_pointer(cairo_font_options_copy(another.handle))
			-- cairo_font_options_copy returns a newly allocated
			-- cairo_font_options_t. Free with cairo_font_options_destroy(). This
			-- function always returns a valid pointer; if memory cannot be
			-- allocated, then a special error object is returned where all
			-- operations on the object do nothing. You can check for this with
			-- cairo_font_options_status().
		end

	dispose is
			-- Destroys a cairo_font_options_t
		do
			cairo_font_options_destroy(handle)
			handle:=default_pointer
		end

	status: INTEGER is
			-- The status of this font options object 
		do
			Result:=cairo_font_options_status(handle)
		ensure valid: ((Result = cairo_status_success) or else
							(Result = cairo_status_no_memory))
		end

	merge (another: CAIRO_FONT_OPTIONS) is
			-- Merges non-default options from other into options,
			-- replacing existing values. This operation can be thought
			-- of as somewhat similar to compositing other onto options
			-- with the operation of `cairo_operation_over'.
		require another_not_void: another /= Void
		do
			cairo_font_options_merge(handle,another.handle)
		end

	hash_code: INTEGER_64 is
			-- An hash for the font options object; this value will be useful when
			--   storing an object containing a cairo_font_options_t in a hash table.

			-- Note: the hash value for the font options object is a
			-- 64-bit unsigned value_ it can be cast to a 32-bit type if
			-- a 32-bit hash value is needed.
		do
			Result:=cairo_font_options_hash(handle)
		end

	is_equal (another: like Current): BOOLEAN is
			-- Do all fields of the two font options objects match?
		do
			Result:=(cairo_font_options_equal(handle,another.handle).to_boolean)
		end

	set_antialias (an_antialias: INTEGER) is
			-- Sets the antiliasing mode for the font options
			-- object. This specifies the type of antialiasing to do when
			-- rendering text.
		require valid_antialias: is_valid_antialias_type (an_antialias)
		do
			cairo_font_options_set_antialias(handle,an_antialias)
		end

	antialias: INTEGER is
			-- the antialising mode for the font options object.
		do
			Result:=cairo_font_options_get_antialias(handle)
		require valid_antialias: is_valid_antialias_type (Result)
		end

	set_subpixel_order (a_subpixel_order: INTEGER) is
			-- Sets the subpixel order for the font options object. The
			-- subpixel order specifies the order of color elements
			-- within each pixel on the display device when rendering
			-- with an antialiasing mode of
			-- `cairo_antialias_subpixel'. See CAIRO_SUBPIXEL_ORDER for
			-- full details.
		require is_valid_subpixel_order: is_valid_subpixel_order (a_subpixel_order)
		do
			cairo_font_options_set_subpixel_order(handle,a_subpixel_order)
		end

	subpixel_order: INTEGER is
			-- the subpixel order for the font options object. See the
			-- documentation for `CAIRO_SUBPIXEL_ORDER' for full details.

		do
			Result:=cairo_font_options_get_subpixel_order(handle)
		end	

	set_hint_style (a_style: INTEGER) is
			-- Sets the hint style for font outlines for the font options
			-- object. This controls whether to fit font outlines to the
			-- pixel grid, and if so, whether to optimize for fidelity or
			-- contrast. See `CAIRO_HINT_STYLE' for full details.
		require 	is_valid_hint_style: is_valid_hint_style (a_style)
		do
			cairo_font_options_set_hint_style(handle,a_style)
		end

	hint_style: INTEGER is
			-- the hint style for font outlines for the font options
			-- object. See `CAIRO_HINT_STYLE' for full details.
		do
			Result:=cairo_font_options_get_hint_style(handle)
		ensure is_valid_hint_style: is_valid_hint_style (Result)
		end

	set_hint_metrics (a_metrics: INTEGER) is
			-- Sets the metrics hinting mode for the font options
			-- object. This controls whether metrics are quantized to
			-- integer values in device units. See `CAIRO_HINT_METRICS'
			-- for full details.
		require is_valid_hint_metrics: is_valid_hint_metrics (a_metrics)
		do
			cairo_font_options_set_hint_metrics(handle, a_metrics)
		end

	hint_metrics: INTEGER is
			-- the metrics hinting mode for the font options object. See
			-- `CAIRO_HINT_METRICS' for full details.
		do
			Result:=cairo_font_options_get_hint_metrics(handle)
		end
end -- class CAIRO_FONT_OPTIONS
