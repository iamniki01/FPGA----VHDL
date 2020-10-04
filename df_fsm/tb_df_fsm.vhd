library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_df_fsm is

end tb_df_fsm;

architecture behave_df_fsm of tb_df_fsm is
-- Asynchronous and active high reset

component df is
	Port (
			Clk:    		in std_logic;
			Rst:	    	in std_logic;
			Rdd:	        in std_logic;
			Wrt:			in std_logic;
			Sel:	        in std_logic;
			Data_a:         in std_logic_vector(3 downto 0);
			Data_b:         in std_logic_vector(3 downto 0);
			Bus_id:         out std_logic_vector(4 downto 0);
			Clk2:	        out std_logic;
			Rstn:	        out std_logic;
			RnW:	        out std_logic
		 );
end component;

component fsm is
	Port (
			Bus_id:         in std_logic_vector(4 downto 0);
			Clk2:	        in std_logic;
			Rstn:	        in std_logic;
			RnW:	        in std_logic;
			We:				out std_logic;
			Oe:				out std_logic
		 );
end component;

constant clock_period : time := 20 ns;
signal sig_clk: 		 std_logic := '0';
signal sig_Rst:			 std_logic := '1';
signal sig_Rdd:	         std_logic;
signal sig_Wrt:			 std_logic;
signal sig_Sel:	         std_logic := '0';
signal sig_Da:          std_logic_vector(3 downto 0);
signal sig_Db:          std_logic_vector(3 downto 0);
signal sig_busID:       std_logic_vector(4 downto 0);
signal sig_Clk2:	     std_logic;
signal sig_Rstn:	     std_logic;
signal sig_RnW:	         std_logic;
signal sig_We:	         std_logic;
signal sig_Oe:	         std_logic;

begin
	
		df_inst: df port map       (	Clk			=> sig_Clk,  	
										Rst			=> sig_Rst,	    	
										Rdd		    => sig_Rdd,	    	
										Wrt         => sig_Wrt,
										Sel  		=> sig_Sel,			
										Data_a  	=> sig_Da,
										Data_b		=> sig_Db,				
										Bus_id		=> sig_busID,
										Clk2        => sig_Clk2,
										Rstn 		=> sig_Rstn,
										RnW			=> sig_RnW
										);
		
		fsm_inst: fsm port map      (	Bus_id		=> sig_busID,
										Clk2		=> sig_Clk2,
										Rstn		=> sig_Rstn,
										Rnw			=> sig_RnW,
										We			=> sig_We,
										Oe			=> sig_Oe
										);

		
		clk_proc: process
		begin
			wait for clock_period/2;
			sig_clk <= not sig_clk;
		end process;
		
		rst_proc: process
		begin
			wait for clock_period * 5;
			sig_Rst <= not sig_Rst;
		wait; 
		end process;

		sig_Da <= "1100";
				  
		sig_Db <= "1100";
		
		sig_Rdd <= '0',
				   '1' after clock_period * 5,
				   '0' after clock_period * 50;
		
		sig_Wrt <= '1',
				   '0' after clock_period * 15,
				   '1' after clock_period * 40;

		sel_proc: process
		begin
			sig_sel <= not sig_sel;
			wait for clock_period * 10;
		end process;
				   
end behave_df_fsm;