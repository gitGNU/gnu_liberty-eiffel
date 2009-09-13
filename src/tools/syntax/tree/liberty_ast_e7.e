class LIBERTY_AST_E7

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	e8: LIBERTY_AST_E8 is
		do
			Result ::= nodes.item(0)
		end

	r8: LIBERTY_AST_R8 is
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is 2

	name: STRING is "e7"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_E7_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_e7(Current)
		end

end