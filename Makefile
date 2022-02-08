export LC_ALL=C

rst2xml = $(notdir $(shell command -v rst2xml || echo rst2xml.py))
rst_files = $(wildcard [0-9][0-9][0-9][0-9] README todo)
stamp_files = $(addprefix stamp/,$(rst_files))

.PHONY: check
check: $(stamp_files)

stamp/.directory:
	mkdir -p $(dir $@)
	touch $(@)

stamp/%: % stamp/.directory
	$(rst2xml) --input-encoding=UTF-8 --strict $(<) > /dev/null
	grep -E '^[.][.] [0-9]{4}-[0-9]{2}-[0-9]{2}' $(<) \
	| sort -c
	touch $(@)

.PHONY: clean
clean:
	rm -rf stamp

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
