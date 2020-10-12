/*
-Practico 1
-Ejercicio 6

Decodificador para generar las seniales de control

Mapeo de Instrucciones:
    Inst : Opcode
    LDUR : 111_1100_0010
    STUR : 111_1100_0000
    CBZ  : 101_1010_0???
    ADD  : 100_0101_1000
    SUB  : 110_0101_1000
    AND  : 100_0101_0000
    ORR  : 101_0101_0000
    B    : 000_101?_????
*/

module maindec (
    input  logic [10:0] Op,
    output logic        Reg2Loc,
    output logic        ALUSrc,
    output logic        MemtoReg,
    output logic        RegWrite,
    output logic        MemRead,
    output logic        MemWrite,
    output logic        Branch,
    output logic [1:0]  ALUOp,
    output logic        Uncondbranch
);

    always_comb
    begin
        Uncondbranch = 1'b0;

        casez(Op)
            11'b111_1100_0010: begin // LDUR
                Reg2Loc  = 1'b0;
                ALUSrc   = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead  = 1'b1;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            11'b111_1100_0000: begin // STUR
                Reg2Loc  = 1'b1;
                ALUSrc   = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b1;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            11'b101_1010_0???: begin // CBZ
                Reg2Loc  = 1'b1;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b1;
                ALUOp    = 2'b01;
            end

            11'b100_0101_1000: begin // ADD (R-format)
                Reg2Loc  = 1'b0;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            11'b110_0101_1000: begin // SUB (R-format)
                Reg2Loc  = 1'b0;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            11'b100_0101_0000: begin // AND (R-format)
                Reg2Loc  = 1'b0;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            11'b101_0101_0000: begin // ORR (R-format)
                Reg2Loc  = 1'b0;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            11'b000_101?_????: begin // B (B-format)
                Reg2Loc      = 1'b0;
                ALUSrc       = 1'b0;
                MemtoReg     = 1'b0;
                RegWrite     = 1'b1;
                MemRead      = 1'b0;
                MemWrite     = 1'b0;
                Branch       = 1'b0;
                ALUOp        = 2'b00;
                Uncondbranch = 1'b1;
            end

            default: begin           // undefined (all in 0)
                Reg2Loc  = 1'b0;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end
        endcase
    end

endmodule
