-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Fcount is
	port (
			clock, reset : in std_logic; -- for clock implementation
			D : in unsigned (3 downto 0); --used for incrementation
			Y : out unsigned (5 downto 0) -- used for output
		  );
end Fcount;

architecture behavior of Fcount is

signal acc : unsigned(5 downto 0) := (others => '0');

begin
process(clock, reset)
	begin
		if reset = '1' then -- reset the accumulator
			acc <= (others => '0');
		elsif rising_edge(clock) then
			acc <= acc + D; --increment acc by 'D' using the increment operator
		end if;
end process;

Y <= acc;
end behavior;