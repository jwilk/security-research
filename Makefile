export LC_ALL=C

rst_files = $(wildcard *.rst)
stamp_files = $(rst_files:.rst=.stamp)

.PHONY: check
check: $(stamp_files)

%.stamp: %.rst
	rst2xml $(<) > /dev/null
	grep -E '^[.][.] [0-9]{4}-[0-9]{2}-[0-9]{2}' $(<) \
	| sort -c
	touch $(@)

.PHONY: clean
clean:
	rm -f *.stamp

# vim:ts=4 sts=4 sw=4 noet
