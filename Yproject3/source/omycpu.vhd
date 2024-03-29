-- VHDL Entity lab6_lib.myCpu.symbol
--
-- Created:
--          by - mg255.bin (cparch03.ecn.purdue.edu)
--          at - 14:09:09 10/24/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY myCpu IS
   PORT( 
      CLK      : IN     std_logic;
      nReset   : IN     std_logic;
      ramQ     : IN     std_logic_vector (31 DOWNTO 0);
      ramState : IN     std_logic_vector (1 DOWNTO 0);
      ramAddr  : OUT    std_logic_vector (15 DOWNTO 0);
      ramData  : OUT    std_logic_vector (31 DOWNTO 0);
      ramWen   : OUT    std_logic;
      ramRen   : OUT    std_logic;
      Halt     : OUT    std_logic
   );

-- Declarations

END myCpu ;

--
-- VHDL Architecture lab6_lib.myCpu.struct
--
-- Created:
--          by - mg255.bin (cparch03.ecn.purdue.edu)
--          at - 14:09:09 10/24/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--
-- 
--  VHDL Architecture lab5_lib.myCpu.struct
-- 
--  Created:
--           by - mg255.bin (cparch10.ecn.purdue.edu)
--           at - 12:37:30 09/21/11
-- 
--  Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
-- 
-- 
LIBRARY altera_mf;
USE altera_mf.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ARCHITECTURE struct OF myCpu IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL MemWr       : std_logic;
   SIGNAL MEM_MEM2REG : std_logic;
   SIGNAL MEM_REGWR   : std_logic;
   SIGNAL EX_AluOut   : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Negt     : std_logic;
   SIGNAL AluOp       : std_logic_vector(2 DOWNTO 0);
   SIGNAL EX_Funct    : std_logic_vector(5 DOWNTO 0);
   SIGNAL EX_OpCode   : std_logic_vector(5 DOWNTO 0);
   SIGNAL EX_BusA     : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Imm16    : std_logic_vector(15 DOWNTO 0);
   SIGNAL EX_PC_4     : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_BusB     : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_SLT_En   : std_logic;
   SIGNAL EX_JAL      : std_logic;
   SIGNAL EX_MemWr    : std_logic;
   SIGNAL EX_LUI      : std_logic;
   SIGNAL EX_MEM2REG  : std_logic;
   SIGNAL EX_REGWR    : std_logic;
   SIGNAL EX_XtdOut   : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_SLMuxOut : std_logic_vector(31 DOWNTO 0);
   SIGNAL B           : std_logic_vector(31 DOWNTO 0);
   SIGNAL AluSrc      : std_logic;
   SIGNAL WB_REGWR    : std_logic;
   SIGNAL Shamt32     : std_logic_vector(31 DOWNTO 0);
   SIGNAL Rt          : std_logic_vector(4 DOWNTO 0);
   SIGNAL Rs          : std_logic_vector(4 DOWNTO 0);
   SIGNAL rdat1       : std_logic_vector(31 DOWNTO 0);     -- read port 1
   SIGNAL rdat2       : std_logic_vector(31 DOWNTO 0);     -- read port 2
   SIGNAL Funct       : std_logic_vector(5 DOWNTO 0);
   SIGNAL Imm16       : std_logic_vector(15 DOWNTO 0);
   SIGNAL OpCode      : std_logic_vector(5 DOWNTO 0);
   SIGNAL Shamt       : std_logic_vector(4 DOWNTO 0);
   SIGNAL IF_PC_4     : std_logic_vector(31 DOWNTO 0);
   SIGNAL IF_JAddr26  : std_logic_vector(25 DOWNTO 0);
   SIGNAL IF_JMP      : std_logic;
   SIGNAL HALT1       : std_logic;
   SIGNAL IF_Instr    : std_logic_vector(31 DOWNTO 0);
   SIGNAL MEM_ramOut  : std_logic_vector(31 DOWNTO 0);
   SIGNAL PC          : std_logic_vector(31 DOWNTO 0);
   SIGNAL MEM_BusB    : std_logic_vector(31 DOWNTO 0);
   SIGNAL MEM_MemWr   : std_logic;
   SIGNAL ID_XtdOut   : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_PC_4     : std_logic_vector(31 DOWNTO 0);
   SIGNAL ExtOp       : std_logic;
   SIGNAL OvrFlo      : std_logic;
   SIGNAL ZERO        : std_logic;
   SIGNAL LUI         : std_logic;
   SIGNAL RegWr       : std_logic;
   SIGNAL JAL         : std_logic;
   SIGNAL SLT_EN      : std_logic;
   SIGNAL ID_Instr    : std_logic_vector(31 DOWNTO 0);
   SIGNAL Mem2Reg     : std_logic;
   SIGNAL RegDest     : std_logic;
   SIGNAL Rd          : std_logic_vector(4 DOWNTO 0);
   SIGNAL Freeze      : std_logic;
   SIGNAL IF_PCSkip   : std_logic;
   SIGNAL EX_Halt     : std_logic;
   SIGNAL MEM_Halt    : std_logic;
   SIGNAL ID_EQ       : std_logic;                         -- branch purposes
   SIGNAL ID_PcSrc    : std_logic;
   --					JMP,PcSrc,LD												: out std_logic;
   SIGNAL ID_JR       : std_logic;
   SIGNAL ID_Imm16L2  : std_logic_vector(31 DOWNTO 0);
   SIGNAL MEM_datain  : std_logic_vector(31 DOWNTO 0);
   SIGNAL MEM_Out     : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Out      : std_logic_vector(31 DOWNTO 0);
   SIGNAL WB_datain   : std_logic_vector(31 DOWNTO 0);
   SIGNAL MEM_Rw      : std_logic_vector(4 DOWNTO 0);
   SIGNAL ID_Rw       : std_logic_vector(4 DOWNTO 0);
   SIGNAL ID_SRL_SLL  : std_logic;
   SIGNAL WB_Rw       : std_logic_vector(4 DOWNTO 0);
   SIGNAL EX_Shamt32  : std_logic_vector(31 DOWNTO 0);
   SIGNAL EX_Rw       : std_logic_vector(4 DOWNTO 0);
   SIGNAL EX_SRL_SLL  : std_logic;
   SIGNAL EX_Rt       : std_logic_vector(4 DOWNTO 0);
   SIGNAL ID_FLUSH    : std_logic;
   SIGNAL ID_ASel     : std_logic;
   SIGNAL ID_BSel     : std_logic;
   SIGNAL ID_FwdA     : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_FwdB     : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_FwdMuxA  : std_logic_vector(31 DOWNTO 0);
   SIGNAL ID_FwdMuxB  : std_logic_vector(31 DOWNTO 0);
   SIGNAL hit         : std_logic;
   SIGNAL icache_en   : std_logic;
   SIGNAL INSTR_OUT   : std_logic_vector(31 DOWNTO 0);
   SIGNAL tag_in      : std_logic_vector( 25 DOWNTO 0);
   SIGNAL index_in    : std_logic_vector( 3 DOWNTO 0);
   SIGNAL stop        : std_logic;


   -- Component Declarations
   COMPONENT AluCont
   PORT (
      OpCode : IN     std_logic_vector (5 DOWNTO 0);
      Funct  : IN     std_logic_vector (5 DOWNTO 0); -- 1= sign 0 = zero extend
      AluSrc : OUT    std_logic ;
      AluOp  : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT CLU
   PORT (
      OpCode   : IN     std_logic_vector (5 DOWNTO 0);
      Funct    : IN     std_logic_vector (5 DOWNTO 0);
      Zero     : IN     std_logic ;
      OvrFlo   : IN     std_logic ;
      ID_EQ    : IN     std_logic ;
      Mem2Reg  : OUT    std_logic ;
      RegDest  : OUT    std_logic ;
      RegWr    : OUT    std_logic ;
      ExtOp    : OUT    std_logic ;
      ID_PcSrc : OUT    std_logic ;
      --					JMP,PcSrc,LD												: out std_logic;
      MemWr    : OUT    std_logic ;
      --					JMP,PcSrc,LD												: out std_logic;
      LUI      : OUT    std_logic ;
      --					JMP,PcSrc,LD												: out std_logic;
      ID_JR    : OUT    std_logic ;
      --					JMP,PcSrc,LD												: out std_logic;
      JAL      : OUT    std_logic ;
      --					JMP,PcSrc,LD												: out std_logic;
      SLT_EN   : OUT    std_logic ;
      --					JMP,PcSrc,LD												: out std_logic;
      SRL_SLL  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DataRtn
   PORT (
      SLT_EN    : IN     std_logic ;
      LUI       : IN     std_logic ;
      NEG       : IN     std_logic ;
      JAL       : IN     std_logic ;
      Imm16     : IN     std_logic_vector (15 DOWNTO 0);
      PC_4      : IN     std_logic_vector (31 DOWNTO 0);
      EX_AluOut : IN     std_logic_vector (31 DOWNTO 0);
      EX_Out    : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Decode
   PORT (
      Instr32 : IN     std_logic_vector (31 DOWNTO 0);
      --    			HALT								: out std_logic;
      Imm16   : OUT    std_logic_vector (15 DOWNTO 0);
      --          JAddr26              : out std_logic_vector(25 downto 0);
      Shamt   : OUT    std_logic_vector (4 DOWNTO 0);
      Funct   : OUT    std_logic_vector (5 DOWNTO 0);
      Rt      : OUT    std_logic_vector (4 DOWNTO 0);
      Rs      : OUT    std_logic_vector (4 DOWNTO 0);
      Rd      : OUT    std_logic_vector (4 DOWNTO 0);
      OpCode  : OUT    std_logic_vector (5 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT EXMEM_REG
   PORT (
      CLK         : IN     std_logic ;
      nReset      : IN     std_logic ;
      Freeze      : IN     std_logic ;                   -- branch purposes
      EX_BusB     : IN     std_logic_vector (31 DOWNTO 0);
      EX_Out      : IN     std_logic_vector (31 DOWNTO 0);
      EX_Rw       : IN     std_logic_vector (4 DOWNTO 0);
      EX_MemWr    : IN     std_logic ;
      EX_Halt     : IN     std_logic ;
      EX_MEM2REG  : IN     std_logic ;
      EX_REGWR    : IN     std_logic ;
      MEM_BusB    : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_Out     : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      MEM_MemWr   : OUT    std_logic ;
      MEM_Halt    : OUT    std_logic ;
      MEM_MEM2REG : OUT    std_logic ;
      MEM_REGWR   : OUT    std_logic 
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
      CLK        : IN     std_logic ;
      nReset     : IN     std_logic ;
      Freeze     : IN     std_logic ;                    -- branch purposes
      ID_Imm16   : IN     std_logic_vector (15 DOWNTO 0);
      ID_PC_4    : IN     std_logic_vector (31 DOWNTO 0);
      ID_BusA    : IN     std_logic_vector (31 DOWNTO 0);
      ID_BusB    : IN     std_logic_vector (31 DOWNTO 0);
      ID_Shamt32 : IN     std_logic_vector (31 DOWNTO 0);
      ID_XtdOut  : IN     std_logic_vector (31 DOWNTO 0);
      ID_OpCode  : IN     std_logic_vector (5 DOWNTO 0);
      ID_Funct   : IN     std_logic_vector (5 DOWNTO 0);
      ID_Rw      : IN     std_logic_vector (4 DOWNTO 0);
      ID_Rt      : IN     std_logic_vector (4 DOWNTO 0); --       ID_Rs,
      ID_SLT_En  : IN     std_logic ;
      ID_JAL     : IN     std_logic ;
      ID_MemWr   : IN     std_logic ;
      ID_LUI     : IN     std_logic ;
      ID_FLUSH   : IN     std_logic ;
      ID_MEM2REG : IN     std_logic ;
      ID_REGWR   : IN     std_logic ;
      ID_SRL_SLL : IN     std_logic ;
      ID_Halt    : IN     std_logic ;
      EX_Imm16   : OUT    std_logic_vector (15 DOWNTO 0);
      EX_PC_4    : OUT    std_logic_vector (31 DOWNTO 0);
      EX_BusA    : OUT    std_logic_vector (31 DOWNTO 0);
      EX_BusB    : OUT    std_logic_vector (31 DOWNTO 0);
      EX_Shamt32 : OUT    std_logic_vector (31 DOWNTO 0);
      EX_XtdOut  : OUT    std_logic_vector (31 DOWNTO 0);
      EX_OpCode  : OUT    std_logic_vector (5 DOWNTO 0);
      EX_Funct   : OUT    std_logic_vector (5 DOWNTO 0);
      EX_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      EX_Rt      : OUT    std_logic_vector (4 DOWNTO 0); --            EX_Rs,
      EX_SLT_En  : OUT    std_logic ;
      EX_JAL     : OUT    std_logic ;
      EX_MemWr   : OUT    std_logic ;
      EX_LUI     : OUT    std_logic ;
      EX_Halt    : OUT    std_logic ;
      EX_MEM2REG : OUT    std_logic ;
      EX_REGWR   : OUT    std_logic ;
      EX_SRL_SLL : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT IFID_REG
   PORT (
      CLK      : IN     std_logic ;
      nReset   : IN     std_logic ;
      Freeze   : IN     std_logic ;
      ID_FLUSH : IN     std_logic ;
      hit      : IN     std_logic ;
      halt     : IN     std_logic ;
      ID_PcSrc : IN     std_logic ;                   -- branch purposes
      IF_Instr : IN     std_logic_vector (31 DOWNTO 0);
      IF_PC_4  : IN     std_logic_vector (31 DOWNTO 0);
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
      CLK        : IN     std_logic ;
      nReset     : IN     std_logic ;
      Freeze     : IN     std_logic ;                   -- branch purposes
      MEM_datain : IN     std_logic_vector (31 DOWNTO 0);
      MEM_Rw     : IN     std_logic_vector (4 DOWNTO 0);
      MEM_REGWR  : IN     std_logic ;
      MEM_Halt   : IN     std_logic ;
      WB_datain  : OUT    std_logic_vector (31 DOWNTO 0);
      WB_Rw      : OUT    std_logic_vector (4 DOWNTO 0);
      WB_REGWR   : OUT    std_logic ;
      WB_Halt    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MemCont
   PORT (
      Clk         : IN     std_logic ;
      nReset      : IN     std_logic ;
      ramQ        : IN     std_logic_vector (31 DOWNTO 0);
      ramState    : IN     std_logic_vector (1 DOWNTO 0);
      MEM_BusB    : IN     std_logic_vector (31 DOWNTO 0);
      PC          : IN     std_logic_vector (31 DOWNTO 0);
      MEM_Out     : IN     std_logic_vector (31 DOWNTO 0);
      MEM_MemWr   : IN     std_logic ;
      MEM_Mem2Reg : IN     std_logic ;
      ID_PcSrc    : IN     std_logic ;
      ID_FLUSH    : IN     std_logic ;
      HALT        : IN     std_logic ;
      hit         : IN     std_logic ;
      ramAddr     : OUT    std_logic_vector (15 DOWNTO 0);
      ramData     : OUT    std_logic_vector (31 DOWNTO 0);
      MEM_ramOut  : OUT    std_logic_vector (31 DOWNTO 0);
      INSTR_OUT   : OUT    std_logic_vector (31 DOWNTO 0);
      ramWen      : OUT    std_logic ;
      IF_PCSkip   : OUT    std_logic ;
      ramRen      : OUT    std_logic ;
      Freeze      : OUT    std_logic ;
      stopIcache  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PcBlock
   PORT (
      clk        : IN     std_logic ;
      nReset     : IN     std_logic ;
      ID_PcSrc   : IN     std_logic ;
      ID_JR      : IN     std_logic ;
      JMP        : IN     std_logic ;
      IF_PCSkip  : IN     std_logic ;
      BusA       : IN     std_logic_vector (31 DOWNTO 0);
      ID_Imm16L2 : IN     std_logic_vector (31 DOWNTO 0);
      JAddr26    : IN     std_logic_vector (25 DOWNTO 0);
      PC         : OUT    std_logic_vector (31 DOWNTO 0);
      PC_4       : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT ShiftXtd
   PORT (
      Imm16      : IN     std_logic_vector (15 DOWNTO 0);
      ExtOp      : IN     std_logic ;                   -- 1= sign 0 = zero extend
      Shamt      : IN     std_logic_vector (4 DOWNTO 0);
      ID_Imm16L2 : OUT    std_logic_vector (31 DOWNTO 0);
      XtdOut     : OUT    std_logic_vector (31 DOWNTO 0);
      Shamt32    : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT alu
   PORT (
      OPCODE   : IN     std_logic_vector (2 DOWNTO 0);
      A        : IN     std_logic_vector (31 DOWNTO 0);
      B        : IN     std_logic_vector (31 DOWNTO 0);
      aluOut   : OUT    std_logic_vector (31 DOWNTO 0);
      NEGATIVE : OUT    std_logic ;
      OVERFLOW : OUT    std_logic ;
      ZERO     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT icache
   PORT (
      clk       : IN     std_logic;
      data_in   : IN     std_logic_vector ( 31 DOWNTO 0);
      icache_en : IN     std_logic;
      index_in  : IN     std_logic_vector ( 3 DOWNTO 0);
      nrst      : IN     std_logic;
      tag_in    : IN     std_logic_vector ( 25 DOWNTO 0);
      data_out  : OUT    std_logic_vector (31 DOWNTO 0);
      hit       : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT icache_ctrl
   PORT (
      clk       : IN     std_logic;
      hit       : IN     std_logic;
      nrst      : IN     std_logic;
      ramstate  : IN     std_logic_vector ( 1 DOWNTO 0);
      stop      : IN     std_logic;
      icache_en : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT registerFile
   PORT (
      -- Write data input port
      wdat   : IN     std_logic_vector (31 DOWNTO 0);
      -- Select which register to write
      wsel   : IN     std_logic_vector (4 DOWNTO 0);
      -- Write Enable for entire register file
      wen    : IN     std_logic ;
      -- clock, positive edge triggered
      clk    : IN     std_logic ;
      -- REMEMBER: nReset-> '0' = RESET, '1' = RUN
      nReset : IN     std_logic ;
      -- Select which register to read on rdat1
      rsel1  : IN     std_logic_vector (4 DOWNTO 0);
      -- Select which register to read on rdat2
      rsel2  : IN     std_logic_vector (4 DOWNTO 0);
      -- read port 1
      rdat1  : OUT    std_logic_vector (31 DOWNTO 0);
      -- read port 2
      rdat2  : OUT    std_logic_vector (31 DOWNTO 0)
   );
   END COMPONENT;


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 ID_Hzd
   ID_Rw <= Rd when RegDest ='1' else Rt;                --RegDestMux
   HALT1 <= '1' when ID_Instr = x"FFFFFFFF" else '0';    -- STOP
   ID_EQ <= '1' when ID_FwdMuxA = ID_FwdMuxB else '0';             -- xor block
   ID_FLUSH <= '1' WHEN (EX_MEM2REG ='1' AND (EX_RT = RS OR EX_RT=RT)) else -- lw always uses RT       
               '0';--Mem to Register and read back to back
   ID_FwdMuxA <= ID_FwdA when ID_ASel='1' else rdat1;    -- FwdA mux
   ID_FwdMuxB <= ID_FwdB when ID_BSel='1' else rdat2;    -- FwdB mux
   
   
   

   -- HDL Embedded Text Block 2 EXeb
   EX_SLMuxOut <= EX_Shamt32 when EX_SRL_SLL='1' else  EX_BusB;    --SLMux
   B <= EX_XtdOut when AluSrc ='1' else  EX_SLMuxOut;                --AluSrcMux

   -- HDL Embedded Text Block 3 MemEb
   MEM_datain <= MEM_ramOut when MEM_Mem2Reg = '1' else MEM_Out;

   -- HDL Embedded Text Block 4 ID_Hzd1
   tag_in <= PC(31 downto 6);
   index_in <= PC(5 downto 2);
   


   -- Instance port mappings.
   --   Instance port mappings.
   -- 
   AluController : AluCont
      PORT MAP (
         OpCode => EX_OpCode,
         Funct  => EX_Funct,
         AluSrc => AluSrc,
         AluOp  => AluOp
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
         SRL_SLL  => ID_SRL_SLL
      );
   DtReturn : DataRtn
      PORT MAP (
         SLT_EN    => EX_SLT_En,
         LUI       => EX_LUI,
         NEG       => EX_Negt,
         JAL       => EX_JAL,
         Imm16     => EX_Imm16,
         PC_4      => EX_PC_4,
         EX_AluOut => EX_AluOut,
         EX_Out    => EX_Out
      );
   DecBlk : Decode
      PORT MAP (
         Instr32 => ID_Instr,
         Imm16   => Imm16,
         Shamt   => Shamt,
         Funct   => Funct,
         Rt      => Rt,
         Rs      => Rs,
         Rd      => Rd,
         OpCode  => OpCode
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
         MEM_BusB    => MEM_BusB,
         MEM_Out     => MEM_Out,
         MEM_Rw      => MEM_Rw,
         MEM_MemWr   => MEM_MemWr,
         MEM_Halt    => MEM_Halt,
         MEM_MEM2REG => MEM_MEM2REG,
         MEM_REGWR   => MEM_REGWR
      );
   FwdIt : FwdUnit
      PORT MAP (
         ID_Rs      => Rs,
         ID_Rt      => Rt,
         EX_Rw      => EX_Rw,
         EX_REGWR   => EX_REGWR,
         EX_Out     => EX_Out,
         MEM_Rw     => MEM_Rw,
         MEM_REGWR  => MEM_REGWR,
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
         EX_MEM2REG => EX_MEM2REG,
         EX_REGWR   => EX_REGWR,
         EX_SRL_SLL => EX_SRL_SLL
      );
   IFID : IFID_REG
      PORT MAP (
         CLK      => CLK,
         nReset   => nReset,
         Freeze   => Freeze,
         ID_FLUSH => ID_FLUSH,
         hit      => hit,
         halt     => HALT1,
         ID_PcSrc => ID_PcSrc,
         IF_Instr => IF_Instr,
         IF_PC_4  => IF_PC_4,
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
         nReset     => nReset,
         Freeze     => Freeze,
         MEM_datain => MEM_datain,
         MEM_Rw     => MEM_Rw,
         MEM_REGWR  => MEM_REGWR,
         MEM_Halt   => MEM_Halt,
         WB_datain  => WB_datain,
         WB_Rw      => WB_Rw,
         WB_REGWR   => WB_REGWR,
         WB_Halt    => Halt
      );
   MCont : MemCont
      PORT MAP (
         Clk         => CLK,
         nReset      => nReset,
         ramQ        => ramQ,
         ramState    => ramState,
         MEM_BusB    => MEM_BusB,
         PC          => PC,
         MEM_Out     => MEM_Out,
         MEM_MemWr   => MEM_MemWr,
         MEM_Mem2Reg => MEM_MEM2REG,
         ID_PcSrc    => ID_PcSrc,
         ID_FLUSH    => ID_FLUSH,
         HALT        => HALT1,
         hit         => hit,
         ramAddr     => ramAddr,
         ramData     => ramData,
         MEM_ramOut  => MEM_ramOut,
         INSTR_OUT   => INSTR_OUT,
         ramWen      => ramWen,
         IF_PCSkip   => IF_PCSkip,
         ramRen      => ramRen,
         Freeze      => Freeze,
         stopIcache  => stop
      );
   PCBlk : PcBlock
      PORT MAP (
         clk        => CLK,
         nReset     => nReset,
         ID_PcSrc   => ID_PcSrc,
         ID_JR      => ID_JR,
         JMP        => IF_JMP,
         IF_PCSkip  => IF_PCSkip,
         BusA       => rdat1,
         ID_Imm16L2 => ID_Imm16L2,
         JAddr26    => IF_JAddr26,
         PC         => PC,
         PC_4       => IF_PC_4
      );
   Xtd : ShiftXtd
      PORT MAP (
         Imm16      => Imm16,
         ExtOp      => ExtOp,
         Shamt      => Shamt,
         ID_Imm16L2 => ID_Imm16L2,
         XtdOut     => ID_XtdOut,
         Shamt32    => Shamt32
      );
   ALUnit : alu
      PORT MAP (
         OPCODE   => AluOp,
         A        => EX_BusA,
         B        => B,
         aluOut   => EX_AluOut,
         NEGATIVE => EX_Negt,
         OVERFLOW => OvrFlo,
         ZERO     => ZERO
      );
   icacheBlk : icache
      PORT MAP (
         clk       => CLK,
         nrst      => nReset,
         tag_in    => tag_in,
         data_in   => INSTR_OUT,
         data_out  => IF_Instr,
         index_in  => index_in,
         hit       => hit,
         icache_en => icache_en
      );
   IcacheCLU : icache_ctrl
      PORT MAP (
         clk       => CLK,
         nrst      => nReset,
         stop      => stop,
         hit       => hit,
         ramstate  => ramState,
         icache_en => icache_en
      );
   RegFL : registerFile
      PORT MAP (
         wdat   => WB_datain,
         wsel   => WB_Rw,
         wen    => WB_REGWR,
         clk    => CLK,
         nReset => nReset,
         rsel1  => Rs,
         rsel2  => Rt,
         rdat1  => rdat1,
         rdat2  => rdat2
      );

END struct;
