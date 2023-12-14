# configuring executable file for our language
# equivalent to doing gcc ./a.out
exec = cw.out 
# to run source files
sources = $(wildcard src/*.c)
# to run objects	
objects = $(sources:.c=.o)
# flags help us debug the code for our language
flags = -g 

#gcc is to run c compiler
$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@
# C:\ProgramData\chocolatey\bin\cw
# /usr/local/bin/cw
install:
	make
	cp ./cw.out C:\ProgramData\chocolatey\bin\cw

#clean command to help us recompile our language if were having problems
clean:
	-rm *.out
	-rm *.o
	-rm src/*.o
