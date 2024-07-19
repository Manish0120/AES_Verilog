`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 15:44:41
// Design Name: 
// Module Name: TopModule
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

module TopModule(
    input enable,
    output wire[127:0] encrypted128,
    output wire[127:0] encrypted192,
    output wire[127:0] encrypted256
);
    
    // The plain text used as input
    wire[127:0] in = 128'h00112233445566778899aabbccddeeff;
    
    // The different keys used for testing (one of each type)
    wire[127:0] key128 = 128'h000102030405060708090a0b0c0d0e0f;
    wire[191:0] key192 = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
    wire[255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
    
    // The expected outputs from the encryption module
    wire[127:0] expected128 = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
    wire[127:0] expected192 = 128'hdda97ca4864cdfe06eaf70a0ec0d7191;
    wire[127:0] expected256 = 128'h8ea2b7ca516745bfeafc49904b496089;
    
    // Encryption call for each type
    AESEncrypt a(in,key128,encrypted128);
    AESEncrypt #(192,12,6) b(in,key192,encrypted192);
    AESeEncrypt #(256,14,8) c(in,key256,encrypted256);
endmodule