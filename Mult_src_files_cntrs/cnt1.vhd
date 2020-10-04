library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt1 is
	port (
		clk1	: in std_logic;
		rst		: in std_logic;
		en		: in std_logic;
		rstn	: out std_logic;
		en2		: out std_logic;
		clk2	: out std_logic
	);
end entity; 

architecture behave of cnt1 is

	signal cnt1_int : std_logic_vector(2 downto 0);
	signal en2_int : std_logic;
begin

cnt1_proc: process(rst, clk1)
begin
-- async. rst
	if rst = '1' then
		cnt1_int <= (others=>'0');
	elsif rising_edge (clk1) then
		if en = '1' then
			cnt1_int <= cnt1_int +1;
		else
			cnt1_int <= cnt1_int;
		end if;
	end if;
end process;

	en2 <= '1' when cnt1_int = "101" else '0';
	clk2 <= cnt1_int(0);
	rstn <= not rst;
	
	
--	en2_int <= '1' when cnt1_int = "101" else '0';

-- -- if en2 is en2_int flipflop
-- en2_ff: process (clk1)
-- begin
	-- if rising_edge (clk1) then
		-- en2 <= en2_int;
	-- end if;
-- end process;



end behave;