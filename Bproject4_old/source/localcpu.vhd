-- VHDL Entity multiCore_lib.localCPU.symbol
--
-- Created:
--          by - mg255.bin (cparch11.ecn.purdue.edu)
--          at - 23:15:13 11/14/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY localCPU IS
   PORT( 
      CLK         : IN     std_logic;
      nReset      : IN     std_logic;
      ramState    : IN     std_logic_vector (1 DOWNTO 0);
      MEM_MEM2REG : OUT    std_logic;
      IF_Instr    : IN     std_logic_vector (31 DOWNTO 0);
      PC          : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_MemWr   : OUT    std_logic;
      MEM_Out     : OUT    std_logic_vector (31 DOWNTO 0);
      hit         : IN     std_logic;
      WB_Halt     : OUT    std_logic;
      cpuwait     : IN     std_logic;
      MEM_ramOut  : IN     std_logic_vector (31 DOWNTO 0);
      MEM_BusB    : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      MEM_LL      : OUT    std_logic;
      MEM_SC      : OUT    std_logic
   );

-- Declarations

END localCPU ;

--
-- VHDL Architecture multiCore_lib.localCPU.struct
--
-- Created:
--          by - mg255.bin (cparch11.ecn.purdue.edu)
--          at - 23:15:14 11/14/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--
-- 
--  VHDL Architecture multi_LIB.localCPU.struct
-- 
--  Created:
--           by - mg255.bin (cparch11.ecn.purdue.edu)
--           at - 12:43:00 11/01/11
-- 
--  Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
-- 
--  
--   VHDL Architecture lab6_lib.myCpu.struct
--  
--   Created:
--            by - mg255.bin (cparch05.ecn.purdue.edu)
--            at - 02:35:19 10/26/11
--  
--   Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--  
--   
--    VHDL Architecture lab5_lib.myCpu.struct
--   
--    Created:
--             by - mg255.bin (cparch10.ecn.purdue.edu)
--             at - 12:37:30 09/21/11
--   
--    Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--   
--  
-- 
-- 
LIBRARY altera_mf;
USE altera_mf.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ARCHITECTURE struct OF localCPU IS

   -- Architecture declarations
   -- Internal signal declarations
   SIGNAL MEM_datain           : std_logic_vector(31 DOWNTO 0);
   SIGNAL MemWr                : std_logic;
   SIGNAL MEM_REGWR            : std_logic;
   SIGNAL EX_AluOut            : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Negt              : std_logic;
   SIGNAL AluOp                : std_logic_vector(2 DOWNTO 0);
   SIGNAL EX_Funct             : std_logic_vector(5 DOWNTO 0);
   SIGNAL EX_OpCode            : std_logic_vector(5 DOWNTO 0);
   SIGNAL EX_BusA              : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Imm16             : std_logic_vector(15 DOWNTO 0);
   SIGNAL EX_PC_4              : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_BusB              : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_SLT_En            : std_logic;
   SIGNAL EX_JAL               : std_logic;
   SIGNAL EX_MemWr             : std_logic;
   SIGNAL EX_LUI               : std_logic;
   SIGNAL EX_MEM2REG           : std_logic;
   SIGNAL EX_REGWR             : std_logic;
   SIGNAL EX_XtdOut            : std_logic_vector(31 DOWNTO 0);
   SIGNAL B                    : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_SLMuxOut          : std_logic_vector(31 DOWNTO 0);
   SIGNAL AluSrc               : std_logic;
   SIGNAL WB_REGWR             : std_logic;
   SIGNAL Shamt32              : std_logic_vector(31 DOWNTO 0);
   SIGNAL Rt                   : std_logic_vector(4 DOWNTO 0);
   SIGNAL Rs                   : std_logic_vector(4 DOWNTO 0);
   SIGNAL rdat1                : std_logic_vector(31 DOWNTO 0);    -- read port 1
   SIGNAL rdat2                : std_logic_vector(31 DOWNTO 0);    -- read port 2
   SIGNAL Funct                : std_logic_vector(5 DOWNTO 0);
   SIGNAL Imm16                : std_logic_vector(15 DOWNTO 0);
   SIGNAL OpCode               : std_logic_vector(5 DOWNTO 0);
   SIGNAL Shamt                : std_logic_vector(4 DOWNTO 0);
   SIGNAL IF_PC_4              : std_logic_vector(31 DOWNTO 0);
   SIGNAL IF_JAddr26           : std_logic_vector(25 DOWNTO 0);
   SIGNAL IF_JMP               : std_logic;
   SIGNAL HALT1                : std_logic;
   SIGNAL ID_XtdOut            : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_PC_4              : std_logic_vector(31 DOWNTO 0);
   SIGNAL ExtOp                : std_logic;
   SIGNAL OvrFlo               : std_logic;
   SIGNAL ZERO                 : std_logic;
   SIGNAL LUI                  : std_logic;
   SIGNAL RegWr                : std_logic;
   SIGNAL JAL                  : std_logic;
   SIGNAL SLT_EN               : std_logic;
   SIGNAL ID_Instr             : std_logic_vector(31 DOWNTO 0);
   SIGNAL Mem2Reg              : std_logic;
   SIGNAL RegDest              : std_logic;
   SIGNAL Rd                   : std_logic_vector(4 DOWNTO 0);
   SIGNAL Freeze               : std_logic;
   SIGNAL IF_PCSkip            : std_logic;
   SIGNAL EX_Halt              : std_logic;
   SIGNAL MEM_Halt             : std_logic;
   SIGNAL ID_EQ                : std_logic;                        -- branch purposes
   SIGNAL ID_PcSrc             : std_logic;
   --					JMP,PcSrc,LD												: out std_logic;
   SIGNAL ID_JR                : std_logic;
   SIGNAL ID_Imm16L2           : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Out               : std_logic_vector(31 DOWNTO 0);
   SIGNAL WB_datain            : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_Rw                : std_logic_vector(4 DOWNTO 0);
   SIGNAL ID_SRL_SLL           : std_logic;
   SIGNAL WB_Rw                : std_logic_vector(4 DOWNTO 0);
   SIGNAL EX_Shamt32           : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Rw                : std_logic_vector(4 DOWNTO 0);
   SIGNAL EX_SRL_SLL           : std_logic;
   SIGNAL EX_Rt                : std_logic_vector(4 DOWNTO 0);
   SIGNAL ID_FLUSH             : std_logic;
   SIGNAL ID_ASel              : std_logic;
   SIGNAL ID_BSel              : std_logic;
   SIGNAL ID_FwdA              : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_FwdB              : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_FwdMuxA           : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_FwdMuxB           : std_logic_vector(31 DOWNTO 0);
   -- Implicit buffer signal declarations
   SIGNAL MEM_MEM2REG_internal : std_logic;
   SIGNAL MEM_Out_internal     : std_logic_vector(31 DOWNTO 0);
   SIGNAL PC_internal          : std_logic_vector(31 DOWNTO 0);
   SIGNAL LL                   : std_logic;
   SIGNAL SC                   : std_logic;
   SIGNAL EX_LL                : std_logic;
   SIGNAL EX_SC                : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL MEM_Rw_internal : std_logic_vector (4 DOWNTO 0);


   -- Component Declarations
   COMPONENT AluCont
   PORT (
      Funct  : IN     std_logic_vector (5 DOWNTO 0);
      OpCode : IN     std_logic_vector (5 DOWNTO 0);
      AluOp  : OUT    std_logic_vector (2 DOWNTO 0);
      AluSrc : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT CLU
   PORT (
      Funct    : IN     std_logic_vector (5 DOWNTO 0);
      ID_EQ    : IN     std_logic;
      OpCode   : IN     std_logic_vector (5 DOWNTO 0);
      OvrFlo   : IN     std_logic;
      Zero     : IN     std_logic;
      ExtOp    : OUT    std_logic;
      ID_JR    : OUT    std_logic;
      ID_PcSrc : OUT    std_logic;
      JAL      : OUT    std_logic;
      LL       : OUT    std_logic;
      LUI      : OUT    std_logic;
      Mem2Reg  : OUT    std_logic;
      MemWr    : OUT    std_logic;
      RegDest  : OUT    std_logic;
      RegWr    : OUT    std_logic;
      SC       : OUT    std_logic;
      SLT_EN   : OUT    std_logic;
      SRL_SLL  : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT DataRtn
   PORT (
      EX_AluOut : IN     std_logic_vector (31 DOWNTO 0);
      Imm16     : IN     std_logic_vector (15 DOWNTO 0);
      JAL       : IN     std_logic;
      LUI       : IN     std_logic;
      NEG       : IN     std_logic;
      PC_4      : IN     std_logic_vector (31 DOWNTO 0);
      SLT_EN    : IN     std_logic;
      EX_Out    : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Decode
   PORT (
      Instr32 : IN     std_logic_vector (31 DOWNTO 0);
      Funct   : OUT    std_logic_vector (5 DOWNTO 0);
      Imm16   : OUT    std_logic_vector (15 DOWNTO 0);
      OpCode  : OUT    std_logic_vector (5 DOWNTO 0);
      Rd      : OUT    std_logic_vector (4 DOWNTO 0);
      Rs      : OUT    std_logic_vector (4 DOWNTO 0);
      Rt      : OUT    std_logic_vector (4 DOWNTO 0);
      Shamt   : OUT    std_logic_vector (4 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT EXMEM_REG
   PORT (
      CLK         : IN     std_logic;
      EX_BusB     : IN     std_logic_vector (31 DOWNTO 0);
      EX_Halt     : IN     std_logic;
      EX_LL       : IN     std_logic;
      EX_MEM2REG  : IN     std_logic;
      EX_MemWr    : IN     std_logic;
      EX_Out      : IN     std_logic_vector (31 DOWNTO 0);
      EX_REGWR    : IN     std_logic;
      EX_Rw       : IN     std_logic_vector (4 DOWNTO 0);
      EX_SC       : IN     std_logic;
      Freeze      : IN     std_logic;
      nReset      : IN     std_logic;
      MEM_BusB    : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_Halt    : OUT    std_logic;
      MEM_LL      : OUT    std_logic;
      MEM_MEM2REG : OUT    std_logic;
      MEM_MemWr   : OUT    std_logic;
      MEM_Out     : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_REGWR   : OUT    std_logic;
      MEM_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      MEM_SC      : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT FwdUnit
   PORT (
      EX_Out     : IN     std_logic_vector (31 DOWNTO 0);
      EX_REGWR   : IN     std_logic;
      EX_Rw      : IN     std_logic_vector (4 DOWNTO 0);
      ID_Rs      : IN     std_logic_vector (4 DOWNTO 0);
      ID_Rt      : IN     std_logic_vector (4 DOWNTO 0);
      MEM_REGWR  : IN     std_logic;
      MEM_Rw     : IN     std_logic_vector (4 DOWNTO 0);
      MEM_dataIn : IN     std_logic_vector (31 DOWNTO 0);
      ID_ASel    : OUT    std_logic;
      ID_BSel    : OUT    std_logic;
      ID_FwdA    : OUT    std_logic_vector (31 DOWNTO 0);
      ID_FwdB    : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT IDEX_REG
   PORT (
      CLK        : IN     std_logic;
      Freeze     : IN     std_logic;
      ID_BusA    : IN     std_logic_vector (31 DOWNTO 0);
      ID_BusB    : IN     std_logic_vector (31 DOWNTO 0);
      ID_FLUSH   : IN     std_logic;
      ID_Funct   : IN     std_logic_vector (5 DOWNTO 0);
      ID_Halt    : IN     std_logic;
      ID_Imm16   : IN     std_logic_vector (15 DOWNTO 0);
      ID_JAL     : IN     std_logic;
      ID_LL      : IN     std_logic;
      ID_LUI     : IN     std_logic;
      ID_MEM2REG : IN     std_logic;
      ID_MemWr   : IN     std_logic;
      ID_OpCode  : IN     std_logic_vector (5 DOWNTO 0);
      ID_PC_4    : IN     std_logic_vector (31 DOWNTO 0);
      ID_REGWR   : IN     std_logic;
      ID_Rt      : IN     std_logic_vector (4 DOWNTO 0);
      ID_Rw      : IN     std_logic_vector (4 DOWNTO 0);
      ID_SC      : IN     std_logic;
      ID_SLT_En  : IN     std_logic;
      ID_SRL_SLL : IN     std_logic;
      ID_Shamt32 : IN     std_logic_vector (31 DOWNTO 0);
      ID_XtdOut  : IN     std_logic_vector (31 DOWNTO 0);
      nReset     : IN     std_logic;
      EX_BusA    : OUT    std_logic_vector (31 DOWNTO 0);
      EX_BusB    : OUT    std_logic_vector (31 DOWNTO 0);
      EX_Funct   : OUT    std_logic_vector (5 DOWNTO 0);
      EX_Halt    : OUT    std_logic;
      EX_Imm16   : OUT    std_logic_vector (15 DOWNTO 0);
      EX_JAL     : OUT    std_logic;
      EX_LL      : OUT    std_logic;
      EX_LUI     : OUT    std_logic;
      EX_MEM2REG : OUT    std_logic;
      EX_MemWr   : OUT    std_logic;
      EX_OpCode  : OUT    std_logic_vector (5 DOWNTO 0);
      EX_PC_4    : OUT    std_logic_vector (31 DOWNTO 0);
      EX_REGWR   : OUT    std_logic;
      EX_Rt      : OUT    std_logic_vector (4 DOWNTO 0);
      EX_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      EX_SC      : OUT    std_logic;
      EX_SLT_En  : OUT    std_logic;
      EX_SRL_SLL : OUT    std_logic;
      EX_Shamt32 : OUT    std_logic_vector (31 DOWNTO 0);
      EX_XtdOut  : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT IFID_REG
   PORT (
      CLK      : IN     std_logic;
      Freeze   : IN     std_logic;
      ID_FLUSH : IN     std_logic;
      ID_PcSrc : IN     std_logic;
      IF_Instr : IN     std_logic_vector (31 DOWNTO 0);
      IF_PC_4  : IN     std_logic_vector (31 DOWNTO 0);
      halt     : IN     std_logic;
      hit      : IN     std_logic;
      nReset   : IN     std_logic;
      ID_Instr : OUT    std_logic_vector (31 DOWNTO 0);
      ID_PC_4  : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT J_JAL
   PORT (
      IF_Instr   : IN     std_logic_vector (31 DOWNTO 0);
      IF_JAddr26 : OUT    std_logic_vector (25 DOWNTO 0);
      IF_JMP     : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT MEMWB_REG
   PORT (
      CLK        : IN     std_logic;
      Freeze     : IN     std_logic;
      MEM_Halt   : IN     std_logic;
      MEM_REGWR  : IN     std_logic;
      MEM_Rw     : IN     std_logic_vector (4 DOWNTO 0);
      MEM_datain : IN     std_logic_vector (31 DOWNTO 0);
      nReset     : IN     std_logic;
      WB_Halt    : OUT    std_logic;
      WB_REGWR   : OUT    std_logic;
      WB_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      WB_datain  : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT PcBlock
   PORT (
      BusA       : IN     std_logic_vector (31 DOWNTO 0);
      ID_Imm16L2 : IN     std_logic_vector (31 DOWNTO 0);
      ID_JR      : IN     std_logic;
      ID_PcSrc   : IN     std_logic;
      IF_PCSkip  : IN     std_logic;
      JAddr26    : IN     std_logic_vector (25 DOWNTO 0);
      JMP        : IN     std_logic;
      clk        : IN     std_logic;
      nReset     : IN     std_logic;
      PC         : OUT    std_logic_vector (31 DOWNTO 0);
      PC_4       : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT ShiftXtd
   PORT (
      ExtOp      : IN     std_logic;
      Imm16      : IN     std_logic_vector (15 DOWNTO 0);
      Shamt      : IN     std_logic_vector (4 DOWNTO 0);
      ID_Imm16L2 : OUT    std_logic_vector (31 DOWNTO 0);
      Shamt32    : OUT    std_logic_vector (31 DOWNTO 0);
      XtdOut     : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT alu
   PORT (
      A        : IN     std_logic_vector (31 DOWNTO 0);
      B        : IN     std_logic_vector (31 DOWNTO 0);
      OPCODE   : IN     std_logic_vector (2 DOWNTO 0);
      NEGATIVE : OUT    std_logic;
      OVERFLOW : OUT    std_logic;
      ZERO     : OUT    std_logic;
      aluOut   : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT registerFile
   PORT (
      clk    : IN     std_logic;
      nReset : IN     std_logic;
      rsel1  : IN     std_logic_vector (4 DOWNTO 0);
      rsel2  : IN     std_logic_vector (4 DOWNTO 0);
      wdat   : IN     std_logic_vector (31 DOWNTO 0);
      wen    : IN     std_logic;
      wsel   : IN     std_logic_vector (4 DOWNTO 0);
      rdat1  : OUT    std_logic_vector (31 DOWNTO 0);
      rdat2  : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;

BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 IFID
   -- HDL Embedded Text Block 1 ID_Hzd
   ID_Rw <= Rd when RegDest ='1' else Rt;                --RegDestMux
   HALT1 <= '1' when ID_Instr = x"FFFFFFFF" else '0';    -- STOP
   ID_EQ <= '1' when ID_FwdMuxA = ID_FwdMuxB else '0';             -- xor block
   ID_FLUSH <= '1' WHEN (EX_MEM2REG ='1' AND (EX_RT = RS OR EX_RT=RT)) else -- lw always uses RT       
               '0';--Mem to Register and read back to back
   ID_FwdMuxA <= ID_FwdA when ID_ASel='1' else rdat1;    -- FwdA mux
   ID_FwdMuxB <= ID_FwdB when ID_BSel='1' else rdat2;    -- FwdB mux
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   -- HDL Embedded Text Block 3 EXMEM
   -- HDL Embedded Text Block 2 EXeb
   EX_SLMuxOut <= EX_Shamt32 when EX_SRL_SLL='1' else  EX_BusB;    --SLMux
   B <= EX_XtdOut when AluSrc ='1' else  EX_SLMuxOut;                --AluSrcMux

   -- HDL Embedded Text Block 4 MEMWB
   -- HDL Embedded Text Block 3 MemEb
         MEM_datain <= MEM_ramOut when MEM_MEM2REG_internal = '1' else MEM_Out_internal;
   -- Implicit buffered output assignments
   MEM_MEM2REG <= MEM_MEM2REG_internal;
   MEM_Out     <= MEM_Out_internal;
   PC          <= PC_internal;

   -- HDL Embedded Text Block 5 InputIF
   -- HDL Embedded Text Block 2 LocCont
     IF_PCSkip <= '1' when (HALT1 = '1') else       -- Don't change PC when HALT1 or waiting for dcache
                  '1' when (ID_FLUSH = '1') else -- hazard implementation, don't change PC while buble inserted in EX latch
                  '0' when (ID_PCSrc='1' and cpuwait ='0') else-- sqaush value in one clk don't get instr(done in stopIcache)
                  '1' when (hit='0' ) else -- update squash val in 1 cycle and           
                  '1' when (hit='1' and cpuwait ='1') else 
                  '0';
     Freeze <= '1' when cpuwait ='1' else
               '1' when (ID_PcSrc ='0' and hit ='0' and HALT1='0') else
               '0';
   
   
   


   -- Instance port mappings.
   --  Instance port mappings.
   -- 
   AluController : AluCont
      PORT MAP (
         Funct  => EX_Funct,
         OpCode => EX_OpCode,
         AluOp  => AluOp,
         AluSrc => AluSrc
      );
   CUnit : CLU
      PORT MAP (
         OpCode   => OpCode,
         Funct    => Funct,
         Zero     => ZERO,
         OvrFlo   => OvrFlo,
         ID_EQ    => ID_EQ,
         Mem2Reg  => Mem2Reg,
         RegDest  => RegDest,
         RegWr    => RegWr,
         ExtOp    => ExtOp,
         ID_PcSrc => ID_PcSrc,
         MemWr    => MemWr,
         LUI      => LUI,
         ID_JR    => ID_JR,
         JAL      => JAL,
         SLT_EN   => SLT_EN,
         SRL_SLL  => ID_SRL_SLL,
         LL       => LL,
         SC       => SC
      );
   DtReturn : DataRtn
      PORT MAP (
         EX_AluOut => EX_AluOut,
         Imm16     => EX_Imm16,
         JAL       => EX_JAL,
         LUI       => EX_LUI,
         NEG       => EX_Negt,
         PC_4      => EX_PC_4,
         SLT_EN    => EX_SLT_En,
         EX_Out    => EX_Out
      );
   DecBlk : Decode
      PORT MAP (
         Instr32 => ID_Instr,
         Funct   => Funct,
         Imm16   => Imm16,
         OpCode  => OpCode,
         Rd      => Rd,
         Rs      => Rs,
         Rt      => Rt,
         Shamt   => Shamt
      );
   EXMEM : EXMEM_REG
      PORT MAP (
         CLK         => CLK,
         nReset      => nReset,
         Freeze      => Freeze,
         EX_BusB     => EX_BusB,
         EX_Out      => EX_Out,
         EX_Rw       => EX_Rw,
         EX_MemWr    => EX_MemWr,
         EX_Halt     => EX_Halt,
         EX_MEM2REG  => EX_MEM2REG,
         EX_REGWR    => EX_REGWR,
         EX_LL       => EX_LL,
         EX_SC       => EX_SC,
         MEM_BusB    => MEM_BusB,
         MEM_Out     => MEM_Out_internal,
         MEM_Rw      => MEM_Rw_internal,
         MEM_MemWr   => MEM_MemWr,
         MEM_Halt    => MEM_Halt,
         MEM_MEM2REG => MEM_MEM2REG_internal,
         MEM_REGWR   => MEM_REGWR,
         MEM_LL      => MEM_LL,
         MEM_SC      => MEM_SC
      );
   FwdIt : FwdUnit
      PORT MAP (
         EX_Out     => EX_Out,
         EX_REGWR   => EX_REGWR,
         EX_Rw      => EX_Rw,
         ID_Rs      => Rs,
         ID_Rt      => Rt,
         MEM_REGWR  => MEM_REGWR,
         MEM_Rw     => MEM_Rw_internal,
         MEM_dataIn => MEM_datain,
         ID_ASel    => ID_ASel,
         ID_BSel    => ID_BSel,
         ID_FwdA    => ID_FwdA,
         ID_FwdB    => ID_FwdB
      );
   IDEX : IDEX_REG
      PORT MAP (
         CLK        => CLK,
         nReset     => nReset,
         Freeze     => Freeze,
         ID_Imm16   => Imm16,
         ID_PC_4    => ID_PC_4,
         ID_BusA    => ID_FwdMuxA,
         ID_BusB    => ID_FwdMuxB,
         ID_Shamt32 => Shamt32,
         ID_XtdOut  => ID_XtdOut,
         ID_OpCode  => OpCode,
         ID_Funct   => Funct,
         ID_Rw      => ID_Rw,
         ID_Rt      => Rt,
         ID_SLT_En  => SLT_EN,
         ID_JAL     => JAL,
         ID_MemWr   => MemWr,
         ID_LUI     => LUI,
         ID_FLUSH   => ID_FLUSH,
         ID_MEM2REG => Mem2Reg,
         ID_REGWR   => RegWr,
         ID_SRL_SLL => ID_SRL_SLL,
         ID_Halt    => HALT1,
         ID_LL      => LL,
         ID_SC      => SC,
         EX_Imm16   => EX_Imm16,
         EX_PC_4    => EX_PC_4,
         EX_BusA    => EX_BusA,
         EX_BusB    => EX_BusB,
         EX_Shamt32 => EX_Shamt32,
         EX_XtdOut  => EX_XtdOut,
         EX_OpCode  => EX_OpCode,
         EX_Funct   => EX_Funct,
         EX_Rw      => EX_Rw,
         EX_Rt      => EX_Rt,
         EX_SLT_En  => EX_SLT_En,
         EX_JAL     => EX_JAL,
         EX_MemWr   => EX_MemWr,
         EX_LUI     => EX_LUI,
         EX_Halt    => EX_Halt,
         EX_LL      => EX_LL,
         EX_SC      => EX_SC,
         EX_MEM2REG => EX_MEM2REG,
         EX_REGWR   => EX_REGWR,
         EX_SRL_SLL => EX_SRL_SLL
      );
   IFID : IFID_REG
      PORT MAP (
         CLK      => CLK,
         Freeze   => Freeze,
         ID_FLUSH => ID_FLUSH,
         ID_PcSrc => ID_PcSrc,
         IF_Instr => IF_Instr,
         IF_PC_4  => IF_PC_4,
         halt     => HALT1,
         hit      => hit,
         nReset   => nReset,
         ID_Instr => ID_Instr,
         ID_PC_4  => ID_PC_4
      );
   JJALCONT : J_JAL
      PORT MAP (
         IF_Instr   => IF_Instr,
         IF_JAddr26 => IF_JAddr26,
         IF_JMP     => IF_JMP
      );
   MEMWB : MEMWB_REG
      PORT MAP (
         CLK        => CLK,
         Freeze     => Freeze,
         MEM_Halt   => MEM_Halt,
         MEM_REGWR  => MEM_REGWR,
         MEM_Rw     => MEM_Rw_internal,
         MEM_datain => MEM_datain,
         nReset     => nReset,
         WB_Halt    => WB_Halt,
         WB_REGWR   => WB_REGWR,
         WB_Rw      => WB_Rw,
         WB_datain  => WB_datain
      );
   PCBlk : PcBlock
      PORT MAP (
         BusA       => rdat1,
         ID_Imm16L2 => ID_Imm16L2,
         ID_JR      => ID_JR,
         ID_PcSrc   => ID_PcSrc,
         IF_PCSkip  => IF_PCSkip,
         JAddr26    => IF_JAddr26,
         JMP        => IF_JMP,
         clk        => CLK,
         nReset     => nReset,
         PC         => PC_internal,
         PC_4       => IF_PC_4
      );
   Xtd : ShiftXtd
      PORT MAP (
         ExtOp      => ExtOp,
         Imm16      => Imm16,
         Shamt      => Shamt,
         ID_Imm16L2 => ID_Imm16L2,
         Shamt32    => Shamt32,
         XtdOut     => ID_XtdOut
      );
   ALUnit : alu
      PORT MAP (
         A        => EX_BusA,
         B        => B,
         OPCODE   => AluOp,
         NEGATIVE => EX_Negt,
         OVERFLOW => OvrFlo,
         ZERO     => ZERO,
         aluOut   => EX_AluOut
      );
   RegFL : registerFile
      PORT MAP (
         clk    => CLK,
         nReset => nReset,
         rsel1  => Rs,
         rsel2  => Rt,
         wdat   => WB_datain,
         wen    => WB_REGWR,
         wsel   => WB_Rw,
         rdat1  => rdat1,
         rdat2  => rdat2
      );

   -- Implicit buffered output assignments
   MEM_Rw <= MEM_Rw_internal;

END struct;
