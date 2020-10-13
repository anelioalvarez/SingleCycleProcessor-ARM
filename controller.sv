// CONTROLLER

module controller(
    input  logic [10:0] instr,
    output logic [3:0]  AluControl,						
    output logic        reg2loc, regWrite, AluSrc, Branch,
    output logic        memtoReg, memRead, memWrite, Uncondbranch, BranchSrc
);

    logic [1:0] AluOp_s;

    maindec decPpal(
        .Op(instr),
        .Reg2Loc(reg2loc),
        .ALUSrc(AluSrc),
        .MemtoReg(memtoReg),
        .RegWrite(regWrite),
        .MemRead(memRead),
        .MemWrite(memWrite),
        .Branch(Branch),
        .ALUOp(AluOp_s),
        .Uncondbranch(Uncondbranch),
        .BranchSrc(BranchSrc)
    );
    
    aludec decAlu(
        .funct(instr),
        .aluop(AluOp_s),
        .alucontrol(AluControl)
    );

endmodule
