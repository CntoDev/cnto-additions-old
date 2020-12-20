if (!hasInterface) exitWith {};
[
	"a3aa_littlebird_hud_enable",
	"CHECKBOX",
	["Enable", "Enable small forward-facing collimator style reticle for AH-6 and AH-9 aircraft"],
	["Arma Additions", "Littlebird HUD"],
	true,  /* default */
	false,  /* isGlobal */
	nil,   /* script */
	false   /* needRestart */
] call CBA_settings_fnc_init;

{
	[_x, "InitPost", 
		{
			params ["_vehicle", "_role", "_unit", "_turret"];
			if (_vehicle == vehicle player && a3aa_littlebird_hud_enable) then {
				_vehicle call a3aa_litlebird_hud_vehFunc;
			};

			[_vehicle,  "getIn",  {
				params ["_vehicle",  "_role",  "_unit",  "_turret"];
				if (player == _unit && a3aa_littlebird_hud_enable) then {
					_vehicle call a3aa_litlebird_hud_vehFunc;
				}
			}] call CBA_fnc_addBISEventHandler;
		},true,[],true
	] call CBA_fnc_addClassEventHandler;
} forEach ["RHS_MELB_AH6M","B_Heli_Light_01_dynamicLoadout_F"];