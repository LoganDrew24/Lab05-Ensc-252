LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;
-- Entity Declaration
entity incr is
    Port (
        clock : in  std_logic;
        f     : out unsigned(5 downto 0)
    );
end incr;

-- Architecture
architecture behavior of incr is
    signal accumulator : unsigned(5 downto 0) := (others => '0');
begin
    process(clock)
    begin
        if rising_edge(clock) then
            -- Increment accumulator using the + operator
            accumulator <= accumulator + 1;

            -- Output the result on the bus
            f <= accumulator;
        end if;
    end process;
end behavior;