library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity memcontrol_sim is	
end memcontrol_sim;


architecture TestSim_mc of memcontrol_sim is


	component memcontrol 
		Port (
				clk:    		in std_logic;
				Rst:	    	in std_logic;
				burst, RnW:	    	in std_logic;
				ready:			in std_logic;
				Bus_id:			in std_logic_vector(7 downto 0);
				We:				out std_logic;
				Oe:				out std_logic
		 	);
	end component;
	
	constant clock_period : time := 10 ns;
	signal sig_clk: 			std_logic;
	signal sig_Rst:				std_logic;
	signal sig_burst, sig_RnW:	    	std_logic;
	signal sig_ready:			std_logic;
			
	signal sig_Bus_id:			std_logic_vector(7 downto 0);
			
	signal sig_We:				std_logic;
	signal sig_Oe:				std_logic;

begin	
	
	memcnt_inst: memcontrol port map(	clk			=> sig_clk,  	
										Rst			=> sig_Rst,	    	
										burst		=> sig_burst,	    	
										RnW        => sig_RnW,
										ready		=> sig_ready,			
										Bus_id  	=> sig_Bus_id,
										We			=> sig_We,				
										Oe			=> sig_Oe
										);
		
	clk:process
		begin
			sig_clk <= '1';
			wait for clock_period/2;
			sig_clk <= '0';
    		wait for clock_period/2;
	end process;	
	
	rst:process
		begin
		sig_Rst <= '1';
		wait for 40 ns;
		sig_Rst <='0';
		wait;
	end process;

	sig_Bus_id <= "00001100", 
				  "11110011" after clock_period * 10,
				  "00001100" after clock_period * 20;
		  
	sig_burst 		<= '0';
	sig_ready       <= '1' after clock_period *8 ;
	sig_RnW  <= '0',
				'1' after clock_period * 16,
				'0' after clock_period * 25;
	
	
		
end TestSim_mc;