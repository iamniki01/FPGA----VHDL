library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt1_cnt2_tb is
end entity;

architecture behave of cnt1_cnt2_tb is

component cnt1 is
	port (
		clk1	: in std_logic;
		rst		: in std_logic;
		en		: in std_logic;
		rstn	: out std_logic;
		en2		: out std_logic;
		clk2	: out std_logic
	);
end component; 

component cnt2 is
	port (
		clk2	: in std_logic;
		rstn	: in std_logic;
		en2		: in std_logic;
		countout: out std_logic_vector(4 downto 0)
	);
end component; 

signal clk1_sim : std_logic := '0';
signal rst_sim	: std_logic := '1';
signal en_sim 	: std_logic;
signal en2_int	: std_logic;
signal rstn_int : std_logic;
signal clk2_int : std_logic;
signal countout_sim : std_logic_vector(4 downto 0);

constant clk_per : time := 10 ns; -- 100MHz

begin

cnt1_inst: cnt1 port map (
							clk1 => clk1_sim,
							rst  => rst_sim,
							en 	 => en_sim,
							clk2 => clk2_int,
							en2  => en2_int,
							rstn => rstn_int 
							);
							
							
cnt2_inst: cnt2 port map (
							clk2 => clk2_int,
							en2  => en2_int,
							rstn => rstn_int, 
							countout => countout_sim
							);
							

clk_proc: process
begin
	wait for clk_per/2;
		clk1_sim <= not clk1_sim;
end process;

rst_proc: process
begin
	wait for clk_per * 5;
		rst_sim <= not rst_sim;
	wait; 
end process;

en_sim <= '0',
		  '1' after clk_per * 6; 

end behave;