/* without all the engine logic surrounding Module_F, we just want 3DEN
 * Attributes and init EH */
class Logic;
class a3ee_module_base : Logic {
    scope = 0;
    category = A3EE;
    vehicleClass = "Modules";
    icon = "iconModule";
    class EventHandlers;
};

class a3ee_custom_location : a3ee_module_base {
    scope = 2;
    icon = "\A3\modules_f\data\iconStrategicMapInit_ca.paa";
    displayName = "Custom Location";
    canSetArea = 1;
    class AttributeValues {
        size3[] = {40, 20, -1};
        IsRectangle = 1;
    };
    class Attributes {
        class locname {
            property = "a3ee_locname";
            control = "Edit";
            displayName = "Name";
            expression = "_this setVariable [""%s"",_value]";
            typeName = "STRING";
            defaultValue = """""";
        };
        class loctype {
            property = "a3ee_loctype";
            control = "Combo";
            displayName = "Type";
            expression = "_this setVariable [""%s"",_value]";
            class Values {
                class Airport { name = "Airport"; value = "Airport"; };
                class NameMarine { name = "NameMarine"; value = "NameMarine"; };
                class NameCityCapital { name = "NameCityCapital"; value = "NameCityCapital"; };
                class NameCity { name = "NameCity"; value = "NameCity"; };
                class NameVillage { name = "NameVillage"; value = "NameVillage"; };
                class NameLocal { name = "NameLocal"; value = "NameLocal"; };
                class Hill { name = "Hill"; value = "Hill"; };
                class ViewPoint { name = "ViewPoint"; value = "ViewPoint"; };
                class RockArea { name = "RockArea"; value = "RockArea"; };
                class BorderCrossing { name = "BorderCrossing"; value = "BorderCrossing"; };
                class VegetationBroadleaf { name = "VegetationBroadleaf"; value = "VegetationBroadleaf"; };
                class VegetationFir { name = "VegetationFir"; value = "VegetationFir"; };
                class VegetationPalm { name = "VegetationPalm"; value = "VegetationPalm"; };
                class VegetationVineyard { name = "VegetationVineyard"; value = "VegetationVineyard"; };
            };
            typeName = "STRING";
            defaultValue = """NameVillage""";
        };
        class delcorpse {
            property = "a3ee_delcorpse";
            control = "Checkbox";
            displayName = "Delete player corpses";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
            tooltip = "Delete corpse left by a player on disconnect or respawn if that corpse was left in this location. Doesn't affect corpses created via other means (ie. AI corpses or deaths without respawn or disconnect).\n\nIf AI was enabled for the playable slot and player left an alive AI after disconnect, it will also be removed.";
        };
    };
    class EventHandlers : EventHandlers {
        class makeloc { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_createLoc }"; };
    };
};

class a3ee_hide_terrain : a3ee_module_base {
    scope = 2;
    icon = "\A3\modules_f\data\iconStrategicMapImage_ca.paa";
    displayName = "Hide Terrain";
    canSetArea = 1;
    class AttributeValues {
        size3[] = {10, 10, -1};
    };
    class Attributes {
        class terrfilter {
            property = "a3ee_terrfilter";
            control = "EditArray";
            displayName = "Filter";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "[]";
            tooltip = "If empty, hides any terrain object.\n\nOtherwise, takes a comma-separated list of terrain object types to filter and hide.\n\nPossible values:\ntree, smalltree, bush, building, house, forestborder, foresttriangle, forestsquare, church, chapel, cross, rock, bunker, fortress, fountain, view-tower, lighthouse, quay, fuelstation, hospital, fence, wall, hide, busstop, road, forest, transmitter, stack, ruin, tourism, watertower, track, mainroad, rocks, powerlines, railway, powersolar, powerwave, powerwind, shipwreck, trail";
        };
    };
    class EventHandlers : EventHandlers {
        class hideterr { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_hideTerrain }"; };
    };
};

class a3ee_briefing : a3ee_module_base {
    scope = 2;
    icon = "\a3\Modules_f\data\iconHQ_ca.paa";
    displayName = "Briefing (OPORD)";
    class Attributes {
        class briefingfor {
            property = "a3ee_briefingfor";
            control = "Combo";
            displayName = "Briefing for";
            expression = "_this setVariable [""%s"",_value]";
            class Values {
                class Everyone { name = "Everyone"; value = "everyone"; };
                class Side_BLUFOR { name = "Side - BLUFOR"; value = "side_blufor"; };
                class Side_OPFOR { name = "Side - OPFOR"; value = "side_opfor"; };
                class Side_Indep { name = "Side - Independent"; value = "side_indep"; };
                class Side_Civ { name = "Side - Civilian"; value = "side_civ"; };
                /* synchronizedObjects doesn't work here, we would need to spawn + wait,
                 * but we can't know what to wait for, so this logic can't easily support
                 * briefings for synchronized players */
                //class Synced { name = "Synchronized groups (non-JIP)"; value = "synced"; };
            };
            typeName = "STRING";
            defaultValue = """everyone""";
        };
        class situation {
            property = "a3ee_briefing_situation";
            control = "EditBig15";
            displayName = "Situation";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
        };
        class mission {
            property = "a3ee_briefing_mission";
            control = "EditBig15";
            displayName = "Mission";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
        };
        class execution {
            property = "a3ee_briefing_execution";
            control = "EditBig15";
            displayName = "Execution";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
        };
        class admin_logistics {
            property = "a3ee_briefing_logistics";
            control = "EditBig15";
            displayName = "Admin & Logistics";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
        };
        class command_signal {
            property = "a3ee_briefing_command";
            control = "EditBig15";
            displayName = "Command & Signal";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
        };
    };
    class EventHandlers : EventHandlers {
        class send_briefing { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_sendBriefing }"; };
    };
};

class a3ee_exec_code : a3ee_module_base {
    scope = 2;
    icon = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
    displayName = "Execute code";
    class Attributes {
        class enabledexec {
            property = "a3ee_enabledexec";
            control = "Checkbox";
            displayName = "Enable";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "true";
            tooltip = "Enable this module. Uncheck to disable without having to remove the module completely.";
        };
        class execonmp {
            property = "a3ee_execonmp";
            control = "Combo";
            displayName = "Execute on (MP)";
            expression = "_this setVariable [""%s"",_value]";
            class Values {
                class All { name = "All"; value = 0; };
                class Server_Only { name = "Server only"; value = 2; };
                class Clients_Only { name = "Clients only"; value = -2; };
            };
            typeName = "NUMBER";
            defaultValue = "0";
        };
        class forjip {
            property = "a3ee_forjip";
            control = "Checkbox";
            displayName = "Exec for JIP players";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "true";
        };
        class execenv {
            property = "a3ee_execenv";
            control = "Combo";
            displayName = "Environment";
            expression = "_this setVariable [""%s"",_value]";
            class Values {
                class Unscheduled { name = "Unscheduled"; value = 0; };
                class Scheduled { name = "Scheduled"; value = 1; };
            };
            typeName = "NUMBER";
            defaultValue = "1";
        };
        class waitforplayer {
            property = "a3ee_waitforplayer";
            control = "Checkbox";
            displayName = "Wait for non-null player";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "true";
            tooltip = "Works only in Scheduled environment. Doesn't work on dedicated server.";
        };
        class waitforstart {
            property = "a3ee_waitforstart";
            control = "Checkbox";
            displayName = "Wait for mission start";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
            tooltip = "Works only in Scheduled environment.";
        };
        class runoninit {
            property = "a3ee_runoninit";
            control = "Checkbox";
            displayName = "Run on init";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "true";
            tooltip = "Run once, on player initialization.";
        };
        class runonrespawn {
            property = "a3ee_runonrespawn";
            control = "Checkbox";
            displayName = "Run on respawn";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
            tooltip = "Run on each player respawn, passing [newunit,oldunit] as args, like the Respawn EH.\n\nIgnores waiting for player and mission start. Works only on clients and fires only for respawn of client's own player unit, not for any other units.";
        };
        class code {
            property = "a3ee_code";
            control = "EditCode30";
            displayName = "Code";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
            /* does only init line -like validation, forbits passed local vars
             * like _this on the compiler level - unusable for ie. respawn code */
            //validate = "expression";
            tooltip = "Code to run. No valid arguments are passed, do not parse any.";
        };
    };
    class EventHandlers : EventHandlers {
        class exec_code { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_executeCode }"; };
    };
};

class a3ee_insta_osd : a3ee_module_base {
    scope = 2;
    icon = "\A3\modules_f\data\iconStrategicMapMission_ca.paa";
    displayName = "Insta OSD Location Info";
    class Attributes {
        class header {
            property = "a3ee_header";
            control = "Edit";
            displayName = "Custom header";
            expression = "_this setVariable [""%s"",_value]";
            typeName = "STRING";
            defaultValue = """""";
            tooltip = "Displayed in bold above the location info. If unset, no header is displayed.\n\nGood for ie. mission name.";
        };
        class delay {
            property = "a3ee_delay";
            control = "EditShort";
            displayName = "Wait secs";
            expression = "_this setVariable [""%s"",_value]";
            typeName = "NUMBER";
            defaultValue = "20";
            tooltip = "Wait this many seconds after mission start before displaying the text. Don't use low values as many people might still be loading in even >10 seconds after start.";
        };
        class tojip {
            property = "a3ee_tojip";
            control = "Checkbox";
            displayName = "Show to JIP players";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
        };
    };
    class EventHandlers : EventHandlers {
        class exec_code { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_instaOSD }"; };
    };
};

class a3ee_arsenal : a3ee_module_base {
    scope = 2;
    icon = "iconCrateAmmo";
    displayName = "Arsenal";
    class Attributes {
        class actiontext {
            property = "a3ee_arsenal_actiontext";
            control = "Edit";
            displayName = "Action text";
            expression = "_this setVariable [""%s"",_value]";
            typeName = "STRING";
            defaultValue = """Arsenal""";
            tooltip = "Name of the action menu item shown to players.";
        };
        class condition {
            property = "a3ee_arsenal_condition";
            control = "EditCode";
            displayName = "Condition";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """true""";
            tooltip = "Custom condition (expression) for showing the action menu item.\n\nSpecial variables:\n  _target (unit to which action is attached to)\n  _this (caller/executing unit)";
        };
        class structured_hint {
            property = "a3ee_arsenal_structured_hint";
            control = "StructuredText1";
            description = "Hint: Synchronize to one or more objects/units.";
        };
    };
    class EventHandlers : EventHandlers {
        class exec_code { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_arsenal }"; };
    };
};

class a3ee_teleport_on_jip : a3ee_module_base {
    scope = 2;
    icon = "\a3\Missions_F_Curator\data\img\iconMPTypeSectorControl_ca.paa";
    displayName = "Teleport on JIP";
    class EventHandlers : EventHandlers {
        class teleport { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_teleportOnJIP }"; };
    };
};

class a3ee_move_respawn : a3ee_module_base {
    scope = 2;
    icon = "\a3\Missions_F_Curator\data\img\iconMPTypeSectorControl_ca.paa";
    displayName = "Move respawn";
    class Attributes {
        class movemarkers {
            property = "a3ee_movemarkers";
            control = "EditArray";
            displayName = "Markers";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "[""respawn""]";
            tooltip = "Comma-separated list of marker names to move to this module's 3D position on mission start. The nearest surface below this position will be used on respawn.";
        };
    };
    class EventHandlers : EventHandlers {
        class teleport { init = "if (isServer) then { (_this select 0) call a3ee_fnc_m_moveRespawn }"; };
    };
};
