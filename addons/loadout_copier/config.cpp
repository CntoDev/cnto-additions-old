class CfgPatches {
    class Loadout_Copier {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_keybinding",
            "cba_xeh",
            "Editor_Extensions_arsenal_respawn"  // fn_acreFixRadios
        };
    };
};

class CfgFunctions {
    class Loadout_Copier {
        class All {
            file = "\loadout_copier";
            class registerKeybinds;
            class hackCBAKeybind3DEN;
            class copyPaste;
        };
    };
};

class Cfg3DEN {
    class EventHandlers {
        class Loadout_Copier {
            /* triggers on load as well, incl. sqm passed to arma3.exe */
            onMissionNew = "[] call Loadout_Copier_fnc_hackCBAKeybind3DEN";
        };
    };
};

class Extended_PreInit_EventHandlers {
    class Loadout_Copier {
        init = "[] call Loadout_Copier_fnc_registerKeybinds";
    };
};
