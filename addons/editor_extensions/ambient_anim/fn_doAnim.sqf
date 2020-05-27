params ["_unit", "_anim"];

/* check animation is still active (unit hasn't entered combat) */
private _active = _unit getVariable ["a3ee_ambient_anim_active", false];
if (!_active) exitWith { false };

_unit disableAI "ANIM";
_unit switchMove _anim;
true;
