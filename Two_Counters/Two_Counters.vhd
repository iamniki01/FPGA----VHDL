library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity twocounters is
	port (
		clk1  : in  std_logic;
		rst   : in  std_logic;
		en1   : in  std_logic;
		q2    : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behave of twocounters is

-- Active low reset, async reset, trigger on faling edge
signal q1_int : std_logic_vector(1 downto 0) := (others => '0');
signal q2_int : std_logic_vector(3 downto 0) := (others => '0');
signal clk2   : std_logic := '0';
signal en2    : std_logic := '0';

begin


counter1_proc : process (clk1, rst)
begin

	if rst = '0' then
		q1_int <= (others => '0');
	elsif falling_edge(clk1) then 
		if en1 = '1' then
			q1_int <= q1_int + 1;
		else
			q1_int <= q1_int;
		end if;
	end if;
	
end process;
	
	
clk2_proc : process(clk1)
begin
	if falling_edge(clk1) then
		clk2 <= not clk2;
	end if;
end process;

enable2_proc : process(q1_int)
begin
	if q1_int = "10" then
		en2 <= '1';
	else
		en2 <= '0';
	end if;
end process;

counter2_proc : process(clk2, rst)
begin
	
	if rst = '0' then
		q2_int <= (others => '0');
	elsif falling_edge(clk2) then 
		if en2 = '1' then
			q2_int <= q2_int + 1;
		else
			q2_int <= q2_int;
		end if;
	end if;
end process;

	q2 <= q2_int;

end behave;