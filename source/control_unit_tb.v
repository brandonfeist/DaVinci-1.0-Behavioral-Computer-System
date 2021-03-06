`include "prj_definition.v"
module CONTROL_UNIT_TB;
//Output List
wire CLK;
wire [`DATA_INDEX_LIMIT:0] MEM_DATA;
wire [`DATA_INDEX_LIMIT:0] RF_DATA_W;
wire [`ADDRESS_INDEX_LIMIT:0] MEM_ADDR;
wire [`REG_ADDR_INDEX_LIMIT:0] RF_ADDR_W, RF_ADDR_R1, RF_ADDR_R2;
wire [`ALU_OPRN_INDEX_LIMIT:0] ALU_OPRN;
wire [`DATA_INDEX_LIMIT:0] ALU_OP1, ALU_OP2;
wire RF_READ, RF_WRITE, MEM_READ, MEM_WRITE;

//Input List
reg [`DATA_INDEX_LIMIT:0] RF_DATA_R1;
reg [`DATA_INDEX_LIMIT:0] RF_DATA_R2;
reg [`DATA_INDEX_LIMIT:0] ALU_RESULT;


//Regs
reg ZERO, RST;

//Clock generator
CLK_GENERATOR clk_gen_inst(.CLK(CLK));

//Control Unit test bench
CONTROL_UNIT control_unit_inst(.MEM_DATA(MEM_DATA), .RF_DATA_W(RF_DATA_W), .RF_ADDR_W(RF_ADDR_W), .RF_ADDR_R1(RF_ADDR_R1), .RF_ADDR_R2(RF_ADDR_R2), .RF_READ(RF_READ), .RF_WRITE(RF_WRITE),
                    .ALU_OP1(ALU_OP1), .ALU_OP2(ALU_OP2), .ALU_OPRN(ALU_OPRN), .MEM_ADDR(MEM_ADDR), .MEM_READ(MEM_READ), .MEM_WRITE(MEM_WRITE),
                    .RF_DATA_R1(RF_DATA_R1), .RF_DATA_R2(RF_DATA_R2), .ALU_RESULT(ALU_RESULT), .ZERO(ZERO), .CLK(CLK), .RST(RST));

initial
begin
RST=1'b1;

#20 RST = 1'b0;
#10 RST = 1'b1;

#1000 $write("Testing\n");
      $stop;

end
endmodule
