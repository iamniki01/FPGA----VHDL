library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity fsm is
	Port (
			Bus_id:         in std_logic_vector(4 downto 0);
			Clk2:	        in std_logic;
			Rstn:	        in std_logic;
			RnW:	        in std_logic;
			We:				out std_logic;
			Oe:				out std_logic
		 );
end fsm;

architecture behave_fsm of fsm is
-- Asynchronous and active high reset

type state_type is (Idle, Dec, WT, WR, RD);
signal state: 		state_type;


begin
	process(Clk2, Rstn)
	begin
			
		if Rstn = '0' then
			state <= Idle;
		elsif falling_edge(Clk2)then
			    	
			case(state) is
		
			when Idle =>
				if Bus_id = x"18" then
					state <= Dec;
				end if;
		
			when Dec =>
				state <= WT;
			
			when WT =>
				if RnW = '0' then
					state <= WR;
				else
					state <= RD;
				end if;
			
			when WR =>
				state <= Idle;
			
			when RD =>
				state <= Idle;
			
			end case;
			
		end if;

   end process;

We <= '1' when state = WR else '0';

Oe <= '1' when state = RD else '0';

end behave_fsm;