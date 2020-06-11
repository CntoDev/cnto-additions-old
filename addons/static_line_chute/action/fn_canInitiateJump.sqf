params ["_vehicle", "_caller"];

/* only non-cargo crew OR group leader of 2+ */
(
    (_vehicle getCargoIndex _caller) < 0
    || (leader group _caller == _caller && {count units group _caller > 1})
)
/* above 100m */
&& {position _vehicle select 2 > 100}
/* only when not already in progress */
&& {!(_vehicle getVariable ["Static_Line_Chute_jumping", false])}
/* only with non-zero passengers */
&& {count (_vehicle call Static_Line_Chute_fnc_getPassengers) > 0};
