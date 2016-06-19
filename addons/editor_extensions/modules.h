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
        class makeloc { init = "if (isServer) then { (_this select 0) call a3ee_fnc_createLoc }"; };
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
        class hideterr { init = "if (isServer) then { (_this select 0) call a3ee_fnc_hideTerrain }"; };
    };
};

class a3ee_briefing : a3ee_module_base {
    scope = 2;
    icon = "\a3\Modules_f\data\iconHQ_ca.paa";
    displayName = "Briefing";
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
            tooltip = "Description here.";
        };
        class mission {
            property = "a3ee_briefing_mission";
            control = "EditBig15";
            displayName = "Mission";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
            tooltip = "Description here.";
        };
        class execution {
            property = "a3ee_briefing_execution";
            control = "EditBig15";
            displayName = "Execution";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
            tooltip = "Description here.";
        };
        class logistics {
            property = "a3ee_briefing_logistics";
            control = "EditBig15";
            displayName = "Logistics";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
            tooltip = "Description here.";
        };
        class other {
            property = "a3ee_briefing_other";
            control = "EditBig15";
            displayName = "Other";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = """""";
            typeName = "STRING";
            tooltip = "Description here.";
        };
    };
    class EventHandlers : EventHandlers {
        class send_briefing { init = "if (isServer) then { (_this select 0) call a3ee_fnc_sendBriefing }"; };
    };
};
