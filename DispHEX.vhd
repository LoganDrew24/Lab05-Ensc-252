-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DispHEX is
port ( X : in unsigned(5 downto 0);
		Y0, Y1 : out std_logic_vector(6 downto 0)
		);
end DispHEX;

architecture behavior of DispHEX is
component SegDecoder is
port (
	D : in std_logic_vector(3 downto 0);
	Y : out std_logic_vector(6 downto 0)
	   );
end component;
--concatenate the first two bits of sig1 as 00, then make the rest of sig 1 X
signal sig1 : std_logic_vector(7 downto 0) := "00" & std_logic_vector(X); --8 bits to account for 2 instances of segdecoder

begin

inst1 : SegDecoder
port map (
			sig1(3 downto 0), Y0
			);
inst2 : SegDecoder
port map (
			sig1(7 downto 4), Y1
			);
end behavior;
