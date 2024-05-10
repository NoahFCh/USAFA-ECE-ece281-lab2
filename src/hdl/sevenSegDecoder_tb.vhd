----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 10:09:58 AM
-- Design Name: 
-- Module Name: sevenSegDecoder_tb - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;


architecture test_bench of sevenSegDecoder_tb is

component sevenSegDecoder is
    Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0));
           end component;
    
    signal w_seg : std_logic_vector (6 downto 0) :=(others =>'0');
    signal w_sw : std_logic_vector (3 downto 0) :=(others =>'0');
begin
sevenSegDecoder_inst : sevenSegDecoder port map(
    i_D(0) => w_sw(0),
    i_D(1) => w_sw(1),
    i_D(2) => w_sw(2),
    i_D(3) => w_sw(3),

    o_S(0) => w_seg(0),
    o_S(1) => w_seg(1),
    o_S(2) => w_seg(2),
    o_S(3) => w_seg(3),
    o_S(4) => w_seg(4),
    o_S(5) => w_seg(5),
    o_S(6) => w_seg(6)
);

    test_process : process
    begin
       w_sw <= x"0"; wait for 10 ns;
       assert w_seg(6) = '1' report "bad x0" severity failure;
       w_sw <= x"1"; wait for 10 ns;
       assert w_seg(2) = '0' and w_seg(1) = '0' report "bad x1" severity failure;
       w_sw <= x"2"; wait for 10 ns;
       assert w_seg(5) = '1' and w_seg(2) = '1' report "bad x2" severity failure;
       w_sw <= x"3"; wait for 10 ns;
       assert w_seg(4) = '1' and w_seg(5) = '1' report "badx3" severity failure;
       w_sw <= x"4"; wait for 10 ns;
       assert w_seg(3) = '1' and w_seg(4) = '1' and w_seg(0) = '1' report "bad x4"severity failure;
       w_sw <= x"5"; wait for 10 ns;
       assert w_seg(1) = '1' and w_seg(4) = '1' report "bad x5" severity failure;
       w_sw <= x"6"; wait for 10 ns;
       assert w_seg(1) = '1' report "bad x6" severity failure;
       w_sw <= x"7"; wait for 10 ns;
       assert w_seg(0) = '0' and w_seg(1) = '0' report "bad x7" severity failure;
       w_sw <= x"8"; wait for 10 ns;
       --assert w_seg = x"0" report "bad x8" severity failure;
       w_sw <= x"9"; wait for 10 ns;
       assert w_seg(3) = '1' report "bad x9" severity failure;
       w_sw <= x"A"; wait for 10 ns;
       assert w_seg(3) = '1' report "bad xA" severity failure;
       w_sw <= x"B"; wait for 10 ns;
       assert w_seg(0) = '1' and w_seg(1) = '1' report "bad xB" severity failure;
       w_sw <= x"C"; wait for 10 ns;
       assert w_seg(3) = '0' and w_seg(4) = '0' and w_seg(6) = '0' report "bad xC" severity failure;
       w_sw <= x"D"; wait for 10 ns;
       assert w_seg(0) = '1' and w_seg(5) = '1' report "bad xD" severity failure;
       w_sw <= x"E"; wait for 10 ns;
       assert w_seg(2) = '1' and w_seg(1) = '1' report "bad xE" severity failure;
       w_sw <= x"F"; wait for 10 ns;
       assert w_seg(2) = '1' and w_seg(1) = '1' and w_seg(3) = '1' report "bad xF" severity failure;
      
       wait;
       end process;

end test_bench;
