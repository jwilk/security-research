.PHONY: check
check:
	ls *.rst \
	| xargs -t -n1 rst2pseudoxml > /dev/null

# vim:ts=4 sts=4 sw=4 noet
