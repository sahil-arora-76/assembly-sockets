simple tcp socket on assembly 64-bit using nasm 
only for linux users

# requirements
you should have nasm and ld installed on your linux systems

# use 
```
nasm -felf64 socket.asm -o socket.o 
ld -o socket socket.o 
./socket
```
then visit localhost:9001 
