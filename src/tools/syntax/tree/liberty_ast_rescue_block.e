class LIBERTY_AST_RESCUE_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Rescue_Block"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_RESCUE_BLOCK_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_rescue_block(Current)
		end

end