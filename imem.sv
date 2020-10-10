/*
-Practico 1
-Ejercicio 4

Memoria ROM

direcciona 2^6=64 palabras de N=32 bits

actual len(ROM) = 19

*/

module imem
    #(parameter N = 32) (
    input  logic [5:0]   addr,
    output logic [N-1:0] q
);

    logic [N-1:0] ROM [0:63];

    initial // ROM initialization execute only one time, and sequentially
    begin
        ROM = '{default: '0}; // set all ROM with 0s
        /* ROM[0:18] = '{
            32'hf8000000,
            32'hf8008001,
            32'hf8010002,
            32'hf8018003,
            32'hf8020004,
            32'hf8028005,
            32'hf8030006,
            32'hf8400007,
            32'hf8408008,
            32'hf8410009,
            32'hf841800a,
            32'hf842000b,
            32'hf842800c,
            32'hf843000d,
            32'hcb0e01ce,
            32'hb400004e,
            32'hcb01000f,
            32'h8b01000f,
            32'hf803800f
        }; */

        // 2A
        /* ROM[0:7] = '{
            32'h8b1f03e9,
            32'hf8000120,
            32'h8b010000,
            32'h8b080129,
            32'hcb01014a,
            32'hb400004a,
            32'hb4ffff7f,
            32'hb400001f
        }; */

        ROM [0:46] ='{
            32'hf8000001,
            32'hf8008002,
            32'hf8000203,
            32'h8b050083,
            32'hf8018003,
            32'hcb050083,
            32'hf8020003,
            32'hcb0a03e4,
            32'hf8028004,
            32'h8b040064,
            32'hf8030004,
            32'hcb030025,
            32'hf8038005,
            32'h8a1f0145,
            32'hf8040005,
            32'h8a030145,
            32'hf8048005,
            32'h8a140294,
            32'hf8050014,
            32'haa1f0166,
            32'hf8058006,
            32'haa030166,
            32'hf8060006,
            32'hf840000c,
            32'h8b1f0187,
            32'hf8068007,
            32'hf807000c,
            32'h8b0e01bf,
            32'hf807801f,
            32'hb4000040,
            32'hf8080015,
            32'hf8088015,
            32'h8b0103e2,
            32'hcb010042,
            32'h8b0103f8,
            32'hf8090018,
            32'h8b080000,
            32'hb4ffff82,
            32'hf809001e,
            32'h8b1e03de,
            32'hcb1503f5,
            32'h8b1403de,
            32'hf85f83d9,
            32'h8b1e03de,
            32'h8b1003de,
            32'hf81f83d9,
            32'hb400001f
        };

    end
    
    assign q = ROM[addr];

endmodule