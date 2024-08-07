module hworld_top
  import hworld_reg_pkg::*;
  import reg_pkg::*;
  import obi_pkg::*;
  (
    input logic clk_i,
    input logic rst_ni,
    input obi_req_t reg_req_i,
    output obi_resp_t reg_rsp_o
  );

  reg_req_t periph_req_i;   
  reg_rsp_t periph_rsp_o;

  hworld_reg2hw_t reg_to_ip;
  hworld_hw2reg_t ip_to_reg;   
  
  wire logic [31:0] a, b, sum;
  wire logic cout;

// practically a cast from a obi type to reg type
  periph_to_reg #(
    .req_t(reg_pkg::reg_req_t),   
    .rsp_t(reg_pkg::reg_rsp_t),
    .IW(1)
  ) periph_to_reg_i (
    .clk_i,
    .rst_ni,
    .req_i(reg_req_i.req),
    .add_i(reg_req_i.addr),
    .wen_i(~reg_req_i.we),
    .wdata_i(reg_req_i.wdata),
    .be_i(reg_req_i.be),
    .id_i('0),
    .gnt_o(reg_rsp_o.gnt),
    .r_rdata_o(reg_rsp_o.rdata),
    .r_opc_o(),
    .r_id_o(),
    .r_valid_o(reg_rsp_o.rvalid),
    .reg_req_o(periph_req_i),
    .reg_rsp_i(periph_rsp_o)
  );

  hworld_reg_top #(
   .reg_req_t(reg_req_t),
   .reg_rsp_t(reg_rsp_t)
   ) hworld_i_regfile (
     .clk_i,
     .rst_ni,
     .devmode_i(1'b1),
     // From the bus to regfile
     .reg_req_i(periph_req_i),
     .reg_rsp_o(periph_rsp_o),
     // Signals from regfile to hworld IP
     .reg2hw(reg_to_ip),
     .hw2reg(ip_to_reg) 
  );

  assign a = reg_to_ip.a;
  assign b = reg_to_ip.b;

  hworld i_hworld (
    .a(a),
    .b(b),
    .sum(sum),
    .carry_out(cout)
  );

  assign ip_to_reg.sum.d = sum;
  assign ip_to_reg.cout.d = cout;

endmodule: hworld_top
