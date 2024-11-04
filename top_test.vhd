-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_test is
  port(
    SW : in std_logic_vector(5 downto 0);
    HEX0, HEX1 : out std_logic_vector(6 downto 0) 
    );
  end top_test;

  architecture behavior or top_test is

    component DispHEX
    port(
      D : in unsigned(5 downto 0);
      Y0, Y1 : out std_logic_vector(6 downto 0);
      );
    end component;

    signal D_U : unsigned(5 downto 0);
begin
  D_U <= unsigned(SW);

inst1 : DispHEX
  port map(
    D => D_U, Y0 => HEX0, Y1 => HEX1
    );
  end behavior;
