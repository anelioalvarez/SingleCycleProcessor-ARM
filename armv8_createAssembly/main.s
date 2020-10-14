/*
Expected mem.dump after run simulation
using this assembly code:

Addr : Data
0    : 0x0
1    : 0x1
2    : 0x2
3    : 0x0
4    : 0x0
5    : 0x5
6    : 0x6
7    : 0x1
10   : 0xA
11   : 0xFE0
27   : 0x1B
28   : 0x1C
All others at 0x0 

*/


.text
.org 0x0000

stur x0,[x0]
stur x1,[x0,#8]
stur x2,[x0,#16]
br x24
stur x3,[x0,#24]
stur x4,[x0,#32]
stur x5,[x0,#40]
stur x6,[x0,#48]
ldur x7,[x0]
ldur x8,[x0,#8]
ldur x9,[x0,#16]
b label2

label3:
	ldur x10,[x0,#24]
	ldur x11,[x0,#32]
	ldur x12,[x0,#40]
	ldur x13,[x0,#48]
	sub x14,x14,x14
	cbz x14, label1
	sub x15,x0,x1

label1:
	add x15,x0,x1
	stur x15, [x0,#56]
	b label4

label2:
	stur x10, [x0,#80]
	add x11, x0, 4064
	stur x11, [x0,#88]
	stur x27, [x0,#216]
	b label3
	
label4: stur x28, [x0,#224]

infloop:
	cbz xzr, infloop
	
