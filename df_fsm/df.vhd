library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity df is
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
end df;

architecture behave_df of df is
-- Asynchronous and active high reset

signal D_a : std_logic_vector(3 downto 0) := (others => '0');
signal D_b : std_logic_vector(3 downto 0) := (others => '0');
signal rdd_s : std_logic := '0';
signal wrt_s : std_logic := '0';
signal add : std_logic_vector(4 downto 0) := (others => '0');
signal mux : std_logic := '0';
signal busID : std_logic_vector(4 downto 0) := (others => '0');
signal rw : std_logic := '0';
signal c2 : std_logic := '0';

begin

Data_a_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		D_a <= (others => '0');
	elsif falling_edge(Clk) then 
		D_a <= Data_a;
	else
		D_a <= D_a;
	end if;
	
end process;

Data_b_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		D_b <= (others => '0');
	elsif falling_edge(Clk) then 
		D_b <= Data_b;
	else
		D_b <= D_b;
	end if;
	
end process;

rdd_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		rdd_s <= '0';
	elsif falling_edge(Clk) then 
		rdd_s <= Rdd;
	else
		rdd_s <= rdd_s;
	end if;
	
end process;

wrt_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		wrt_s <= '0';
	elsif falling_edge(Clk) then 
		wrt_s <= Wrt;
	else
		wrt_s <= wrt_s;
	end if;
	
end process;

add <= ext(D_a, 5) + ext(D_b, 5);

mux <= rdd_s when Sel = '1' else wrt_s;

Rstn <= not Rst;

clk2_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		c2 <= '0';
	elsif falling_edge(Clk) then 
		c2 <= not c2;
	else
		c2 <= c2;
	end if;
	
end process;

Clk2 <= c2;

BusID_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		busID <= (others => '0');
	elsif falling_edge(Clk) then 
		busID <= add;
	else
		busID <= busID;
	end if;
	
end process;

Bus_id <= busID;

rnw_proc: process(Clk, Rst)
begin

	if Rst = '1' then 
		rw <= '0';
	elsif falling_edge(Clk) then 
		rw <= mux;
	else
		rw <= rw;
	end if;
	
end process;

RnW <= rw;

end behave_df;