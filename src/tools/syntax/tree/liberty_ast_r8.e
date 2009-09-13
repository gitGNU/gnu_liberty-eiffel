class LIBERTY_AST_R8

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E8]

feature {}
	is_free_operator: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.item(0).is_equal(once "KW free operator")
			end
		end

feature {ANY}
	name: STRING is "r8"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_R8_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_r8(Current)
		end

end