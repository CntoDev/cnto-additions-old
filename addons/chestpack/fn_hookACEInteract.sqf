/*
 * https://ace3mod.com/wiki/framework/interactionMenu-framework.html
 */

/* no ace_interact loaded */
if (isNil "ace_interact_menu_fnc_createAction") exitWith {};

/*
 * save a lot of cycles on large modpacks - add interaction only to vehicle
 * classes controlled by players
 * - this also means you can't swap chest/back pack of a non-player corpse
 */
["ace_interact_menu_newControllableObject", {
    params ["_playerclass"];
    if (!(_playerclass isKindOf "CAManBase")) exitWith {};

    /*
     * self-actions
     */

    private _action = [
        "Chestpack_onChest",
        "Backpack on Chest",
        "",
        {
            private _back = (_this select 0) call Chestpack_fnc_removeBackpack;
            [(_this select 0), _back] call Chestpack_fnc_setChestpack;
        },
        {
            private _chest = (_this select 0) getVariable "Chestpack_pack";
            isNil "_chest" && {!isNull unitBackpack (_this select 0)};
        }
    /*
     *  {},
     *  [],
     *  [0,0,0],
     *  100,
     *  [false, true, false, false, false]   enableInside seems to be no-op
     */
    ] call ace_interact_menu_fnc_createAction;
    [_playerclass, 1, ["ACE_SelfActions", "ACE_Equipment"], _action]
        call ace_interact_menu_fnc_addActionToClass;

    _action = [
        "Chestpack_onBack",
        "Chestpack on Back",
        "",
        {
            private _chest = (_this select 0) call Chestpack_fnc_removeChestpack;
            [(_this select 0), _chest] call Chestpack_fnc_setBackpack;
        },
        {
            private _chest = (_this select 0) getVariable "Chestpack_pack";
            !isNil "_chest" && {isNull unitBackpack (_this select 0)};
        }
    ] call ace_interact_menu_fnc_createAction;
    [_playerclass, 1, ["ACE_SelfActions", "ACE_Equipment"], _action]
        call ace_interact_menu_fnc_addActionToClass;

    _action = [
        "Chestpack_swapPacks",
        "Swap Chest/Back packs",
        "",
        {
            private _back = (_this select 0) call Chestpack_fnc_removeBackpack;
            private _chest = (_this select 0) call Chestpack_fnc_removeChestpack;
            [(_this select 0), _chest] call Chestpack_fnc_setBackpack;
            [(_this select 0), _back] call Chestpack_fnc_setChestpack;
        },
        {
            private _chest = (_this select 0) getVariable "Chestpack_pack";
            !isNil "_chest" && {!isNull unitBackpack (_this select 0)};
        }
    ] call ace_interact_menu_fnc_createAction;
    [_playerclass, 1, ["ACE_SelfActions", "ACE_Equipment"], _action]
        call ace_interact_menu_fnc_addActionToClass;

    /*
     * actions for bodies of players
     * (to retrieve chestpack contents)
     */

    _action = [
        "Chestpack_onChest_other",
        "Backpack on Chest",
        "",
        {
            private _back = (_this select 0) call Chestpack_fnc_removeBackpack;
            [(_this select 0), _back] call Chestpack_fnc_setChestpack;
        },
        {
            private _chest = (_this select 0) getVariable "Chestpack_pack";
            isNil "_chest" && {!isNull unitBackpack (_this select 0)}
            && (_this select 0) call Chestpack_fnc_isDead;
        }
    ] call ace_interact_menu_fnc_createAction;
    [_playerclass, 0, ["ACE_MainActions"], _action]
        call ace_interact_menu_fnc_addActionToClass;

    _action = [
        "Chestpack_onBack_other",
        "Chestpack on Back",
        "",
        {
            private _chest = (_this select 0) call Chestpack_fnc_removeChestpack;
            [(_this select 0), _chest] call Chestpack_fnc_setBackpack;
        },
        {
            private _chest = (_this select 0) getVariable "Chestpack_pack";
            !isNil "_chest" && {isNull unitBackpack (_this select 0)}
            && (_this select 0) call Chestpack_fnc_isDead;
        }
    ] call ace_interact_menu_fnc_createAction;
    [_playerclass, 0, ["ACE_MainActions"], _action]
        call ace_interact_menu_fnc_addActionToClass;

    _action = [
        "Chestpack_swapPacks_other",
        "Swap Chest/Back packs",
        "",
        {
            private _back = (_this select 0) call Chestpack_fnc_removeBackpack;
            private _chest = (_this select 0) call Chestpack_fnc_removeChestpack;
            [(_this select 0), _chest] call Chestpack_fnc_setBackpack;
            [(_this select 0), _back] call Chestpack_fnc_setChestpack;
        },
        {
            private _chest = (_this select 0) getVariable "Chestpack_pack";
            !isNil "_chest" && {!isNull unitBackpack (_this select 0)}
            && (_this select 0) call Chestpack_fnc_isDead;
        }
    ] call ace_interact_menu_fnc_createAction;
    [_playerclass, 0, ["ACE_MainActions"], _action]
        call ace_interact_menu_fnc_addActionToClass;

}] call CBA_fnc_addEventHandler;
