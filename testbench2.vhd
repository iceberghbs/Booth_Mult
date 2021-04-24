
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench2 is
--  Port ( );
end testbench2;

architecture Behavioral of testbench2 is


component Booth_Mult2
  Port (
        In_1, In_2 : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        ready : in std_logic;
        done : out std_logic;
        S : out std_logic_vector(15 downto 0) ); 
end component;

constant clk_period : time := 10ns;  -- 100Mhz
signal clk : std_logic;
signal In_1, In_2 : std_logic_vector(7 downto 0);
signal ready : std_logic;
signal done2 : std_logic:='0';
signal S2 : std_logic_vector(15 downto 0);

begin

                    
    u2 : Booth_Mult2
        port map(In_1=>In_1, In_2=>In_2, clk=>clk, ready=>ready,
                    done=>done2, S=>S2);    
                    
    clock : process
    begin
        wait for clk_period/2;
            clk <= '0';
        wait for clk_period/2;
            clk <= '1';
    end process;

    stim: process
    begin
    
        wait for 100ns;
            ready <= '1';
            In_1 <= std_logic_vector(to_signed(3, 8));
            In_2 <= std_logic_vector(to_signed(-7, 8));
            wait for 50ns;
            ready <= '0';
            
        wait for 200ns;
            ready <= '1';
            In_1 <= std_logic_vector(to_signed(-7, 8));
            In_2 <= std_logic_vector(to_signed(3, 8));
            wait for 50ns;
            ready <= '0';
    
        wait for 200ns;
            ready <= '1';
            In_1 <= std_logic_vector(to_signed(1, 8));
            In_2 <= std_logic_vector(to_signed(1, 8));
            wait for 50ns;
            ready <= '0';
            
        wait for 200ns;
            ready <= '1';
            In_1 <= std_logic_vector(to_signed(2, 8));
            In_2 <= std_logic_vector(to_signed(3, 8));
            wait for 50ns;
            ready <= '0';
            
        wait for 200ns;
            ready <= '1';
            In_1 <= std_logic_vector(to_signed(-2, 8));
            In_2 <= std_logic_vector(to_signed(2, 8));
            wait for 50ns;
            ready <= '0';
            
        wait for 200ns;
            ready <= '1';
            In_1 <= std_logic_vector(to_signed(0, 8));
            In_2 <= std_logic_vector(to_signed(0, 8));
            wait for 50ns;
            ready <= '0';
            
        wait;
    end process;
end Behavioral;
