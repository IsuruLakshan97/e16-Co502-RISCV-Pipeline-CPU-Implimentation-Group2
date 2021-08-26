module Alu_hazard_unit (
    clk,
    reset,
    destination_address_mem_stage,
    destination_address_alu_stage,
    rs1_address_if_stage,
    rs2_address_if_stage,
    forward_enable_to_rs1_from_mem_stage_signal,
    forward_enable_to_rs2_from_mem_stage_signal,
    forward_enable_to_rs1_from_wb_stage_signal,
    forward_enable_to_rs2_from_wb_stage_signal
);

input clk,reset;
input [4:0]    destination_address_mem_stage,destination_address_alu_stage,rs1_address_if_stage,rs2_address_if_stage,;

output reg forward_enable_to_rs1_from_mem_stage_signal,forward_enable_to_rs2_from_mem_stage_signal,forward_enable_to_rs1_from_wb_stage_signal,forward_enable_to_rs2_from_wb_stage_signal;

wire [4:0] alu_rs1_xnor_wire,alu_rs2_xnor_wire,mem_rs1_xnor_wire,mem_rs2_xnor_wire;
wire alu_rs_1comparing,alu_rs_2comparing,mem_rs1comparing,mem_rs2comparing;


assign alu_rs1_xnor_wire=(destination_address_alu_stage~^rs1_address_if_stage);
assign alu_rs2_xnor_wire=(destination_address_alu_stage~^rs1_address_if_stage);
assign alu_rs_1comparing= (&alu_rs1_xnor_wire);   
assign alu_rs_2comparing= (&alu_rs2_xnor_wire);

assign mem_rs1_xnor_wire=(destination_address_mem_stage~^rs1_address_if_stage);
assign mem_rs2_xnor_wire=(destination_address_mem_stage~^rs1_address_if_stage);
assign mem_rs1comparing= (&mem_rs1_xnor_wire);   
assign mem_rs2comparing= (&mem_rs2_xnor_wire);


always @(posedge clk) begin
    forward_enable_to_rs1_from_mem_stage_signal=alu_rs_1comparing;
    forward_enable_to_rs2_from_mem_stage_signal=alu_rs_2comparing;
    forward_enable_to_rs1_from_wb_stage_signal=mem_rs1comparing;
    forward_enable_to_rs2_from_wb_stage_signal=mem_rs2comparing;
end

always @(reset) begin
	if(RESET==1'b1) begin
        forward_enable_from_mem_stage_signal=0;
        forward_enable_from_wb_stage_signal=0;	                        
	end
end

    
endmodule