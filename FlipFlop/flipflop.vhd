library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flipflop is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		din  : in  std_logic_vector(2 downto 0);
		en   : in  std_logic;
		dout : out std_logic_vector(2 downto 0)
	);
end entity;

architecture behave of flipflop is

begin
-- -- trigger on risinng edge, active high reset, async reset

-- flipflop_proc : process (clk,rst)

-- begin

	-- if rst = '1' then
		-- dout <= (others => '0');   -- "000"
	-- elsif rising_edge(clk) then
		-- if en = '1' then
			-- dout <= din;
		-- -- else
			-- -- dout <= dout;
		-- end if;
	-- end if;
-- end process;


-- trigger on falling edge, active low reset, sync reset

flipflop_proc : process (clk,rst)
begin

	if falling_edge (clk) then
		if rst = '0' then 
			dout <= (others => '0');   -- "000"
		elsif rst = '1' then
			if en = '1' then
				dout <= din;
			end if;
		end if;
	end if;
end process;

end behave;