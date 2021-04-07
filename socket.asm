global _start 
section .data 
	res db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 14', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello World!', 0Dh, 0Ah, 0h
	len equ $ - res 
	opt db 1 
	addrlen db 16
	s dw 2 
	  dw 0x2923 
	  db 7fh, 0h, 0h, 01h 
	  db 0, 0, 0, 0, 0, 0, 0,
section .bss 
	buffer resb 1024   
section .text 
_start:  
	
	;socket	
	mov rax, 41 
	mov rdi, 2
	mov rsi, 1
	mov rdx, 0
	syscall 
	
	push rax
	mov r11, rax
	
	;set sock opt 
	mov rax, 54 
	mov rdi, r11 
	mov rsi, 1
 	mov rdx, 2
 	mov r10, opt
	mov r8, 4
	syscall 

	;bind
	pop rdi
	mov rax, 49
	mov rsi, s    
	mov rdx, 16	 
	syscall

	push rdi 
	;listen 
	 
	pop rdi
	mov rax, 50
	mov rsi, 3
	syscall
	push rdi 
	
	;accept 
	pop rdi 
	mov rax, 43
	mov rsi, s 
	mov rdx, addrlen
	syscall
	push rax
	
	;read 
	pop rdi 
	mov rax, 0 
	mov rsi, buffer
	mov rdx, 1024
	push rdi 
	syscall 
	
	;display 
	mov rax, 1 
	mov rdi, 1 
	mov rsi, buffer 
	mov rdx, 1024
	syscall 
	
	;write
	pop rdi 
	mov rax, 1 
	mov rsi, res 
	mov rdx, len
	syscall
  
	;exit
	mov rax, 60
	mov rdi, 0 
	syscall
