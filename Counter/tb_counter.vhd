library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_counter is

end entity;

architecture behave of tb_counter is

component counter is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		en : in std_logic;
		q : out std_logic_vector(3 downto 0)
	);
end component;

signal clk_sim  : std_logic := '0';
signal rst_sim  : std_logic;
signal en_sim : std_logic;
signal q_sim : std_logic_vector(3 downto 0);

-- Use 25Mhz clock
constant clk_per : time := 40 ns;

begin

counter_inst : counter port map(
	clk => clk_sim,
	rst => rst_sim,
	en => en_sim,
	q=> q_sim
);

clk_proc : process
begin
	wait for clk_per/2;
	clk_sim <= not clk_sim;
end process; 

rst_proc : process
begin
	-- Active high reset
	rst_sim <= '1';
	wait for clk_per * 3;
	rst_sim <= not rst_sim;
	wait for clk_per * 30;
end process;

en_sim_proc : process
begin
	en_sim <= '0';
	wait for clk_per * 8;
	en_sim <= '1';
	wait for clk_per * 10;
end process;

end behave;