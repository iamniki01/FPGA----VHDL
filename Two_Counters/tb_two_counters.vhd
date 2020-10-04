library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_counter is

end entity;

architecture behave of tb_counter is

component twocounters is
	port (
		clk1  : in  std_logic;
		rst   : in  std_logic;
		en1   : in  std_logic;
		q2    : out std_logic_vector(3 downto 0)
	);
end component;

signal clk1_sim  : std_logic := '0';
signal rst_sim  : std_logic;
signal en1_sim : std_logic;
signal q2_sim : std_logic_vector(3 downto 0);

-- Use 100Mhz clock
constant clk_per : time := 10 ns;

begin

counter_inst : twocounters port map(
	clk1 => clk1_sim,
	rst  => rst_sim,
	en1  => en1_sim,
	q2   => q2_sim
);

clk_proc : process
begin
	wait for clk_per/2;
	clk1_sim <= not clk1_sim;
end process; 

rst_proc : process
begin
	-- Active low reset
	rst_sim <= '0';
	wait for clk_per * 3;
	rst_sim <= not rst_sim;
	wait;
end process;

en1_sim_proc : process
begin
	en1_sim <= '0';
	wait for clk_per * 8;
	en1_sim <= '1';
	wait;
end process;

end behave;