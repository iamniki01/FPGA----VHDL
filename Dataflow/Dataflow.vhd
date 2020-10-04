library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dataflow is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		d1  : in  std_logic_vector(5 downto 0);
		d2  : in  std_logic_vector(3 downto 0);
		q : out std_logic_vector(11 downto 0)
	);
end entity;

architecture behave of dataflow is

-- Active high reset, async reset, trigger on rising edge
signal r11 : std_logic_vector(5 downto 0) := (others => '0');
signal r12 : std_logic_vector(5 downto 0) := (others => '0');
signal r13 : std_logic_vector(5 downto 0) := (others => '0');
signal r21 : std_logic_vector(3 downto 0) := (others => '0');
signal r22 : std_logic_vector(3 downto 0) := (others => '0');
signal r23 : std_logic_vector(3 downto 0) := (others => '0');
signal mul1 : std_logic_vector(9 downto 0) := (others => '0');
signal mul2 : std_logic_vector(9 downto 0) := (others => '0');
signal mul3 : std_logic_vector(9 downto 0) := (others => '0');
signal add1 : std_logic_vector(10 downto 0) := (others => '0');
signal add2 : std_logic_vector(11 downto 0) := (others => '0');

begin


dataflow_proc : process (clk, rst, d1, d2)
begin

	if rst = '1' then
		r11 <= (others => '0');
		r12 <= (others => '0');
		r13 <= (others => '0');
		r21 <= (others => '0');
		r22 <= (others => '0');
		r23 <= (others => '0');
	elsif rising_edge(clk) then 
			r11 <= d1;
			r12 <= r11;
			r13 <= r12;
			r21 <= d2;
			r22 <= r21;
			r23 <= r22;
	end if;
	
	-- if rst = '1' then
		-- r11 <= (others => '0');
		-- r21 <= (others => '0');
	-- elsif rising_edge(clk) then 
		-- r11 <= d1;
		-- r21 <= d2;
	-- end if;
	
	-- if rst = '1' then
		-- r12 <= (others => '0');
		-- r22 <= (others => '0');
	-- elsif rising_edge(clk) then 
		-- r12 <= r11;
		-- r22 <= r21;
	-- end if;
	
	-- if rst = '1' then
		-- r13 <= (others => '0');
		-- r23 <= (others => '0');
	-- elsif rising_edge(clk) then 
		-- r13 <= r12;
		-- r23 <= r22;
	-- end if;
	
	mul1 <= r11 * r21;
	mul2 <= r12 * r22;
	mul3 <= r13 * r23;
	
	add1 <= eXT(mul1, 11) + eXT(mul2, 11);
	add2 <= eXT(add1, 12) + eXT(mul3, 12);
	
	if rst = '1' then
		q <= (others => '0');
	elsif rising_edge(clk) then 
		q <= add2;
	end if;
	
end process;


end behave;