// ALU CONTROL DECODER
`include "macros.sv"

module aludec (
    input  logic [10:0] funct,  
    input  logic [1:0]  aluop,  
    output logic [3:0]  alucontrol
);
    always_comb
        if (aluop == 2'b00) alucontrol = `A_PLUS_B;          // LDUR or STUR		
        else if (aluop == 2'b01) alucontrol = `PASS_INPUT_B; //CBZ
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `ADD)) alucontrol = `A_PLUS_B;
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `SUB)) alucontrol = `A_MINUS_B;
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `AND)) alucontrol = `A_AND_B;
        else if(((aluop == 2'b10) | (aluop == 2'b11)) & (funct == `ORR)) alucontrol = `A_OR_B;
        else alucontrol = 4'b0000;

endmodule
