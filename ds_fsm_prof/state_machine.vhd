library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity state_machine is 
Port (	
	Clk2	: in STD_LOGIC;
	Rstn	: in STD_LOGIC;
	RnW		: in STD_LOGIC;
	Bus_id	: in std_logic_vector(4 downto 0);
	OE		: out std_logic;
	Wre		:out std_logic
	);
end entity;

Architecture behave of state_machine is

	type fsm is (idle, dec, wt, rd, wr);
	signal state : fsm;

begin

process (clk2, rstn)

begin
	if rstn = '0' then
		state <= idle;
	elsif falling_edge (clk2) then
		case state is
			when idle =>
				if bus_id = "11000" then  --x"18"
					state <= dec;
				end if;
				
			when dec =>
				state <= WT;
			
			when WT	=> 
				if rnw = '0' then
					state <= wr;
				else 
					state <= rd;
				end if;
			
			when RD	=>
					state <= idle;
			
			when WR	=>
					state <= idle;
			
			when others  =>
				null;
				
		end case;
	end if;
end process;

	Wre <= '1' when state = WR else '0';
	OE	<= '1' when state = RD else '0';

end behave;