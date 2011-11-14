--
-- VHDL Architecture multiCore_lib.coheranceCont.arch_name
--
-- Created:
--          by - mg255.bin (cparch03.ecn.purdue.edu)
--          at - 14:25:53 11/02/11
--
-- using Mentor Graphics HDL Designer(TM) 2010.2a (Build 7)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
LIBRARY std;
USE std.textio.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_textio.all;

ENTITY coheranceCont IS
   PORT( 
      CLK          : IN     std_logic;
      nReset       : IN     std_logic;
      ramState     : IN     std_logic_vector (1 DOWNTO 0);      
      MemWait0     : IN     std_logic;
      MemWait1     : IN     std_logic;
      aMemAddr0    : IN     std_logic_vector (31 DOWNTO 0);
      aMemAddr1    : IN     std_logic_vector (31 DOWNTO 0);
      aMemRdData   : IN     std_logic_vector (31 DOWNTO 0);
      aMemRead0    : IN     std_logic;
      aMemRead1    : IN     std_logic;
      aMemWrData0  : IN     std_logic_vector (31 DOWNTO 0);
      aMemWrData1  : IN     std_logic_vector (31 DOWNTO 0);
      aMemWrite0   : IN     std_logic;
      aMemWrite1   : IN     std_logic;
      busy         : IN     std_logic;
      cMemData     : IN     std_logic_vector (31 DOWNTO 0);
      cMemData0    : IN     std_logic_vector (31 DOWNTO 0);
      cMemHit      : IN     std_logic;
      cMemHit0     : IN     std_logic;
      finalHalt0   : IN     std_logic;
      finalHalt1   : IN     std_logic;
      HALT         : OUT    std_logic;
      aMemAddr     : OUT    std_logic_vector (31 DOWNTO 0);
      aMemRdData0  : OUT    std_logic_vector (31 DOWNTO 0);
      aMemRdData1  : OUT    std_logic_vector (31 DOWNTO 0);
      aMemRead     : OUT    std_logic;
      aMemWrite    : OUT    std_logic;
      cMemAddr0    : OUT    std_logic_vector (31 DOWNTO 0);
      cMemAddr1    : OUT    std_logic_vector (31 DOWNTO 0);      
      cMemSnoopEn  : OUT    std_logic;
      cMemSnoopEn0 : OUT    std_logic;
      cMemWait0    : OUT    std_logic;
      cMemWait1    : OUT    std_logic;
      cWait0       : OUT    std_logic;
      cWait1       : OUT    std_logic
   );

-- Declarations

END coheranceCont ;

--
ARCHITECTURE arch_name OF coheranceCont IS
		signal servicing : std_logic;
BEGIN  
  HALT <=       finalHalt0 AND finalHalt1;
  servicing <= '0' when (aMemRead0 ='1' or aMemWrite0 ='1') else -- always finish cpu0 first then 2
  							'1' when (aMemRead0 ='1' or aMemWrite0 ='1') else
  							'0';
  aMemAddr <= aMemAddr0 when servicing ='0' and busy='0' else
  						aMemAddr01 when servicing ='1' and busy ='0';
 	aMemRdData0 <= aMemRdData when servicing ='0' else x"00000000";
 	aMemRdData1 <= aMemRdData when servicing ='1' else x"00000000";
 	aMemWrite <= aMemWrite0 when servicing ='0' else aMemWrite1;
 	-- Dcache stop: later on will include snooping capability
 	cMemWait0 <= 	'1' when busy = '1' and (aMemRead0 ='1' or aMemWrite0 ='1') else 			
 							'0';
 	cMemWait1 <= '1' when busy = '1' and (aMemRead1 ='1' or aMemWrite1 ='1') else -- waiting on ram to finish icacheAccess
 							 '0';
	-- Pause cpu while Dcache is being updated, icache wait set in the top level via arbwait0 and arbwait1 							 
	cWait0 <= '1' when MemWait0 = '1' else '0';
	cWait1 <= '1' when MemWait1	=	'1' else '0';
END ARCHITECTURE arch_name;

