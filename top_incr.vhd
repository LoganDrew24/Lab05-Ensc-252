-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_incr is
  port(
    KEY : in std_logic_vector (1 downto 0);
    SW : in std_logic_vector (3 downto 0);
    HEX0 : out std_logic_vector (6 downto 0);
    HEX1 : out std_logic_vector (6 downto 0)
    );
  end top_incr;

  architecture structural of top_incr is
    signal Y : unsigned(5 downto 0);
signal clock, reset : std_logic;

component Fcount
  port (
    clock, reset : std_logic;
    D : in unsigned(3 downto 0);
    Y : out unsigned(5 downto 0)
    );
  end component;

  component DispHEX
  port (
    D : in unsigned(5 downto 0);
    Y0 : out std_logic_vector(6 downto 0);
    Y0 : out std_logic_vector(6 downto 0)
    );
  end component;

  begin
    clock <= not KEY(0); -- invert so that active low
  reset <= not KEY(1); -- invert so that active low

inst1 : Fcount
  port map(
    clock => clock, reset => reset, D => unsigned(SW), Y => Y
    );

  inst2 : DispHEX
    port map(
      D => Y, Y0 => HEX0, Y1 => HEX1
      );

    end structural;
