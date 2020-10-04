library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		en  : in  std_logic;
		q : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behave of counter is

-- Active high reset, async reset, trigger o rising edge
signal q_int : std_logic_vector(3 downto 0) := (others => '0');

begin


counter_proc : process (clk, rst)
begin

	if rst = '1' then
		q_int <= (others => '0');
	elsif rising_edge(clk) then 
		if en = '1' then
			q_int <= q_int + 1;
		else
			q_int <= q_int -1;
		end if;
	end if;
	
end process;

	q <= q_int;

end behave;