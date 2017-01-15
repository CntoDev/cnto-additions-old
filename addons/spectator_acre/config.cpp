class CfgPatches {
    class cnto_units_spectator {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_Data_F_Curator_Virtual",
            "acre_api"

        };
    };
};

class CfgVehicles {
    class VirtualMan_F;
    class VirtualSpectator_F : VirtualMan_F {
        class EventHandlers  {
            class acre {
                // due to not knowing if this init is run globally, extra conditions have to be met in order to see if player is spectator or not.
                // next update will delete the globalChat function.
                init = "0 = [_this] spawn {waitUntil {!isNull player}; if(player != ((_this select 0) select 0)) exitWith {}; waitUntil { if([true] call acre_api_fnc_setSpectator) exitWith{true}; sleep 1; false }; (_this select 0) select 0 globalChat ""spectator_acre: Initialized!""; };";
            };
        };
    };
};
