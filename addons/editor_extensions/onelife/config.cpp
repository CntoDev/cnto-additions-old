class CfgPatches {
    class Editor_Extensions_onelife {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "Editor_Extensions_shared",
            "ace_spectator"
        };
    };
};

class CfgFunctions {
    class a3ee_onelife {
        class All {
            file = "\editor_extensions\onelife";
            class init;
            class setupPreloadEH { preInit = 1; };
            class deleteCorpse;
            class getDisconnectData;
            class isRejoining;
            class forceSpectator;
            class checkTeleport;
            class doTeleport;
        };
    };
};

class CfgVehicles {
    class Logic;
    class a3ee_module_base : Logic {
        class EventHandlers;
    };
    class a3ee_onelife : a3ee_module_base {
        scope = 2;
        icon = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        displayName = "One life";
        class Attributes {
            class structured_hint {
                property = "a3ee_onelife_structured_hint";
                control = "StructuredText1";
                description = "Hint: Set MP respawn setting to ""BASE"".";
            };
            class onrespawn {
                property = "a3ee_onelife_onrespawn";
                control = "Checkbox";
                displayName = "Spectator on respawn";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "Instead of respawning and playing, force the player into spectator.";
            };
            class onnewjoin {
                property = "a3ee_onelife_onnewjoin";
                control = "Checkbox";
                displayName = "Spectator for new players";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "Make newly joining players (who haven't connected to the running mission yet) into spectators.";
            };
            class onrejoin {
                property = "a3ee_onelife_onrejoin";
                control = "Checkbox";
                displayName = "Spectator for rejoining players";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "Make rejoining/returning players (who have gone back to lobby or disconnected) into spectators.";
            };
            class disteleport {
                property = "a3ee_onelife_disteleport";
                control = "Checkbox";
                displayName = "Allow re-joining if alive";
                expression = "_this setVariable [""%s"",_value]";
                defaultValue = "true";
                tooltip = "If spectator for rejoining was enabled and the player disconnected while still being alive, allow the player to re-join the original group's leader and continue playing instead of watching as spectator.\nThe player may enter spectator temporarily until it is safely possible to re-join the group leader.\n\nIf spectator for rejoining is disabled, this functionality can still be invoked by calling a3ee_onelife_fnc_doTeleport and checked with a3ee_onelife_fnc_checkTeleport (returns true/false) whether the teleport can be performed. Both should be called on the client only.";
            };
        };

        // TODO: check getmissionconfigvalue "respawn" for == 3 ("BASE")

        class EventHandlers : EventHandlers {
            class setup { init = "if (isServer) then { (_this select 0) call a3ee_onelife_fnc_init }"; };
        };
    };
};
