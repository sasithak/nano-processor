----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe / Thamindu Sathruwan / Kalindu Gandhara
-- 
-- Create Date: 04/04/2021 03:48:51 PM
-- Design Name: 
-- Module Name: processor - Behavioral
-- Project Name: nano processor
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

entity processor is
    Port (
        clr : in STD_LOGIC;
        clk : in STD_LOGIC;
        Zero : out STD_LOGIC;
        Overflow : out STD_LOGIC;
        s_seg : out STD_LOGIC_VECTOR (6 downto 0);
        s_led : out STD_LOGIC_VECTOR (3 downto 0)
    );
end processor;

architecture Behavioral of processor is

    component Mux_8way_4bit is port(
        Reg0   :  in std_logic_vector (3 downto 0);
        Reg1   :  in std_logic_vector (3 downto 0);
        Reg2   :  in std_logic_vector (3 downto 0);
        Reg3   :  in std_logic_vector (3 downto 0);
        Reg4   :  in std_logic_vector (3 downto 0);
        Reg5   :  in std_logic_vector (3 downto 0);
        Reg6   :  in std_logic_vector (3 downto 0);
        Reg7   :  in std_logic_vector (3 downto 0);
        RegSel :  in std_logic_vector (2 downto 0);
        EN     :  in std_logic;
        Output : out std_logic_vector (3 downto 0)
    );
    end component;

    component Add_Sub is port (
        A        : in STD_LOGIC_VECTOR (3 downto 0);
        B        : in STD_LOGIC_VECTOR (3 downto 0);
        S        : out STD_LOGIC_VECTOR (3 downto 0);
        Con      : in STD_LOGIC;
        C_out    : out STD_LOGIC;
        Overflow : out STD_LOGIC;
        Zero     : out STD_LOGIC
    );
    end component;

    component ProgramCounter is port (
        Clk        :  in std_logic;
        Reset      :  in std_logic;
        NextIns    :  in std_logic_vector (2 downto 0);
        CurrentIns : out std_logic_vector (2 downto 0)
    );
    end component;

    component RCA_3 is port (
        A     : in std_logic_vector (2 downto 0);
        B     : in std_logic_vector (2 downto 0);
        C_in : in std_logic;
        S     : out std_logic_vector (2 downto 0);
        C_out : out std_logic;
        Z     : out std_logic
    );
    end component;

    component Mux_2way_3bit is port (
        JumpValue : in STD_LOGIC_VECTOR (2 downto 0);
        AdderValue : in STD_LOGIC_VECTOR (2 downto 0);
        Flag : in STD_LOGIC;
        EN : in STD_LOGIC;
        OutValue : out STD_LOGIC_VECTOR (2 downto 0)
    );
    end component;

    component Mux_2way_4bit is port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        I : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC;
        O : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;

    component Reg_Bank is port (
        Reg_in   :  in std_logic_vector (3 downto 0);
        Bank_Res :  in std_logic;
        Sel      :  in std_logic_vector (2 downto 0);
        Clk      :  in std_logic;
        Reg0Out  : out std_logic_vector (3 downto 0);
        Reg1Out  : out std_logic_vector (3 downto 0);
        Reg2Out  : out std_logic_vector (3 downto 0);
        Reg3Out  : out std_logic_vector (3 downto 0);
        Reg4Out  : out std_logic_vector (3 downto 0);
        Reg5Out  : out std_logic_vector (3 downto 0);
        Reg6Out  : out std_logic_vector (3 downto 0);
        Reg7Out  : out std_logic_vector (3 downto 0)
    );
    end component;

    component ROM is port (
        sel : in std_logic_vector(2 downto 0);
        ins : out std_logic_vector(11 downto 0)
    );
    end component;

    component InstructionDecoder is port (
        Ins         :  in std_logic_vector (11 downto 0);
        JmpChk      :  in std_logic_vector  (3 downto 0);
        RegEn       : out std_logic_vector  (2 downto 0);
        LoadSel     : out std_logic;
        ImVal       : out std_logic_vector  (3 downto 0);
        RegSelA     : out std_logic_vector  (2 downto 0);
        RegSelB     : out std_logic_vector  (2 downto 0);
        AddSubSel   : out std_logic;
        JmpFlag     : out std_logic;
        JmpAddrs    : out std_logic_vector  (2 downto 0)
    );
    end component;

    component Slow_Clk is port (
        Clk_in  :  in std_logic;
        Clk_out : out std_logic
    );
    end component;

    component LUT_16_7 is port (
        address :  in std_logic_vector (3 downto 0);
        data    : out std_logic_vector (6 downto 0)
    );
    end component;

    signal clk_out, en, jmp_flag, not_clk_out  : std_logic;
    signal loadSel, add_sub_sel   : std_logic;
    signal pc_in, pc_out          : std_logic_vector (2 downto 0);
    signal jmp_address, pc_adder  : std_logic_vector (2 downto 0);
    signal RegSel_1, RegSel_2, reg_sel : std_logic_vector (2 downto 0);
    signal ins                         : std_logic_vector (11 downto 0);
    signal Reg0Out, Reg1Out, Reg2Out   : std_logic_vector (3 downto 0);
    signal Reg3Out, Reg4Out, Reg5Out   : std_logic_vector (3 downto 0);
    signal Reg6Out, Reg7Out, reg_in    : std_logic_vector (3 downto 0);
    signal add_1, add_2, add_out, ImVal : std_logic_vector (3 downto 0);

begin

    slow_clk_out : Slow_Clk port map (
        Clk_in  => clk,
        Clk_out => clk_out
    );

    adder_3 : RCA_3 port map (
        A    => pc_out,
        B    => "001",
        C_in => '0',
        S    => pc_adder
    );

    mux_2_3 : Mux_2way_3bit port map (
        JumpValue  => jmp_address,
        AdderValue => pc_adder,
        Flag       => jmp_flag,
        EN         => en,
        OutValue   => pc_in
    );

    pc : ProgramCounter port map (
        NextIns    => pc_in,
        Reset      => clr,
        Clk        => clk_out,
        CurrentIns => pc_out
    );

    program_rom : ROM port map (
        sel => pc_out,
        ins => ins
    );

    reg_b : Reg_Bank port map (
        Reg_in   => reg_in,
        Bank_Res => clr,
        Sel      => reg_sel,
        Clk      => not_clk_out,
        Reg0Out  => Reg0Out, 
        Reg1Out  => Reg1Out, 
        Reg2Out  => Reg2Out, 
        Reg3Out  => Reg3Out, 
        Reg4Out  => Reg4Out, 
        Reg5Out  => Reg5Out, 
        Reg6Out  => Reg6Out, 
        Reg7Out  => Reg7Out
    );

    mux_1 : Mux_8way_4bit port map (
        Reg0   => Reg0Out, 
        Reg1   => Reg1Out, 
        Reg2   => Reg2Out, 
        Reg3   => Reg3Out, 
        Reg4   => Reg4Out, 
        Reg5   => Reg5Out, 
        Reg6   => Reg6Out, 
        Reg7   => Reg7Out,
        RegSel => RegSel_1,
        EN     => en,
        Output => add_1
    );

    mux_2 : Mux_8way_4bit port map (
        Reg0   => Reg0Out, 
        Reg1   => Reg1Out, 
        Reg2   => Reg2Out, 
        Reg3   => Reg3Out, 
        Reg4   => Reg4Out, 
        Reg5   => Reg5Out, 
        Reg6   => Reg6Out, 
        Reg7   => Reg7Out,
        RegSel => RegSel_2,
        EN     => en,
        Output => add_2
    );

    adder : Add_Sub port map (
        A        => add_2,
        B        => add_1,
        S        => add_out,
        Con      => add_sub_sel,
        Overflow => Overflow,
        Zero     => Zero
    );

    mux_2_4 : Mux_2way_4bit port map (
        A => add_out,
        I => ImVal,
        S => loadSel,
        O => reg_in
    );

    ins_decoder : InstructionDecoder port map (
        Ins       => ins,
        JmpChk    => add_1,
        RegEn     => reg_sel,
        LoadSel   => loadSel,
        ImVal     => ImVal,
        RegSelA   => RegSel_1,
        RegSelB   => RegSel_2,
        AddSubSel => add_sub_sel,
        JmpFlag   => jmp_flag,
        JmpAddrs  => jmp_address
    );

    lut : LUT_16_7 port map (
        address => Reg7Out,
        data    => s_seg
    );

    en          <= '1';
    s_led       <= Reg7Out;
    not_clk_out <= not (clk_out);

end Behavioral;
