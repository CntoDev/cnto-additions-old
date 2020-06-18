class CfgPatches {
    class a3aa_loadout_copier {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "cba_keybinding",
            "cba_xeh",
            "a3aa_ee_arsenal_respawn"  // fn_acreFixRadios
        };
    };
};

class CfgFunctions {
    class a3aa_loadout_copier {
        class all {
            file = "\a3aa\loadout_copier";
            class registerKeybinds;
            class hackCBAKeybind3DEN;
            class copyPaste;
        };
    };
};

class Cfg3DEN {
    class EventHandlers {
        class a3aa_loadout_copier {
            /* triggers on load as well, incl. sqm passed to arma3.exe */
            onMissionNew = "[] call a3aa_loadout_copier_fnc_hackCBAKeybind3DEN";
        };
    };
};

class Extended_PreInit_EventHandlers {
    class a3aa_loadout_copier {
        init = "[] call a3aa_loadout_copier_fnc_registerKeybinds";
    };
};
