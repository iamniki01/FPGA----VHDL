library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity twocounters is
	port (
		clk1   : in  std_logic;
		rst    : in  std_logic;
		en1    : in  std_logic;
		clk2   : out  std_logic;
		rstn   : out  std_logic;
		en2    : out  std_logic
	);
end entity;

architecture behave of twocounters is

-- Active high reset, async reset, trigger on rising edge
signal q : std_logic_vector(2 downto 0) := (others => '0');

begin


counter1_proc : process (clk1, rst)
begin

	if rst = '1' then
		q <= (others => '0');
	elsif rising_edge(clk1) then 
		if en1 = '1' then
			q <= q + 1;
		else
			q <= q;
		end if;
	end if;
	
end process;
	
	
-- clk2_proc : process(clk1)
-- begin
	-- if falling_edge(clk1) then
		-- clk2 <= not clk2;
	-- end if;
-- end process;

-- enable2_proc : process(q1_int)
-- begin
	-- if q = "101" then
		-- en2 <= '1';
	-- else
		-- en2 <= '0';
	-- end if;
-- end process;

en2 <= '1' when q = "101" else '0';
clk2 <= q(0);
rstn <= not rst;


end behave;