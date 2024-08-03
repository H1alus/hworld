// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package hworld_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 4;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [31:0] q;
  } hworld_reg2hw_a_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } hworld_reg2hw_b_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } hworld_hw2reg_sum_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } hworld_hw2reg_cout_reg_t;

  // Register -> HW type
  typedef struct packed {
    hworld_reg2hw_a_reg_t a; // [63:32]
    hworld_reg2hw_b_reg_t b; // [31:0]
  } hworld_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    hworld_hw2reg_sum_reg_t sum; // [34:2]
    hworld_hw2reg_cout_reg_t cout; // [1:0]
  } hworld_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] HWORLD_A_OFFSET = 4'h 0;
  parameter logic [BlockAw-1:0] HWORLD_B_OFFSET = 4'h 4;
  parameter logic [BlockAw-1:0] HWORLD_SUM_OFFSET = 4'h 8;
  parameter logic [BlockAw-1:0] HWORLD_COUT_OFFSET = 4'h c;

  // Register index
  typedef enum int {
    HWORLD_A,
    HWORLD_B,
    HWORLD_SUM,
    HWORLD_COUT
  } hworld_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] HWORLD_PERMIT [4] = '{
    4'b 1111, // index[0] HWORLD_A
    4'b 1111, // index[1] HWORLD_B
    4'b 1111, // index[2] HWORLD_SUM
    4'b 0001  // index[3] HWORLD_COUT
  };

endpackage

