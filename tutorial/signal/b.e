class B

creation {ANY}
	make

feature {ANY}
	s, s1: SIGNAL_1[INTEGER] --declare variable of SIGNAL type, never inherit form SIGNAL.

	j: INTEGER

feature {}
	make is
		do
			create s.make
			create s1.make
		end

feature {ANY}
	test (counter: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > counter
			loop
				s.emit(i)
				i := i + 1
			end
		end

	test_direct_0 (counter: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > counter
			loop
				i := i + 1
			end
		end

	test_direct_1 (counter: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > counter
			loop
				foo(i)
				i := i + 1
			end
		end

	test_direct_2 (counter: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > counter
			loop
				foo(i)
				foo(i)
				i := i + 1
			end
		end

	test_direct_3 (counter: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > counter
			loop
				foo(i)
				foo(i)
				foo(i)
				i := i + 1
			end
		end

	foo (k: INTEGER) is
		do
			j := k + 1
		end

end -- class B
