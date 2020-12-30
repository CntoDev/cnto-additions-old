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
if (!hasInterface) exitWith {};
0 spawn {
	waitUntil { !isNull player };
	["vehicle", {
		params ["_unit", "_newVehicle", "_oldVehicle"];
		if (_newVehicle isKindOf "RHS_MELB_AH6M" OR _newVehicle isKindOf "Heli_Light_01_armed_base_F" && a3aa_littlebird_hud_enable) then {
			_newVehicle call a3aa_littlebird_hud_fnc_hud;
		};
	}] call CBA_fnc_addPlayerEventHandler;
	
	private _playerVeh = vehicle player;
	if (_playerVeh isKindOf "RHS_MELB_AH6M" OR _playerVeh isKindOf "Heli_Light_01_armed_base_F" && a3aa_littlebird_hud_enable) then {
		_playerVeh call a3aa_littlebird_hud_fnc_hud;
	};

	// remove grease dot
	if (a3aa_littlebird_hud_enable) then {
		["Heli_Light_01_armed_base_F", "initPost", {_this#0 setObjectTexture [1,""]}] call CBA_fnc_addClassEventHandler;
	};
};
