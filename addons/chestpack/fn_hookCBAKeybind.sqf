/*
 * https://ace3mod.com/wiki/framework/interactionMenu-framework.html
 */

[
    ["Arma Additions", "Chestpack"],
    "switch_packs",
    "Switch packs",
    { [] call Chestpack_fnc_oneKeyAutoSwap },
    ""
] call CBA_fnc_addKeybind;
