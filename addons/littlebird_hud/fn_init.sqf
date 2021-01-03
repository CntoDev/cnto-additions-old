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

0 spawn {
	if (!hasInterface) exitWith {};
	waitUntil { !isNull player };
	["vehicle", {
		params ["_unit", "_newVehicle", "_oldVehicle"];
		if (_newVehicle isKindOf "RHS_MELB_AH6M" OR _newVehicle isKindOf "Heli_Light_01_armed_base_F") then {
			_newVehicle call a3aa_littlebird_hud_fnc_hud;
		};
	}] call CBA_fnc_addPlayerEventHandler;
	
	// where player starts in vehicle
	private _playerVeh = vehicle player;
	if (_playerVeh isKindOf "RHS_MELB_AH6M" OR _playerVeh isKindOf "Heli_Light_01_armed_base_F") then {
		_playerVeh call a3aa_littlebird_hud_fnc_hud;
	};

	// remove grease dot
	if (a3aa_littlebird_hud_enable) then {
		// Pawnee
		["Heli_Light_01_armed_base_F", "initPost", {
			_this#0 setObjectTexture [1,""]
		},true,[],true] call CBA_fnc_addClassEventHandler;
		// Littlebird
		["RHS_MELB_AH6M", "initPost", {
			_this#0 animateSource ["Addcrosshair", 0, true];
		},true,[],true] call CBA_fnc_addClassEventHandler;
	};
};
