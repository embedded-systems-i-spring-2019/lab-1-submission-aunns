----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 06:30:40 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

entity counter_top is
      Port ( btn,sw : in std_logic_vector( 3 downto 0);
            clk: in std_logic;
            led: out std_logic_vector(3 downto 0)  );
end counter_top;


architecture Behavioral of counter_top is
    component debounce
    port( clk, btn: in std_logic;
            dbnc:   out std_logic);
    end component;
    
    component clock_div
      port(clk  : in std_logic;        -- 125 Mhz clock
       
        
        div : out std_logic        -- 2 Hz clock

    );        
    end component;
    
    component fancy_counter
    port( clk,clk_en,dir,en,ld,rst,updn: in std_logic;
            val: in std_logic_vector(3 downto 0);
            cnt: out std_logic_vector(3 downto 0));
    end component;
               
               signal dbnc1: std_logic; 
               signal dbnc2: std_logic; 
               signal dbnc3: std_logic; 
               signal dbnc4: std_logic; 
               signal div1: std_logic; 
                
begin

    u1: debounce
    port map(clk=>clk,
              btn=>btn(0),
              dbnc=>dbnc1);
              
               u2: debounce
    port map(clk=>clk,
              btn=>btn(1),
              dbnc=>dbnc2);
              
               u3: debounce
    port map(clk=>clk,
              btn=>btn(2),
              dbnc=>dbnc3);
              
               u4: debounce
    port map(clk=>clk,
              btn=>btn(3),
              dbnc=>dbnc4);
              
              u5:clock_div
    port map(clk=>clk,
            div=>div1);
            
                u6:fancy_counter
    port map( clk=>clk,
            clk_en=>div1,
            dir=>sw(0),
            en=>dbnc2,
            ld=>dbnc4,
            rst=>dbnc1,
            updn=>dbnc3,
            val=>sw,
            cnt=>led);                              
              
              


end Behavioral;
