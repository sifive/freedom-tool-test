MULTI_LIB_TEST:=rv32imfc-ilp32
TARGET:=$(addsuffix .log, $(MULTI_LIB_TEST))

all: $(TARGET)

%.log:
	$(CC) \
	  -march=$(word 1,$(subst -, ,$(subst .log,,$@))) \
	  -mabi=$(word 2,$(subst -, ,$(subst .log,,$@))) \
	test.c

clean:
	rm $(TARGET) a.out -f
