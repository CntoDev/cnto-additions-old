/*
 * periodically share targets between groups within each task force
 */

if (!isServer) exitWith {};

ares_extras_task_forces = [];

0 = [] spawn {
    waitUntil {
        sleep (10 + random 5);

        /* cleanup invalid groups / empty TFs */
        for "_i" from 0 to (count ares_extras_task_forces - 1) do {
            private _tf_groups = ares_extras_task_forces select _i;
            _tf_groups = _tf_groups select {
                count units _x > 0;  /* also serves as !isNull */
            };
            ares_extras_task_forces set [_i, _tf_groups];
        };
        ares_extras_task_forces = ares_extras_task_forces select {
            count _x > 0  /* more than 0 groups in TF */
        };

        /* collect and share targets */
        {
            private _tf_groups = _x;

            /* collect targets for the entire TF */
            private _tf_targets = [];
            {
                private _targets = (leader _x) targets [true, nil, nil, 20];
                {
                    _tf_targets pushBackUnique _x;
                } forEach _targets;
            } forEach _tf_groups;

            /* share targets amongst groups of the TF */
            if (count _tf_targets > 0) then {
                [
                    [_tf_groups, _tf_targets],
                    {
                        params ["_groups", "_targets"];
                        {
                            private _group = _x;
                            {
                                _group reveal _x;
                            } forEach _targets;
                        } forEach _groups;
                    }
                ] remoteExec ["call"];
            };
        } forEach ares_extras_task_forces;
        false;
    };
};
