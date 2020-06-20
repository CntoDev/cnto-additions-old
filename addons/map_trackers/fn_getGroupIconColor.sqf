private _get_nato_color = {
    /* from profile, probably for colorblind settings */
    private _idx = switch (_this) do {
        case "blue": {
            [
                ["Map_BLUFOR_R", 0],
                ["Map_BLUFOR_G", 0.3],
                ["Map_BLUFOR_B", 0.6],
                ["Map_BLUFOR_A", 1]
            ]
        };
        case "green": {
            [
                ["Map_Independent_R", 0],
                ["Map_Independent_G", 0.5],
                ["Map_Independent_B", 0],
                ["Map_Independent_A", 1]
            ]
        };
        case "red": {
            [
                ["Map_OPFOR_R", 0.5],
                ["Map_OPFOR_G", 0],
                ["Map_OPFOR_B", 0],
                ["Map_OPFOR_A", 1]
            ]
        };
    };
    _idx apply {
        profilenamespace getvariable _x;
    };
};

params ["_group"];
private _grp_side = side _group;
private _player_side = side group player;
switch true do {
    case (_grp_side == _player_side): { "blue" call _get_nato_color };
    case (_grp_side getFriend _player_side >= 0.6): { "green" call _get_nato_color };
    default { "red" call _get_nato_color };
};
