library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_dataflow is

end entity;

architecture behave of tb_dataflow is

component dataflow is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		d1  : in  std_logic_vector(5 downto 0);
		d2  : in  std_logic_vector(3 downto 0);
		q : out std_logic_vector(11 downto 0)
	);
end component;

signal clk_sim  : std_logic := '0';
signal rst_sim  : std_logic;
signal d1_sim : std_logic_vector(5 downto 0);
signal d2_sim : std_logic_vector(3 downto 0);
signal q_sim : std_logic_vector(11 downto 0);

-- Use 25Mhz clock
constant clk_per : time := 40 ns;

begin

dataflow_inst : dataflow port map(
	clk => clk_sim,
	rst => rst_sim,
	d1 => d1_sim,
	d2 => d2_sim,
	q => q_sim
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
	wait;
end process;

	d1_sim <= "000010";
	d2_sim <= "0011";

end behave;