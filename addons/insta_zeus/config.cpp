class CfgPatches {
    class Insta_Zeus {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "3den",
            "cba_keybinding",
            "cba_xeh",
            "acre_api"
        };
    };
};

class CfgFunctions {
    class Insta_Zeus {
        /* instance dedicated to logged in / voted admin */
        class AdminCurator {
            file = "\insta_zeus\functions\admin_curator";
            class createGlobalCurator { postInit = 1; };
            class maintainCurator { postInit = 1; };
        };
        /* checkbox-based (Eden) per-unit curator instances */
        class UnitCurator {
            file = "\insta_zeus\functions\unit_curator";
            class createUnitCurator;
        };
        /* keybind-based arsenal functionality for the admin instance */
        class Arsenal {
            file = "\insta_zeus\functions\arsenal";
            class arsenal;
            class arsenalKeys { postInit = 1; };
        };
        /* misc keepers for all curators */
        class Runtime {
            file = "\insta_zeus\functions\runtime";
            class addPlayer { postInit = 1; };
            class onRespawn { postInit = 1; };
        };
        /* internal and external */
        class Api {
            file = "\insta_zeus\functions\api";
            class mkCurator;
            class curatorOpened;
        };
        /* keybinds for acre mode switching */
        class Acre {
            file = "\insta_zeus\functions\acre";
            class toggleAcreCuratorMode;
            class setAcreSpectator;
            class acreKeys { postInit = 1; };
            class acreOpenCloseSpectator;
        };
        //class Unused {
        //    class activateAddons { preInit = 1; };
        //};
    };
};

class CfgVehicles {
    class Logic;
    class Insta_Zeus_Dumb_Curator : Logic {
        scope = 1;
        /* creates a curator instance upon creating this Vehicle */
        simulation = "curator";
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class Control {
                class Attributes {
                    class insta_zeus_unit_curator {
                        property = "insta_zeus_unit_curator";
                        control = "Checkbox";
                        displayName = "Create Zeus for this unit";
                        expression = "[_this, _value] call Insta_Zeus_fnc_createUnitCurator";
                        condition = "objectBrain";
                        defaultValue = "false";
                        tooltip = "Create a new Curator instance and assign it to the unit.\nWorks only in Multiplayer (global admin Curator instance is used in SP regardless).";
                    };
                };
            };
        };
    };
};

/* for ACRE spectator in Curator */
class Extended_DisplayLoad_EventHandlers {
    class RscDisplayCurator {
        insta_zeus_onLoad = "[true, (_this select 0)] call Insta_Zeus_fnc_acreOpenCloseSpectator";
    };
};
