`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 14:42:20
// Design Name: 
// Module Name: MixColumns
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

module MixColumns(
    input [127:0] state_in,
    output[127:0] state_out
);

    function [7:0] mul_by_2; //multiply by 2
        input [7:0] x;
        begin 
                /* multiplication by 2 is shifting on bit to the left, if the original 8 bits had a 1 in the MSB,
                then xoring the result with {01}{1b} as it is the reduction polynomial as modulo operator
                but x is having 8 bits so xor with '01' won't make any sense*/
                if(x[7] == 1) mul_by_2 = ((x << 1) ^ 8'h1b);
                else mul_by_2 = x << 1; 
        end 	
    endfunction
    
    
    /* 
        multiplication by 3 is done using the distributive law: x*3 = x*(2 + 1)
            multiplication by {02} xor(the original x)
            so that 2+1=3. where xor is the addition of elements in finite fields
    */
    function [7:0] mul_by_3; //multiply by 3
        input [7:0] x;
        begin 
                
                mul_by_3 = mul_by_2(x) ^ x;
        end 
    endfunction
    
    genvar i;
    generate 
        for(i=0;i< 4;i=i+1) begin : m_col

            assign state_out[(i*32 + 24)+:8]= mul_by_2(state_in[(i*32 + 24)+:8]) ^ mul_by_3(state_in[(i*32 + 16)+:8]) ^ state_in[(i*32 + 8)+:8] ^ state_in[i*32+:8];
            assign state_out[(i*32 + 16)+:8]= state_in[(i*32 + 24)+:8] ^ mul_by_2(state_in[(i*32 + 16)+:8]) ^ mul_by_3(state_in[(i*32 + 8)+:8]) ^ state_in[i*32+:8];
            assign state_out[(i*32 + 8)+:8]= state_in[(i*32 + 24)+:8] ^ state_in[(i*32 + 16)+:8] ^ mul_by_2(state_in[(i*32 + 8)+:8]) ^ mul_by_3(state_in[i*32+:8]);
            assign state_out[i*32+:8]= mul_by_3(state_in[(i*32 + 24)+:8]) ^ state_in[(i*32 + 16)+:8] ^ state_in[(i*32 + 8)+:8] ^ mul_by_2(state_in[i*32+:8]);
        
        end
    
    endgenerate

endmodule
