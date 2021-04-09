RED=\033[0;31m

NOCLR=\033[0m

GREEN=\033[1;34m

OS=$(shell uname -s)

FLAGS=-felf64

PROGNAME=socket

CLEAN=*.o build

OBJ=socket.o 

MAIN=socket.asm 


build/$(PROGNAME): build/$(OBJ)
ifneq ($(OS), Linux) 
	@echo "$(RED)Not supported environment $(NOCLR)"
endif
	@echo "Converting $< to $@ $(NOCLR)"	
	@ld -o  $@ $<
	@echo "Done!$(NOCLR)" 	
       		
build/%.o: %.asm 
ifneq ($(OS), Linux) 
	@echo "$(RED)Not supported environment $(NOCLR)" 
endif
	@if [ ! -d "build" ]; then \
	echo "$(RED)Making build dir $(NOCLR)"; \
	mkdir build; \
	fi
	@echo "Converting $< to $@ $(NOCLR)"	
	@nasm $(FLAGS) -o $@ $<
clean:
	rm -rf $(CLEAN)
