export LC_ALL=C

rst_files = $(wildcard [0-9][0-9][0-9][0-9] README)
stamp_files = $(addprefix stamp/,$(rst_files))

.PHONY: check
check: $(stamp_files)

stamp/%: %
	rst2xml --input-encoding=UTF-8 --strict $(<) > /dev/null
	grep -E '^[.][.] [0-9]{4}-[0-9]{2}-[0-9]{2}' $(<) \
	| sort -c
	mkdir -p $(dir $@)
	touch $(@)

.PHONY: clean
clean:
	rm -rf stamp

# vim:ts=4 sts=4 sw=4 noet
