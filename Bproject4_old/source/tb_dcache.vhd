-- $Id: $
-- File name:   tb_dcache.vhd
-- Created:     10/25/2011
-- Author:      Yonatan Feleke
-- Lab Section: Wednesday 2:30-5:20
-- Version:     1.0  Initial Test Bench

library ieee;
use std.textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity tb_dcache is
generic (Period : Time := 10 ns);
end tb_dcache;

architecture TEST of tb_dcache is
  component dcache
    PORT(
         CLK : in std_logic;
         nReset : in std_logic;
         Halt : in std_logic;
         MemRead : in std_logic;
         MemWrite : in std_logic;
         MemWait : out std_logic;
         MemAddr : in std_logic_vector (31 downto 0);
         MemRdData : out std_logic_vector (31 downto 0);
         MemWrData : in std_logic_vector (31 downto 0);
         finalHalt : out std_logic;
         aMemWait : in std_logic;
         aMemState : in std_logic_vector (1 downto 0);
         aMemRead : out std_logic;
         aMemWrite : out std_logic;
         aMemAddr : out std_logic_vector (31 downto 0);
         aMemRdData : in std_logic_vector (31 downto 0);
         aMemWrData : out std_logic_vector (31 downto 0)
    );
  end component;
	component VarLatRAM
		port(
			nReset						:	in	std_logic;
			clock							:	in	std_logic;
			address						:	in	std_logic_vector(15 downto 0);
			data							:	in	std_logic_vector(31 downto 0);
			wren							:	in	std_logic;
			rden							:	in	std_logic;
			latency_override	:	in	std_logic;
			q									:	out	std_logic_vector(31 downto 0);
			memstate					:	out	std_logic_vector(1 downto 0)
		);
	end component;   

-- Insert signals Declarations here
  signal CLK : std_logic;
  signal nReset : std_logic;
  signal Halt : std_logic;
  signal MemRead : std_logic;
  signal MemWrite : std_logic;
  signal MemWait : std_logic;
  signal MemAddr : std_logic_vector (31 downto 0);
  signal MemRdData : std_logic_vector (31 downto 0);
  signal MemWrData : std_logic_vector (31 downto 0);
  signal finalHalt : std_logic;
  signal aMemWait : std_logic;
  signal aMemState : std_logic_vector (1 downto 0);
  signal aMemRead : std_logic;
  signal aMemWrite : std_logic;
  signal aMemAddr : std_logic_vector (31 downto 0);
  signal aMemRdData : std_logic_vector (31 downto 0);
  signal aMemWrData : std_logic_vector (31 downto 0);


  signal wren, rden, latover : std_logic;
	signal iMemdata, aiMemData :	std_logic_vector(31 downto 0);
	signal iMemAddr, aiMemAddr : std_logic_vector(31 downto 0);
	signal aiMemState : std_logic_vector(1 downto 0);
	signal startwrite : std_logic;

	constant ONESB : std_logic := '1';
	constant zero : std_logic := '0';
begin




CLKGEN: process
  variable CLK_tmp: std_logic := '0';
	begin
  	CLK_tmp := not CLK_tmp;
	  CLK <= CLK_tmp;
	  wait for Period/2;
	end process;

  dcacheBlk: dcache port map(
                CLK => CLK,
                nReset => nReset,
                Halt => Halt,
                MemRead => MemRead,
                MemWrite => MemWrite,
                MemWait => MemWait,
                MemAddr => MemAddr,
                MemRdData => MemRdData,
                MemWrData => MemWrData,
                finalHalt => finalHalt,
                aMemWait => zero,
                aMemState => aMemState,
                aMemRead => aMemRead,
                aMemWrite => aMemWrite,
                aMemAddr => aMemAddr,
                aMemRdData => aMemRdData,
                aMemWrData => aMemWrData
                );

--SYNRAM: VarLatRAM port map(nReset, clk, aiMemAddr(15 downto 0), ZEROV, ZEROB, aiMemRead, ONESB, aiMemData, aiMemState);
SYNRAM: VarLatRAM 
        port map
        (
                nReset 			=>    nReset,
                clock       =>    clk,
                address     =>    aMemAddr(15 downto 0),
                data        =>   	aMemWrData,
                wren        =>    aMemWrite,
                rden        =>    aMemRead,
                latency_override=>zero,
                q          	=>		aMemRdData,
                memstate    =>    aMemState
        );


--port map(nReset, clk, aMemAddr(15 downto 0), aMemWrData, ZEROB, aMemRead, ONESB, aiMemData, aiMemState);
----------------------------------------------------------
-- print cycles for execution
  printprocess : process
    variable cycles : integer := 0;
    variable lout : line;
  begin
    if (nreset = '1') then
        cycles := cycles + 1;
        if (cycles mod 32 = 0) then
						report "Cycle number at " severity NOTE;        
            write(lout, string'("Cycle #"));
            write(lout, integer'(cycles));
            writeline(output, lout);
        end if;
    end if;
    if (halt = '1') then
			report "Halted!: " severity NOTE;        
      write(lout, string'("Halted, cycles="));
      write(lout, integer'(cycles));
      writeline(output, lout);
			wait on halt;
    end if;
    wait for Period;
  end process;
---------------------------------------------------------


	testing_process : process 
		variable i : integer := 0;
		begin
						MemAddr <= x"00000000";
						MemRead <= '0';
						MemWrite<= '0';
            nReset <= '0';
						halt <= '0';
						startwrite <= '0';
            wait for 4 * Period;
            nReset <= '1';
						MemRead <= '1';
						while startwrite = '0' loop
							MemAddr <= std_logic_vector(to_unsigned(i, 32));
							wait until Memwait = '0';
							wait for Period;
							i := i + 4;
							if (i > 64) then
								startwrite <= '1';
							end if;
						end loop;
						-- wirte cycle
						i := 128; --x"80"
						halt <= '0';
						MemRead <= '0';
						wait for Period;
						MemWrite <= '1';
						-- wirte cycle
						report "Wrtie Cycle started!: " severity NOTE;
						while halt = '0' loop
							MemAddr <= std_logic_vector(to_unsigned(i, 32));
							MemWrData <= (std_logic_vector(to_unsigned(i, 28))& "0000");
							wait until Memwait = '0';
							wait for Period;
							i := i + 4;
							if (i > 160) then --x90
								halt <= '1';
							end if;
						end loop;

						while halt = '0' loop
							MemAddr <= std_logic_vector(to_unsigned(i, 32));
							wait for Period;
							i := i + 4;
							if (i > 64) then
								halt <= '1';
								i := 0;
							end if;
						end loop;
            wait;
		end process;
end TEST;
