library ieee;
use ieee.std_logic_1164.all;

entity lab3_fap is
    port (
        i_clk      : in  std_logic;
        i_switch_1 : in  std_logic;
        o_led      : out std_logic
    );
end lab3_fap;

architecture rtl of lab3_fap is

    signal switch_ff1  : std_logic := '1';
    signal switch_ff2  : std_logic := '1';
    signal switch_prev : std_logic := '1';
    signal led_state   : std_logic := '0';

begin

    process(i_clk)
    begin
        if rising_edge(i_clk) then

            switch_ff1  <= i_switch_1;
            switch_ff2  <= switch_ff1;
            switch_prev <= switch_ff2;

            if switch_prev = '1' and switch_ff2 = '0' then
                led_state <= not led_state;
            end if;

        end if;
    end process;

    o_led <= led_state;

end rtl;