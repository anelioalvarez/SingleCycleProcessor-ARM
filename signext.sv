/*
-Practico 1
-Ejercicio 2

Extension de Signo del Inmediato

Mapeo de Instrucciones:
	Inst : Opcode
	LDUR : 111_1100_0010
	STUR : 111_1100_0000
	CBZ  : 101_1010_0???

*/

module signext (
	input  logic [31:0] a,
	output logic [63:0] y
);
	
	always_comb
	begin
		casez(a[31:21]) // take 11 bits most significant (opcode)
			11'b111_1100_0010: y = {{55{a[20]}}, a[20:12]}; // LDUR [D]
			11'b111_1100_0000: y = {{55{a[20]}}, a[20:12]}; // STUR [D]
			11'b101_1010_0???: y = {{45{a[23]}}, a[23:5]};  // CBZ  [CB]
			default: y = 64'b0;                             // not Immediate [R,]
		endcase
	end
		
endmodule