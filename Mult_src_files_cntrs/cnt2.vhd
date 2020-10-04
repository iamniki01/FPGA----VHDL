library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt2 is
	port (
		clk2	: in std_logic;
		rstn	: in std_logic;
		en2		: in std_logic;
		countout: out std_logic_vector(4 downto 0)
	);
end entity; 

architecture behave of cnt2 is

	signal cnt2_int : std_logic_vector(4 downto 0) :=(others => '0') ;
	
begin

cnt2_proc: process(rstn, clk2)
begin
-- sync.rst
	if rising_edge (clk2) then
		if rstn = '0' then
			cnt2_int <= (others => '0');
		else
			if en2 = '1' then
				cnt2_int <= cnt2_int +1;
			else
				cnt2_int <= cnt2_int;
			end if;
		end if;
	end if;
end process;

countout <= cnt2_int;

end behave;