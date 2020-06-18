if (is3DEN) exitWith {};
private _hcs_required = _this getVariable "hcs_required";

0 = _hcs_required spawn {
    /* all units must be initialized */
    waitUntil { !isNil "BIS_fnc_init" };

    /* which groups to transfer - exit if none */
    private _groups = allGroups select {
        _x getVariable "a3aa_ee_locality_transfer";
    };
    if (_groups isEqualTo []) exitWith {};

    /* wait for required amount of HCs or mission start */
    private "_active_hcs";
    waitUntil {
        /* any HC units that aren't on the server */
        _active_hcs = (entities "HeadlessClient_F") select {
            owner _x != 2;
        };

        count _active_hcs >= _this || time > 0;
    };
    if (time > 0) exitWith {};  /* cancel */

    private _dsts = _active_hcs apply { owner _x };
    {
        private _dst = selectRandom _dsts;
        private _src = groupOwner _x;
        if (_src != _dst) then {
            _x setGroupOwner _dst;
        };
    } forEach _groups;
};
