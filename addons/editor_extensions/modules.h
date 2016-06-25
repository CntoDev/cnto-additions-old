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
        class structured_hint {
            property = "a3ee_structured_hint";
            control = "StructuredText1";
            description = "Hint: Change size in System: Transformation above.";
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
        class structured_hint {
            property = "a3ee_structured_hint";
            control = "StructuredText1";
            description = "Hint: Change size in System: Transformation above.";
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
            defaultValue = """General situation, in and around the AO, of political, military, civilian and other nature. Implications of previous operations, expected situational forecasts, etc."" + toString [10,10] + \
                            ""<font size='18'>Area of Operations</font>"" + toString [10] + \
                            ""Terrain, areas of interest, weather, time of day, etc."" + toString [10,10] + \
                            ""<font size='18'>Enemy forces</font>"" + toString [10] + \
                            ""Composition, disposition, strength, assets. Recent activities, locations."" + toString [10,10] + \
                            ""<font size='18'>Friendly forces</font>"" + toString [10] + \
                            ""Adjacent friendly elements, composition and their mission (tasking).""";
            typeName = "STRING";
        };
        class mission {
            property = "a3ee_briefing_mission";
            control = "EditBig15";
            displayName = "Mission";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """A concise statement that includes the Who, What, Where, When, and Why of the operation to be conducted. It should be short (1-5 sentences) and to the point.""";
            typeName = "STRING";
        };
        class execution {
            property = "a3ee_briefing_execution";
            control = "EditBig15";
            displayName = "Execution";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """<font size='18'>Commander's Intent</font>"" + toString [10] + \
                            ""What does the higher command want the element to do, purpose of the operation, how the situation should be resolved."" + toString [10,10] + \
                            ""<font size='18'>Concept of the Operation</font>"" + toString [10] + \
                            ""Movement and maneuver, who should move where and when (ie. in relation to other elements), incl. supporting elements. Ie. air moving into AO only after AA is taken down."" + toString [10,10] + \
                            ""Fire support plan (if fire support is available) - purpose, priorities, restrictions (ie. regarding civilian areas)."" + toString [10,10] + \
                            ""<font size='18'>Tasks</font>"" + toString [10] + \
                            ""Clear list of primary and secondary tasks to be completed on the operation."" + toString [10,10] + \
                            ""<font size='18'>Coordination</font>"" + toString [10] + \
                            ""Rules of Engangement, environmental considerations, other risk reduction measures (ie. periodic visual/radio checks).""";
            typeName = "STRING";
        };
        class admin_logistics {
            property = "a3ee_briefing_logistics";
            control = "EditBig15";
            displayName = "Admin & Logistics";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """<font size='18'>Personnel extraction</font>"" + toString [10] + \
                            ""Civilian, POW and WIA/casualty evacuation plan - how, when, in what form."" + toString [10,10] + \
                            ""<font size='18'>Resupply and reinforcement</font>"" + toString [10] + \
                            ""What (type, size), when, where, how delivered."" + toString [10,10] + \
                            ""<font size='18'>Available assets</font>"" + toString [10] + \
                            ""Additional logistical assets such as transport vehicles available for the mission.""";
            typeName = "STRING";
        };
        class command_signal {
            property = "a3ee_briefing_command";
            control = "EditBig15";
            displayName = "Command & Signal";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """Communication/signal methods (radio, smoke, code words, etc.)."" + toString [10,10] + \
                            ""Succession of command, who should take over which element.""";
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
    displayName = "Execute code (init)";
    class Attributes {
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
            displayName = "Run for JIP players";
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
            defaultValue = "0";
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
        class code {
            property = "a3ee_code";
            control = "EditCode30";
            displayName = "Code";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
            validate = "expression";
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
