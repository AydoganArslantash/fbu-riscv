`include "config.sv"
`include "constants.sv"
// MODEL FOR ALU
module alu (
    input        [4:0]  alu_function,
    input signed [31:0] operand_a,
    input signed [31:0] operand_b,
    output logic [31:0] result,
    output              result_equal_zero
);	
	always@(*) begin
	
    case(alu_function)
    5'b00001:
	result = operand_a + operand_b;//ALU_Addition
    5'b00010:
	result = operand_a - operand_b;//ALU_Substraction
	5'b00011:
	result = operand_a << operand_b;//ALU_SLL
	5'b00100:
	result = operand_a >> operand_b;//ALU_SRL
	5'b00101:
	result = operand_a >>> operand_b;//ALU_SRA 
	5'b00110:
	result = operand_a == operand_b;//ALU_SEQ
	5'b00111:
	result = operand_a < operand_b;//ALU_SLT 
	5'b01000:
	result = $unsigned(operand_a) < $unsigned(operand_b);//ALU_SLTU 
	5'b01001:
	result = operand_a ^ operand_b;//ALU_XOR
	5'b01010:
	result = operand_a | operand_b;//ALU_OR
    5'b01011:
	result = operand_a & operand_b;//ALU_AND
    

  
	default:
	result = result_equal_zero;    // When there is no operation selected, result will be 0.
    endcase
    end
   
endmodule
    
    



