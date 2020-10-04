library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_flipflop is

end entity;

architecture behave of tb_flipflop is

component flipflop is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		din  : in  std_logic_vector(2 downto 0);
		en   : in  std_logic;
		dout : out std_logic_vector(2 downto 0)
	);
end component;

signal clk_sim : std_logic;
signal rst_sim : std_logic;
signal din_sim : std_logic_vector(2 downto 0);
signal dout_sim : std_logic_vector(2 downto 0);
signal en_sim : std_logic;

-- Use 100Mhz clock
constant clk_per : time := 10ns;

begin

flipflop_inst : flipflop port map (
	clk => clk_sim,
	rst => rst_sim,
	din => din_sim,
	en => en_sim,
	dout => dout_sim
);

clk_proc : process
begin
	clk_sim <= '0';
	wait for clk_per/2;
	clk_sim <= not clk_sim;
	wait for clk_per/2;
end process; 

rst_proc : process
begin
	-- -- Active high reset
	-- rst_sim <= '1';
	-- wait for clk_per * 3;
	-- rst_sim <= not rst_sim;
	-- wait for clk_per * 5;
	
	-- Active low reset
	rst_sim <= '0';
	wait for clk_per * 3;
	rst_sim <= not rst_sim;
	wait for clk_per * 5;
end process;

--en_sim <= '0',
--          '1' after clk_per * 8,
--		  '0' after clk_per * 20;

en_sim_proc : process
begin
	en_sim <= '0';
	wait for clk_per * 8;
	en_sim <= '1';
	wait for clk_per * 20;
end process;

din_sim <= "101";

end behave;