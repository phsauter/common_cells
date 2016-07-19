// Regular VT
// LAGCEPM2R, LAGCEPM3R, LAGCEPM4R
// LAGCEPM6R, LAGCEPM8R
// LAGCEPM12R, LAGCEPM16R
// LAGCEPM20R

// Low VT
// LAGCEPM2W, LAGCEPM3W, LAGCEPM4W
// LAGCEPM6W, LAGCEPM8W
// LAGCEPM12W, LAGCEPM16W
// LAGCEPM20W

// High VT
// LAGCEPM2S, LAGCEPM3S, LAGCEPM4S
// LAGCEPM6S, LAGCEPM8S
// LAGCEPM12S, LAGCEPM16S
// LAGCEPM20S

`include "ulpsoc_defines.sv"

module cluster_clock_gating
(
    input  logic clk_i,
    input  logic en_i,
    input  logic test_en_i,
    output logic clk_o
);

`ifdef USE_SC8
    TLATNTSCA_X12_A8TL clk_gate_i
    (
        .ECK(clk_o),
        .CK(clk_i),
        .E(en_i),
        .SE(test_en_i)
    );
`endif 

`ifdef USE_SC9
    POSTICG_X2P5B_A9TL clk_gate_i
    (
        .ECK(clk_o),
        .CK(clk_i),
        .E(en_i),
        .SEN(~
            test_en_i)
    );
`endif 


`ifdef USE_SC12
    //LAGCEPM12R  clk_gate_i
    POSTICG_X2P5B_A12TL clk_gate_i
    (
        .ECK(clk_o),
        .CK(clk_i),
        .E(en_i),
        .SEN(~test_en_i)
    );
`endif 



endmodule