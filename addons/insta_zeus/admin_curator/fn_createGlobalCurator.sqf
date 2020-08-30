/* create a new Curator instance, with all addons allowed, and export it
 * in a publicVariable, for others to assign it */

if (!isServer) exitWith {};

private _curator = ([] call a3aa_insta_zeus_fnc_mkCurator);

a3aa_insta_zeus_curator = _curator;
publicVariable "a3aa_insta_zeus_curator";
