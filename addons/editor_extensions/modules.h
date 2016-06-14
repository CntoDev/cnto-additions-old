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
