`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: binary8Bit_to_3digitBCD
/////////////////////////////////////////////////////////////////

module add3(
    input [3:0] in,
    output reg [3:0] out);

    always @ (in)
    case (in)
        4'b0000: out <= 4'b0000;
        4'b0001: out <= 4'b0001;
        4'b0010: out <= 4'b0010;
        4'b0011: out <= 4'b0011;
        4'b0100: out <= 4'b0100;
        4'b0101: out <= 4'b1000;
        4'b0110: out <= 4'b1001;
        4'b0111: out <= 4'b1010;
        4'b1000: out <= 4'b1011;
        4'b1001: out <= 4'b1100;
        default: out <= 4'b0000;
    endcase
endmodule
    
module binary8Bit_to_3digitBCD(
    input [7:0] binarydata,
    output [9:0] bcd
    );
    wire [3:0] c1,c2,c3,c4,c5,c6,c7;
    wire [3:0] d1,d2,d3,d4,d5,d6,d7;

    assign d1 = {1'b0,binarydata[7:5]};
    assign d2 = {c1[2:0],binarydata[4]};
    assign d3 = {c2[2:0],binarydata[3]};
    assign d4 = {c3[2:0],binarydata[2]};
    assign d5 = {c4[2:0],binarydata[1]};
    assign d6 = {1'b0,c1[3],c2[3],c3[3]};
    assign d7 = {c6[2:0],c4[3]};
    add3 m1(d1,c1);
    add3 m2(d2,c2);
    add3 m3(d3,c3);
    add3 m4(d4,c4);
    add3 m5(d5,c5);
    add3 m6(d6,c6);
    add3 m7(d7,c7);
    assign bcd[3:0] = {c5[2:0],binarydata[0]};
    assign bcd[7:4] = {c7[2:0],c5[3]};
    assign bcd[9:8] = {c6[3],c7[3]};

endmodule
