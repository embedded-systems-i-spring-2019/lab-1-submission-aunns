----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2019 02:55:38 AM
-- Design Name: 
-- Module Name: divider_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_top is
--  Port ( );
    port(   CLK: in std_logic;
            led0:   inout std_logic);
            

end divider_top;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity res is
    port( input : in std_logic;
            CLK,ld: in std_logic;
               output: inout std_logic);

end res;
architecture my_reg of res is 
begin
    process(CLK)
        begin
            if (rising_edge(CLK)) then
                if (ld='1') then
                     output<=input;
                end if;
            end if;
         end process    ;
end my_reg;

architecture Behavioral of divider_top is
    
    component res
        port( input : in std_logic;
            CLK,ld: in std_logic;
               output: inout std_logic);
    end component;               
    
    component clock_div
        port(

        clk  : in std_logic;        -- 125 Mhz clock
       
        
        div : out std_logic        -- 2 Hz clock

    );
end component;

    
        
       signal chip_e: std_logic;
       signal i_bar: std_logic;
begin
    div1: clock_div
        port map(clk=>CLK,
                   div=>chip_e);
    i_bar<=(not led0);                   
    r1: res
        port map(input=>i_bar,
                ld=>chip_e,
                CLK=>CLK,
                output=>led0);                                   

end Behavioral;
