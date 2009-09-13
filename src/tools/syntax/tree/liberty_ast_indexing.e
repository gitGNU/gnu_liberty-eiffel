class LIBERTY_AST_INDEXING

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INDEXING_CLAUSE]
		export
			{ANY} valid_index, count, lower, upper
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name (index: INTEGER): STRING is
		require
			valid_index(index)
		do
			Result := item(index).entity_name.image
		end

	string (index: INTEGER): STRING is
		require
			valid_index(index)
		do
			Result := item(index).string.image
		end

feature {ANY}
	name: STRING is "Indexing"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_INDEXING_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_indexing(Current)
		end

end