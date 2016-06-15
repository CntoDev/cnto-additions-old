/* create a new Curator instance, with all addons allowed, and export it
 * in a publicVariable, for others to assign it
 * NOTE: this can be done only before mission start, unfortunately */

if (!isServer) exitWith {};

private _logic = (creategroup sideLogic) createUnit ["Insta_Zeus_Dumb_Curator", [0,0,0], [], 0, "NONE"];

/* "forEach" or "CODE count" doesn't work with configs */
private _addons = [];
private _cfg = configfile >> "CfgPatches";
for "_i" from 0 to (count _cfg - 1) do {
    private _x = _cfg select _i;
    if (isClass _x) then { _addons pushBack configName _x };
};
removeAllCuratorAddons _logic;
_logic addCuratorAddons _addons;

[_logic, {
    params ["_logic"];
    if (!hasInterface) exitWith {};
    waitUntil { !isNull _logic };
    /* ModuleCurator_F has function="BIS_fnc_moduleCurator", the following
    * is taken from it to register vanilla Zeus behavior */
    _logic addeventhandler ["curatorFeedbackMessage",{_this call bis_fnc_showCuratorFeedbackMessage;}];
    _logic addeventhandler ["curatorPinged",{_this call bis_fnc_curatorPinged;}];
    _logic addeventhandler ["curatorObjectPlaced",{_this call bis_fnc_curatorObjectPlaced;}];
    _logic addeventhandler ["curatorObjectEdited",{_this call bis_fnc_curatorObjectEdited;}];
    _logic addeventhandler ["curatorWaypointPlaced",{_this call bis_fnc_curatorWaypointPlaced;}];
    _logic addeventhandler ["curatorObjectDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
    _logic addeventhandler ["curatorGroupDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
    _logic addeventhandler ["curatorWaypointDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
    _logic addeventhandler ["curatorMarkerDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
    player call bis_fnc_curatorRespawn;
}] remoteExec ["spawn", 0, true];

Insta_Zeus_Curator = _logic;
publicVariable "Insta_Zeus_Curator";
