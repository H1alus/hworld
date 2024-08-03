module hworld(
    input logic [31:0] a,       
    input logic [31:0] b,      
    output logic [31:0] sum,    
    output logic carry_out      
);
    assign {carry_out, sum} = a + b;

endmodule
