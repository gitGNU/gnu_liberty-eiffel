-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_TYPE_RESOLVER

insert
	LIBERTY_AST_HANDLER
		undefine out_in_tagged_out_memory
		end

feature {ANY}
	type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
			-- Try to find a class using the resolver context. Depending on the resolver, anchors may be resolved
			-- or not.
		do
			Result := lookup_type(type_definition)
			if Result = Void and then parent /= Void then
				Result := parent.type(type_definition)
			end
			if Result = Void and then type_definition.is_like_entity and then anchor_factory /= Void then
				Result := anchor_factory.item([type_definition.entity_anchor])
			end
		end

	export_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
			-- More lenient version, reserved for exports. If the class is not found and is not used anywhere but
			-- in export clauses then there will not be any error (a dummy object will be returned).
		require
			not type_definition.is_anchor
		do
			if type_definition.is_like_entity and then anchor_factory /= Void then
				Result := anchor_factory.item([type_definition.entity_anchor])
			end
			if Result = Void then
				Result := lookup_export_type(type_definition)
				if Result = Void and then parent /= Void then
					Result := parent.export_type(type_definition)
				end
			end
			if Result = Void then
				create {LIBERTY_UNKNOWN_TYPE} Result.make(type_definition.type_name.image.image.intern)
			end
		ensure
			Result /= Void
		end

	position (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_POSITION is
			-- Try to find the position of the type definition. Useful for error reporting.
		do
			Result := lookup_position(type_definition)
			if Result = Void and then parent /= Void then
				Result := parent.position(type_definition)
			end
			if Result = Void then
				Result := errors.unknown_position
			end
		ensure
			Result /= Void
		end

feature {LIBERTY_TYPE_FEATURES_LOADER}
	set_anchor_factory (a_anchor_factory: like anchor_factory) is
		require
			a_anchor_factory /= Void
		do
			anchor_factory := a_anchor_factory
		ensure
			anchor_factory = a_anchor_factory
		end

	unset_anchor_factory is
		do
			anchor_factory := Void
		ensure
			anchor_factory = Void
		end

feature {LIBERTY_TYPE_LOOKUP}
	set_parent (a_parent: like parent) is
		do
			parent := a_parent
		ensure
			parent = a_parent
		end

	parent: LIBERTY_TYPE_RESOLVER

feature {}
	lookup_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
			-- May be Void if the type is not resolved.
		deferred
		end

	lookup_export_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
			-- May be Void if the type is not resolved.
		deferred
		end

	lookup_position (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_POSITION is
			-- May be Void if the position cannot be calculated.
		deferred
		end

feature {}
	errors: LIBERTY_ERRORS
	anchor_factory: FUNCTION[TUPLE[LIBERTY_AST_ENTITY_NAME], LIBERTY_ANCHORED_TYPE]

end -- class LIBERTY_TYPE_RESOLVER
