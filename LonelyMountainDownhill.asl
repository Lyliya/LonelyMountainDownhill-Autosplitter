/*
** Lonely Mountain Downhill Auto Splitter
** By Lyliya
*/

state("LMD_Win_x64")
{
    uint cp_count : "GameAssembly.dll", 0x01CE7CB8, 0x40, 0xB8, 0xA0, 0x78, 0xAB0, 0x210, 0x1D4;
    uint current_cp: "GameAssembly.dll", 0x01D04818, 0x58, 0xC0, 0x0, 0xB8, 0x0, 0x20, 0x24;
}

init
{
    refreshRate = 30;
    vars.level_finished = false;
}

update
{
    if (vars.level_finished && current.current_cp < current.cp_count) {
        vars.level_finished = false;
    }
}

startup
{
}

split
{
    if (!vars.level_finished && current.cp_count != 0 && current.current_cp == current.cp_count) {
        vars.level_finished = true;
        return true;
    }
    return false;
}

shutdown
{
}
