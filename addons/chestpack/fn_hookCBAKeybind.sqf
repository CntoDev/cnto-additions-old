/*
 * https://ace3mod.com/wiki/framework/interactionMenu-framework.html
 */

[
    ["Arma Additions", "Chestpack"],
    "a3aa_chestpack_switch_packs",
    "Switch packs",
    { [] call a3aa_chestpack_fnc_oneKeyAutoSwap }
] call CBA_fnc_addKeybind;
