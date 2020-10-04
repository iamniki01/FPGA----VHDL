library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cntr2 is
	generic(width_q : integer := 5);
	port (
		clk2   : in  std_logic;
		rstn    : in  std_logic;
		en2    : in  std_logic;
		q   : out  std_logic_vector (width_q - 1 downto 0)
	);
end entity;

architecture behave of cntr2 is

-- Active low reset, sync reset, trigger on rising edge
signal q_int : std_logic_vector(width_q - 1 downto 0) := (others => '0');

begin


counter2_proc : process (clk2, rstn)
begin

	if rising_edge(clk2) then
		if en2 = '1' then
			q_int <= q_int + 1;
		else
			q_int <= q_int;
		end if;
	end if;
	
end process;
	
	
q <= q_int;

end behave;