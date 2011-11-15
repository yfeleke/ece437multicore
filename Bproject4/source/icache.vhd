library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all; entity
icache is port( clk, nrst: in std_logic; tag_in: in std_logic_vector( 25 downto
0); data_in: in std_logic_vector( 31 downto 0); data_out: out std_logic_vector(
31 downto 0); index_in: in std_logic_vector( 3 downto 0); hit: out std_logic;
icache_en: in std_logic); end icache; architecture instr_cache of icache is
type ram is array( 15 downto 0) of std_logic_vector( 31 downto 0); type tagg is
array( 15 downto 0) of std_logic_vector( 25 downto 0); type validd is array( 15
downto 0) of std_logic; signal
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
,
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
: validd; signal
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
,
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
: ram; signal
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
,
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
: tagg; begin regg: process( clk, nrst) begin if nrst= '0' then for i in 0 to 2
loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <= '0'; end loop; for i in 11 to 15 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <= '0'; end loop; for i in 3 to 5 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <= '0'; end loop; for i in 6 to 8 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <= '0'; end loop; for i in 9 to 10 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <= '0'; end loop; elsif rising_edge( clk) then for i in 0 to 3 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <=
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i);
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i) <=
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i);
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i) <=
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i); end loop; for i in 4 to 8 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <=
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i);
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i) <=
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i);
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i) <=
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i); end loop; for i in 9 to 10 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <=
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i);
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i) <=
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i);
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i) <=
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i); end loop; for i in 11 to 12 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <=
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i);
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i) <=
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i);
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i) <=
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i); end loop; for i in 13 to 15 loop
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i) <=
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i);
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i) <=
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i);
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i) <=
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i); end loop; end if; end process regg; nextstate: process(
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
,
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
,
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
, tag_in, data_in, icache_en, index_in) variable
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
: integer range 0 to 15; begin
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
:= to_integer( unsigned( index_in)); for i in 0 to 5 loop
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i) <=
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i);
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i) <=
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i);
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i) <=
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i); end loop; for i in 6 to 8 loop
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i) <=
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i);
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i) <=
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i);
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i) <=
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i); end loop; for i in 9 to 12 loop
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i) <=
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i);
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i) <=
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i);
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i) <=
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i); end loop; for i in 13 to 15 loop
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
( i) <=
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
( i);
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
( i) <=
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
( i);
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
( i) <=
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
( i); end loop; if icache_en= '1' then
ll11lll1l1l1llll1l11ll1ll1ll11lllllllll1llll1l11ll1l111l11l1ll1ll1l1ll11l111l11111l11l1lllll11111l111ll1llll1ll1l1llll1l111lllll
(
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
) <= tag_in;
l1lllll1l111111l1111111l1l1l1l11l1llll11ll1l1lllll1lll1ll11llll11111111llll1l1l1lllllll1ll11l11llllll11ll1l11l1ll11l1llll1l1l1l1
(
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
) <= data_in;
ll11l1ll111ll1lll1llll1llll1l1l1l11l111l1l1ll11ll11111l1l1l1111lll1111111l11l1l1l1lll1l1l1ll1111111l1l1l1l1ll11l11l11l1l1l1l1l11
(
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
) <= '1'; end if; data_out <=
l1111lll1lll11ll1ll1l11ll11ll11ll11ll1lllll1l1ll11l11ll11ll1l111l1l11111111111l11ll1l1l111l1llll1111111lll11l111l1llll11lll1ll11
(
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
); if tag_in=
l11111llll1l1llll111ll1l1111111l1ll11lll1lllll11l1l11l1l1111l1l1111l1111lll11l1l1llll11ll11111lll1ll111lll11lllll111lll11l1l1111
(
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
) and
lllllll1lll11111111llllll11llll1ll11l1ll11l1ll1l1l1l1ll1llll1lll11llll111ll1l1ll1ll11llll1ll1llllll11111l11ll1llll111lll1l1llll1
(
lllll11l1llll1ll1l11llllll1l1lll11llllll1ll1l1ll11lllll111l11lllll1l11ll1ll1ll1l111lll1l1l11ll111l1l11lllll1lll11111llll1111llll
)= '1' then hit <= '1'; else hit <= '0'; end if; end process nextstate; end;