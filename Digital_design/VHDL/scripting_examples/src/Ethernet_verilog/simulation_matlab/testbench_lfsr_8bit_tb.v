`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2024 20:41:40
// Design Name: 
// Module Name: testbench_lfsr_8bit_tb
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

module testbench_lfsr_8bit_tb;
    reg clk;
    reg rst;
    reg clk_en;
    wire [7:0] data;
    
    // Declaración del LFSR y la señal de realimentación
    reg [7:0] lfsr;
    wire lfsr_feedback;
    
    assign data = lfsr;
    assign lfsr_feedback = lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3];  // Ejemplo de realimentación para LFSR de 8 bits
    
    initial begin
        clk = 0;
        rst = 1;
        clk_en = 0;
        #10 rst = 0;
        #10 clk_en = 1;
    end
    
    always #5 clk = ~clk;  // Generador de reloj
    
    always @(posedge clk) begin
        if (rst) begin
            lfsr <= 8'b11111111;
        end else if (clk_en) begin
            lfsr[7:1] <= lfsr[6:0];
            lfsr[0] <= lfsr_feedback;
        end
    end
endmodule
