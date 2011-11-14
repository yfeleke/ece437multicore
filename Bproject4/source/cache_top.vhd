-- cache tempalte
-- this is provided as a guide to build your cache. It is by no means unfallable.
-- you may need to update vector bit ranges to match specifications in lab handout.
--
-- THIS IS NOT ERROR FREE CODE, YOU MUST UPDATE AND VERIFY SANITY OF LOGIC/INTERFACES
--

library ieee;
use ieee.std_logic_1164.all;

entity cache_top is
  port(
    CLK       : in  std_logic;
    nReset    : in  std_logic;

	Halt		:	in	std_logic;					 -- CPU side
    MemRead		: in  std_logic;                       -- CPU side
	MemWrite	:	in	std_logic;						-- CPU side
    MemAddr		: in  std_logic_vector (31 downto 0);  -- CPU side
    MemRdData	: out	std_logic_vector (31 downto 0);  -- CPU side
    MemWrData	: in	std_logic_vector (31 downto 0);  -- CPU side

	aMemState	: in	std_logic_vector (1 downto 0);	 -- arbitrator side
    aMemRead	: out std_logic;                       -- arbitrator side
    aMemWrite	: out std_logic;                       -- arbitrator side
	aMemwData	: out std_logic_vector(31 downto 0);
    aMemAddr	: out std_logic_vector (31 downto 0);  -- arbitrator side
    aMemData	: in  std_logic_vector (31 downto 0)   -- arbitrator side
	);
end cache_top;

architecture struct of cache_top is
	component dcache_data
	port( 	
			clk, nrst	: in std_logic;
			clean		: in std_logic; 
		  	tag_in		: in std_logic_vector( 24 downto 0);
		  	data_in		: in std_logic_vector( 63 downto 0); 
			data_out	: out std_logic_vector(63 downto 0); 
			index_in	: in std_logic_vector(3 downto 0); 
			hit			: out std_logic;
			wbTag 		: out std_logic_vector(24 downto 0);
			LRUdirty	: out std_logic;
			dcache_en	: in std_logic); 
	end component;

	component cache_ctrl
	port(
		CLK					:	in	std_logic;
		nReset				:	in	std_logic;
		Hit					:	in	std_logic;
		memRd				:	in	std_logic;
		LRUdirty			:	in  std_logic;
		memWr				:	in	std_logic;
		wbTag				:	in std_logic_vector(24 downto 0);
		RamState			:	in	std_logic_vector (01 downto 0);
		memAddr				:	in	std_logic_vector (31 downto 0);
		RamWord				:	in	std_logic_vector (31 downto 0);
		CPUWord				:	in	std_logic_vector (31 downto 0);
		CacheBlockI			:	in	std_logic_vector (63 downto 0);
		CacheBlockO			:	out	std_logic_vector (63 downto 0);
		WordAddr			:	out	std_logic_vector (31 downto 0);
		RamData				:	out	std_logic_vector(31 downto 0);
		clean				:	out std_logic;
		RdEn				:	out	std_logic;
		dcache_en			:	out	std_logic;
		WrEn				:	out	std_logic	
	);
	end component;

	-- internal singals
	signal hit_int,LRUDirty_int,clean_int,dcache_en_int: std_logic; 
	signal wbTag_int: std_logic_vector(24 downto 0);
	signal tUpdatedBlock, tCacheBlock		: std_logic_vector (63 downto 0);

begin

	CACHEDATA: dcache_data port map(
		CLK,
		nReset,
		clean_int,					--control signal for setting dirty bit
		MemAddr (31 downto 7),		-- tag to look for
		tUpdatedBlock,				-- new block to put in cache
		tCacheBlock,				-- cache block from set and selected way
		MemAddr (6 downto 3),		-- set to look in
		hit_int,					-- did we find a matching cache block
		wbTag_int,					--tag for block to be written back
		LRUdirty_int,				-- is cache block dirty?
		dcache_en_int				--write enable signal for cache
);

	CCTRL: cache_ctrl port map(
		CLK,
		nReset,
		hit_int,		-- does the controller need to do anything?
		MemRead,		-- memory write to cache on misss
		LRUdirty_int,
		MemWrite,		-- cpu write to cache (depends on write policy)
		wbTag_int,
		aMemState,		-- are we there yet?
		MemAddr,		-- cache block addr (both words)
		aMemData,		-- word coming from memory
		MemWrData,		-- word coming from CPU
		tCacheBlock,	-- cache block
		tUpdatedBlock,	-- new block with requested data		
		aMemAddr,		-- memory address to get word for cache block
		aMemwData,
		clean_int,
		RdEn,
		dcache_en_int)	-- update the cache with new block
		WrEn);		

	-- return word from block 
	with MemAddr(2) select MemData <= 
		tCacheBlock(63 downto 32) when '0'
		tCacheBlock(31 downto 00) when others;	

	-- on halt: flush the cache blocks that are dirty
	-- put that logic here

end struct;