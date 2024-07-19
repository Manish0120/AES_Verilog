`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 15:19:42
// Design Name: 
// Module Name: SubBytes
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SubBytes(
    input [127:0] in,
    output [127:0] out
);
    genvar i;
    generate 
        for(i=0;i<128;i=i+8)
        begin: SubByte
            S_Box s(in[i +:8],out[i +:8]);
        end
    endgenerate

endmodule