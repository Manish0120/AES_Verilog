`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 11:13:46
// Design Name: 
// Module Name: ShiftRows
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


module ShiftRows(
    input [0:127] in_rows,
    output [0:127] shifted_rows
    );
    
    // zero shifting
    assign shifted_rows[0+:8] = in_rows[0+:8];
    assign shifted_rows[32+:8] = in_rows[32+:8];
    assign shifted_rows[64+:8] = in_rows[64+:8];
    assign shifted_rows[96+:8] = in_rows[96+:8];
    
    // shifting to left by 1 cell
    assign shifted_rows[8+:8] = in_rows[40+:8];
    assign shifted_rows[40+:8] = in_rows[72+:8];
    assign shifted_rows[72+:8] = in_rows[104+:8];
    assign shifted_rows[104+:8] = in_rows[8+:8];
    
    // shifting to left by 2 cell
    assign shifted_rows[16+:8] = in_rows[80+:8];
    assign shifted_rows[48+:8] = in_rows[112+:8];
    assign shifted_rows[80+:8] = in_rows[16+:8];
    assign shifted_rows[112+:8] = in_rows[48+:8];
    
    // shifting to left by 3 cell
    assign shifted_rows[24+:8] = in_rows[120+:8];
    assign shifted_rows[56+:8] = in_rows[24+:8];
    assign shifted_rows[88+:8] = in_rows[56+:8];
    assign shifted_rows[120+:8] = in_rows[88+:8];
endmodule
