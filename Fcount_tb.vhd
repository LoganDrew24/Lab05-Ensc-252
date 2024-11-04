-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Fcount_tb is
end Fcount_tb;

architecture behavior of Fcount_tb is
component Fcount is -- entity to test
	port (
			clock, reset : in std_logic; -- for clock implementation
			D : in unsigned (3 downto 0); --used for incrementation
			Y : out unsigned (5 downto 0) -- used for output
		  );
end component;

constant clock_period : time := 10 ns;

signal tb_clock : std_logic := '1'; --assign starting values for clock and reset
signal tb_reset : std_logic := '1';
signal tb_D : unsigned (3 downto 0); -- same perimeters as Fcount
signal tb_Y : unsigned (5 downto 0);

begin

uut : Fcount
port map (clock => clock, reset => reset => D => D, Y => Y);

clock_process : process
	begin
		clock <= '0';
	wait for clock_period / 2;
	clock <= '1';
wait for clock_period / 2;
	end process;

stimulus : process
	begin
		wait for 20 ns;
		
		reset <= '1';
	wait for 10 ns;
	reset <= '0';

wait for 50 ns;
	reset <= '1';
wait for 10 ns;
	reset <= '0';

wait;
end process;
end behavioral
	
end behavior;
