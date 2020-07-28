OBJDUMP:=riscv64-unknown-elf-objdump
all:
	$(CC) -march=rv64gcv -mabi=lp64d vsetvli.S -c
	INST=`$(OBJDUMP) -d vsetvli.o |grep vsetvli | tail -1 | awk '{print $$2}'`; \
	if [ "$$INST" == "00807057" ]; then echo "OK"; else  echo "fail"; fi

clean:
	rm *.o -f
