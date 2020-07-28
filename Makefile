CC?=riscv64-unknown-elf-gcc
OBJDUMP?=$(patsubst %gcc,%objdump,$(CC))
SUBMAKEFILES:=$(wildcard */Makefile)
TESTS:=$(subst /,,$(dir $(SUBMAKEFILES)))
RESULTS:=$(addsuffix .log,$(addprefix result/,$(TESTS)))
PWD=$(shell pwd)
SED?=sed

export CC
export OBJDUMP

all: result.log
	@echo "=========================Test Report========================="
	@cat $< | grep --color=auto 'FAIL\|$$'
	@if grep -q FAIL $<; then exit 1; fi

result.log: $(RESULTS)
	$(SED) -s '$G' $(RESULTS) > $@
	echo "" >> $@

result/%.log:
	$(eval $@_TESTNAME := $(subst .log,,$(notdir $@)))
	@mkdir -p result
	- cd $($@_TESTNAME) && $(MAKE) ; rv=$$? ; cd -; if [ $$rv -ne 0 ]; then \
		printf "%32s ... FAIL" $($@_TESTNAME) > $@; \
		else \
		printf "%32s ... PASS" $($@_TESTNAME) > $@; \
	fi;

clean:
	rm result -rf result.log
	for i in $(subst /Makefile,,$(SUBMAKEFILES)); \
	do \
	  cd $$i && $(MAKE) clean && cd -; \
	done
