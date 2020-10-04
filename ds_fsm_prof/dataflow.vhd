library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dataflow is 
Port (	
	Clk		: in STD_LOGIC;
	Rst		: in STD_LOGIC;
	Rdd		: in STD_LOGIC;
	Wrt		: in STD_LOGIC;
	sel		: in std_logic;
	RnW		: out STD_LOGIC;
	data_a	: in std_logic_vector(3 downto 0);
	data_b	: in std_logic_vector(3 downto 0);
	Bus_id	: out std_logic_vector(4 downto 0);
	Clk2	: out std_logic;
	Rstn	: out std_logic
	);
end entity;


architecture bahve of dataflow is

	signal	data_a_reg : std_logic_vector(3 downto 0);
	signal	data_b_reg : std_logic_vector(3 downto 0);
	signal	RD_reg : std_logic;
	signal	WR_reg : std_logic;
	signal	sel_reg: std_logic;
	signal	clk_sig : std_logic;

begin 

reg_proc: process(clk,rst)
	begin
		if rst = '1' then 
			data_a_reg <= (others=> '0');
			data_b_reg <= (others=> '0');
			RD_reg     <= '0';
			WR_reg     <= '0';
			sel_reg    <= '0';
		elsif falling_edge (clk) then
			data_a_reg <= data_a;
			data_b_reg <= data_b;
			RD_reg     <= rdd;
			WR_reg     <= wrt;	
			sel_reg    <= sel;
		end if;
	end process;

sel_proc: process(clk,rst)
	begin
		if 	rst = '1' then
			RnW <= '0';
		elsif falling_edge (clk) then
			if sel_reg = '1' then
				RnW <= RD_reg;
			else
				RnW <= WR_reg;
			end if;
		end if;
	end process;
busid_proc:process(clk,rst)
	begin
		if rst = '1' then
			bus_id <= (others => '0');
		elsif falling_edge (clk) then
			bus_id <= EXT(data_a_reg,5) + ext(data_b_reg, 5);
		end if;
	end process;
	
clk2_proc: process(clk,rst)
begin
	if rst = '1' then
		clk_sig <= '0';
	elsif rising_edge (clk) then
		clk_sig <= not clk_sig;
	end if;
end process;


	clk2 <= clk_sig;
	rstn <= not rst;
end bahve;

