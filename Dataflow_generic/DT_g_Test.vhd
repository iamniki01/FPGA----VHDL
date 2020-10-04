library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DT_g_Test is
end entity;

architecture behave of DT_g_Test is

		     
component DT_g is
	generic(
		width_d1 : integer := 6;
		width_d2 : integer := 4
	);
	port ( clk	: IN std_logic; 
	       rst	: IN std_logic;
	       D1	: IN std_logic_vector(width_d1 - 1 downto 0);  				--(5 downto 0); 
		   D2	: IN std_logic_vector(width_d2 - 1 downto 0);  				--(3 downto 0)
		   Qout	: OUT std_logic_vector(width_d1 + width_d2 + 1 downto 0) 	--(11 downto 0)   
		 );
	
end component;

	constant clk_period : time := 20 ns;	     
	constant width_d1 : integer := 8;  --4;  --6;	     
	constant width_d2 : integer := 6;  --2; --4;	     

	signal clk_sim	: std_logic; 
	signal rst_sim	: std_logic;
	signal D1_sim	: std_logic_vector(width_d1 - 1 downto 0);  --(5 downto 0); 
	signal D2_sim	: std_logic_vector(width_d2 - 1 downto 0);  --(3 downto 0)
	signal Qout_sim	: std_logic_vector(width_d1 + width_d2 + 1 downto 0);  --(11 downto 0) 

begin

	DT_g_inst : DT_g 
			  generic map(
				width_d1 => 8, --6,
				width_d2 => 6  --4
			)
	          port map
	           (clk  => clk_sim,
				rst  => rst_sim,
				D1   => D1_sim,
				D2   => D2_sim,
	            Qout => Qout_sim
	           );

	clk_proc:process
	begin
	  clk_sim <= '1';
	  wait for clk_period/2;
	  clk_sim <= '0'; 
	  wait for clk_period/2;
	end process;

	
	rst_proc:process
	begin
	  rst_sim <= '1';
	  --wait for 50 ns;
	  wait for clk_period*3;
	  rst_sim <= '0';
	  wait;
	end process;

	D1_sim <= x"01"; --,
--	D1_sim <= "0001"; --,
--	D1_sim <= "000001"; --,
	      --    "000001" after 75 ns,   
	      --    "000011" after 500 ns;  
	       
	D2_sim <= "000010"; --, "00" & X"2";
--	D2_sim <= "10"; --,
--	D2_sim <= x"2"; --,
	       --   x"2" after 150 ns,    
	       --   x"4" after 600 ns; 
	       
	       	
end behave;