/* create a new Curator instance, with all addons allowed, and export it
 * in a publicVariable, for others to assign it */

if (!isServer) exitWith {};

private _curator = ([] call insta_zeus_fnc_mkCurator);

Insta_Zeus_Curator = _curator;
publicVariable "Insta_Zeus_Curator";
