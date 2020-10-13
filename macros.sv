// Macro definitions


// Instruction Mapping: Inst -> Opcode
`define LDUR 11'b111_1100_0010
`define STUR 11'b111_1100_0000
`define CBZ  11'b101_1010_0???
`define ADD  11'b100_0101_1000
`define SUB  11'b110_0101_1000
`define AND  11'b100_0101_0000
`define ORR  11'b101_0101_0000
`define B    11'b000_101?_????
`define BR   11'b110_1011_0000

// Operation Mapping: Operation -> Ctrl
`define A_AND_B      4'b0000
`define A_OR_B       4'b0001
`define A_PLUS_B     4'b0010
`define A_MINUS_B    4'b0110
`define PASS_INPUT_B 4'b0111
`define A_NOR_B      4'b1100
