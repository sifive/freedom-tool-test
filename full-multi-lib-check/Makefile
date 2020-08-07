COMBS:=$(shell ./comb-gen)
TARGET:=$(addsuffix .log, $(COMBS))

all: $(TARGET)

%.log:
	$(CC) \
	  -march=$(word 1,$(subst -, ,$(subst .log,,$@))) \
	  -mabi=$(word 2,$(subst -, ,$(subst .log,,$@))) \
	  main.c -o /dev/null &> $@

clean:
	rm $(TARGET) -f
