library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity memcontrol is
	Port (
			clk:    		in std_logic;
			Rst:	    	in std_logic;
			burst, RnW:	    in std_logic;
			ready:			in std_logic;
			Bus_id:			in std_logic_vector(7 downto 0);
			We:				out std_logic;
			Oe:				out std_logic
		 );
end memcontrol;

architecture verhalten of memcontrol is

type state_type is (Idle, Dec, Wr, Rd1, Rd2, Rd3, Rd4);
signal state: 		state_type;
signal We_int: std_logic;


begin
	process(clk, Rst)
	begin
			
		if Rst = '1' then
			state <= Idle;
		
		elsif rising_edge(clk)then
			    	
			case(state) is
		
			when Idle =>
				if Bus_id = "11110011" then
					state <= Dec;
				end if;
		
			when Dec =>
				if RnW = '1' then 
					state <= Rd1;
				else
					state <= Wr;
					--we <= '1';
				end if;
				
			when Wr =>
				if ready = '1' then
					state <= Idle;
				end if;
			
		
			when Rd1 =>
				if ready = '1' and burst = '0' then
					state <= Idle;
				
				elsif ready = '1' and burst = '1' then
					state <= Rd2;
				end if;
			

			when Rd2 =>
				if ready = '1' then
					state <= Rd3;
				end if;
			
		
			when Rd3 =>
				if ready = '1' then
					state <= Rd4;
				end if;
			
					
			when Rd4 => 
				if ready = '1' then
					state <= Idle;
				end if;
			
			end case;
			
		end if;

   end process;
  
 
   We <= '1' when state = Wr else '0';
   
   	
   with state select
   Oe <= '1' when Rd1 | Rd2 | Rd3 | Rd4 ,
		 '0' when others; 
	
		 			 
end verhalten;
