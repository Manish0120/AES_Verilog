`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2024 00:09:46
// Design Name: 
// Module Name: EncryptRound
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

module EncryptRound(in,key,out);
    input [127:0] in;
    output [127:0] out;
    input [127:0] key;
    wire [127:0] afterSubBytes;
    wire [127:0] afterShiftRows;
    wire [127:0] afterMixColumns;
    wire [127:0] afterAddroundKey;
    
    SubBytes s(in,afterSubBytes);
    ShiftRows r(afterSubBytes,afterShiftRows);
    MixColumns m(afterShiftRows,afterMixColumns);
    AddRoundKey b(afterMixColumns,out,key);
            
endmodule
