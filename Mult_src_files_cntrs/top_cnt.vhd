library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_cnt is
	port (
		clk1 : in std_logic;
		rst : in std_logic;
		en	: in std_logic;
		countout: out std_logic_vector(4 downto 0)
	);
end entity;

architecture behave of top_cnt is

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



signal en2_int	: std_logic;
signal rstn_int : std_logic;
signal clk2_int : std_logic;


begin

cnt_inst : cnt1 port map (
						clk1 => clk1,
						rst  => rst,
						en   => en,
						rstn => rstn_int,
						en2  => en2_int,
						clk2 => clk2_int 
						);

cnt2_inst	: cnt2 port map (
							clk2 => clk2_int,
							rstn => rstn_int,
							en2  => en2_int,
							countout => countout
							);

end behave;