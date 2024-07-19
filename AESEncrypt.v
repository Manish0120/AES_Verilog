`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 16:11:29
// Design Name: 
// Module Name: AESEncrypt
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

module AESEncrypt #(parameter N=128,parameter Nr=10,parameter Nk=4)(in,key,out);
    input [127:0] in;
    input [N-1:0] key;
    output [127:0] out;
    wire [(128*(Nr+1))-1 :0] fullkeys;
    wire [127:0] states [Nr+1:0] ;
    wire [127:0] afterSubBytes;
    wire [127:0] afterShiftRows;
   
    
    KeyExpansion #(Nk,Nr) ke (key,fullkeys);
    
    AddRoundKey addrk1 (in,states[0],fullkeys[((128*(Nr+1))-1)-:128]);
    
    genvar i;
    generate
        for(i=1; i<Nr ;i=i+1)
        begin : loop
            EncryptRound er(states[i-1],fullkeys[(((128*(Nr+1))-1)-128*i)-:128],states[i]);
        end
        
        SubBytes sb(states[Nr-1],afterSubBytes);
        ShiftRows sr(afterSubBytes,afterShiftRows);
        AddRoundKey addrk2(afterShiftRows,states[Nr],fullkeys[127:0]);
    endgenerate
    
    assign out=states[Nr];
    
endmodule
