library ieee;
use ieee.std_logic_1164.all;

entity tb_lab3_fap is
end tb_lab3_fap;

architecture sim of tb_lab3_fap is

    signal i_clk      : std_logic := '0';
    signal i_switch_1 : std_logic := '1';
    signal o_led      : std_logic;

begin

    uut: entity work.lab3_fap
        port map (
            i_clk      => i_clk,
            i_switch_1 => i_switch_1,
            o_led      => o_led
        );

    clk_process: process
    begin
        while true loop
            i_clk <= '0';
            wait for 10 ns;

            i_clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    stimulus_process: process
    begin

        -- Ban đầu switch = 1, LED = OFF
        i_switch_1 <= '1';
        wait for 100 ns;

        -- Nhấn switch
        i_switch_1 <= '0';
        wait for 100 ns;

        -- Nhả switch
        i_switch_1 <= '1';
        wait for 100 ns;

        -- Nhấn lần 2
        i_switch_1 <= '0';
        wait for 100 ns;

        -- Nhả lần 2
        i_switch_1 <= '1';
        wait for 100 ns;

        -- Nhấn lần 3
        i_switch_1 <= '0';
        wait for 100 ns;

        -- Nhả lần 3
        i_switch_1 <= '1';
        wait for 100 ns;

        wait;
    end process;

end sim;