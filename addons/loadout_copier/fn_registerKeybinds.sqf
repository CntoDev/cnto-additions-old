/*
 * the 3DEN keybinds are done through fn_hackCBAKeyboard3DEN which duplicates
 * the keybind definition (so edit it there when changing it here) for
 * performance reasons, but also because enabling ALL keybinds in 3DEN would
 * likely break ACE or other mods not expecting their keybind code to run
 * in 3DEN
 */

[
    ["Arma Additions", "Loadout Copier"],
    "Loadout_Copier_editor_curator_copy",
    "Copy Loadout (Editor/Zeus)",
    { ["editor_curator", "copy"] call Loadout_Copier_fnc_copyPaste }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "Loadout Copier"],
    "Loadout_Copier_editor_curator_paste",
    "Paste Loadout (Editor/Zeus)",
    { ["editor_curator", "paste"] call Loadout_Copier_fnc_copyPaste }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "Loadout Copier"],
    "Loadout_Copier_1st_3rd_person_copy",
    "Copy Loadout (1st/3rd person)",
    { ["1st_3rd_person", "copy"] call Loadout_Copier_fnc_copyPaste }
] call CBA_fnc_addKeybind;
[
    ["Arma Additions", "Loadout Copier"],
    "Loadout_Copier_1st_3rd_person_paste",
    "Paste Loadout (1st/3rd person)",
    { ["1st_3rd_person", "paste"] call Loadout_Copier_fnc_copyPaste }
] call CBA_fnc_addKeybind;
