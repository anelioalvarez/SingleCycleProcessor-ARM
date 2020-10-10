/*
-Practico 1
-Ejercicio 3

ALU (Unidad Aritmetica Logica)

flags: zero

Mapeo de Operaciones:
	Ctrl : Operacion
	0000 : a AND b
	0001 : a OR b
	0010 : add (a+b)
	0110 : sub (a-b)
	0111 : pass input b
	1100 : a NOR b

*/

module alu (
	input  logic [63:0] a, b,
	input  logic [3:0]  ALUControl,
	output logic [63:0] result,
	output logic        zero
);

	always_comb
	begin
		case(ALUControl)
			4'b0000: result = a & b;
			4'b0001: result = a | b;
			4'b0010: result = a + b;
			4'b0110: result = a - b;
			4'b0111: result = b;
			4'b1100: result = ~(a | b);
			default: result = 64'b0;
		endcase

		zero = result ? 1'b0 : 1'b1;
	end

endmodule