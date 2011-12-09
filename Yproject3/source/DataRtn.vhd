-- libraries
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY DataRtn IS
   PORT( 
      SLT_EN,LUI,SLTvalue  : IN     std_logic;      
      JAL										  : IN     std_logic; 
      Imm16					  				: IN     std_logic_vector (15 DOWNTO 0);
      PC_4,EX_AluOut  			: IN 		 std_logic_vector(31 downto 0);
      EX_Out      						: OUT    std_logic_vector (31 DOWNTO 0)
   );
end DataRtn;

ARCHITECTURE Behav_DataRtn OF DataRtn IS
	signal NegMuxOut,SLT_ENMuxOut,LUIMuxOut,Im32 : std_logic_vector( 31 downto 0);
BEGIN
	Im32 <= Imm16 & x"0000";
	SLT_ENMuxOut <=  x"0000000"&"000"&SLTvalue when SLT_EN = '1' else EX_AluOut;
	LUIMuxOut <= Im32 when LUI = '1' else SLT_ENMuxOut;
	EX_Out <= PC_4 when JAL ='1' else LUIMuxOut;
END ARCHITECTURE Behav_DataRtn;
