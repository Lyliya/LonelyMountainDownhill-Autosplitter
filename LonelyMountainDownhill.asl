/*
** Lonely Mountain Downhill Auto Splitter
** By Lyliya
*/

state("LMD_Win_x64")
{
    uint cp_count : "GameAssembly.dll", 0x01DB3818, 0xB8, 0x0, 0x20, 0xA4;
    uint current_cp: "GameAssembly.dll", 0x01E0ABA8, 0xC8, 0x48, 0x68, 0xB8, 0x0, 0x48, 0x68;
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
    print("Total CP:" + current.cp_count);
    print("Current CP:" + current.current_cp);
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
