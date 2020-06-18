params ["_vehicle", "_caller"];

/* only non-cargo crew OR group leader of 2+ */
(
    (_vehicle getCargoIndex _caller) < 0
    || (leader group _caller == _caller && {count units group _caller > 1})
)
/* above 100m */
&& {position _vehicle select 2 > 100}
/* only when not already in progress */
&& {!(_vehicle getVariable ["a3aa_static_line_jumping", false])}
/* only with non-zero passengers */
&& {count (_vehicle call a3aa_static_line_fnc_getPassengers) > 0};
