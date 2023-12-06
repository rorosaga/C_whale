# configuring executable file for our language
# equivalent to doing gcc ./a.out
exec = cw.out 
# to run source files
sources = $(wildcard src/*.c)
# to run objects	
objects = $(sources:.c=.o)
# flags help us debug the code for our language
# Add -arch arm64 if compiling on Apple Silicon Mac
flags = -g -arch arm64

# gcc is to run c compiler
$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

# Updated to remove dependency on .h files
%.o: %.c
	gcc -c $(flags) $< -o $@
# C:\ProgramData\chocolatey\bin\cw
# /usr/local/bin/cw
install:
	make
	cp ./cw.out /usr/local/bin/cw

# clean command to help us recompile our language if we're having problems
clean:
	-rm *.out
	-rm *.o
	-rm src/*.o



