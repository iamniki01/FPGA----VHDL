library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt1_cnt2_top_tb is
end entity;

architecture behave of cnt1_cnt2_top_tb is

component top_cnt is
	port (
		clk1 : in std_logic;
		rst : in std_logic;
		en	: in std_logic;
		countout: out std_logic_vector(4 downto 0)
	);
end component;

signal clk1_sim : std_logic := '0';
signal rst_sim	: std_logic := '1';
signal en_sim 	: std_logic;
signal countout_sim : std_logic_vector(4 downto 0);

constant clk_per : time := 10 ns; -- 100MHz

begin

cnt1_cnt2_top_inst: top_cnt port map (
							clk1 => clk1_sim,
							rst  => rst_sim,
							en 	 => en_sim,
							rstn => rstn_int 
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