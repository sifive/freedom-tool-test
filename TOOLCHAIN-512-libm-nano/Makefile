all:
	$(CC) hello.c -v -lm -specs=nano.specs 2>&1 |  grep "\-lm_nano" > /dev/null

clean:
	rm *.o a.out -f
