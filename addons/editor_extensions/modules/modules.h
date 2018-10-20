class Logic;
class a3ee_module_base : Logic {
    class EventHandlers;
};

class a3ee_custom_location : a3ee_module_base {
    scope = 2;
    icon = "\A3\modules_f\data\portraitStrategicMapOpen_ca.paa";
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
        class makeloc { init = "if (isServer) then { (_this select 0) call a3ee_modules_fnc_createLoc }"; };
    };
};

class a3ee_briefing : a3ee_module_base {
    scope = 2;
    icon = "\a3\Modules_f\data\portraitHQ_ca.paa";
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
        class send_briefing { init = "if (isServer) then { (_this select 0) call a3ee_modules_fnc_sendBriefing }"; };
    };
};

class a3ee_teleport_on_jip : a3ee_module_base {
    scope = 2;
    icon = "\a3\Missions_F_Curator\data\img\portraitMPTypeSectorControl_ca.paa";
    displayName = "Teleport on JIP";
    class EventHandlers : EventHandlers {
        class teleport { init = "if (isServer) then { (_this select 0) call a3ee_modules_fnc_teleportOnJIP }"; };
    };
};

class a3ee_move_respawn : a3ee_module_base {
    scope = 2;
    icon = "\a3\Missions_F_Curator\data\img\portraitMPTypeSectorControl_ca.paa";
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
        class teleport { init = "if (isServer) then { (_this select 0) call a3ee_modules_fnc_moveRespawn }"; };
    };
};

class a3ee_attach_synced : a3ee_module_base {
    scope = 2;
    icon = "\a3\Modules_F\Data\iconTaskCreate_ca.paa";
    displayName = "Attach synced";
    class Attributes {
        class structured_hint {
            property = "a3ee_attach_synced_structured_hint";
            control = "StructuredText2";
            description = "Hint: First, synchronize the the object/unit you want everything else to attach to with this module. Then, synchronize all of the other objects/units you want to attach.";
        };
    };
    class EventHandlers : EventHandlers {
        class attach { init = "if (isServer) then { (_this select 0) call a3ee_modules_fnc_attachSynced }"; };
    };
};

class a3ee_kill_on_jip : a3ee_module_base {
    scope = 2;
    icon = "iconMan";
    displayName = "Kill player on JIP";
    class Attributes {
        class structured_hint {
            property = "a3ee_kill_on_jip_structured_hint";
            control = "StructuredText2";
            description = "Hint: Simply kill players who Join In Progress. Good for PvP in combination with spectator-on-death for one-life PvP missions.";
        };
    };
    class EventHandlers : EventHandlers {
        class kill_on_jip { init = "if (isServer) then { (_this select 0) call a3ee_modules_fnc_killOnJIP }"; };
    };
};

class a3ee_post_process : a3ee_module_base {
    scope = 2;
    icon = "\a3\Modules_F_Curator\Data\portraitPostprocess_ca.paa";
    displayName = "Post Process Effects";
    class Attributes {
        class preview {
            property = "a3ee_pp_preview";
            control = "Checkbox";
            displayName = "Preview in Eden";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "true";
            tooltip = "Apply effects in Eden as well.";
        };
        class runtime {
            property = "a3ee_pp_runtime";
            control = "Checkbox";
            displayName = "Runtime control";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
            tooltip = "Make the effect disabled on game start and allows runtime toggle of the effects via enableSimulation (local) or enableSimulationGlobal (everywhere). When simulation is disabled, the effects are not applied. When simulation is enabled, the effects become active. This cycle can be repeated any number of times.";
        };
        class fade_in {
            property = "a3ee_pp_fade_in";
            control = "EditShort";
            displayName = "Fade in";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "0";
            typeName = "NUMBER";
            tooltip = "Upon enabling simulation (see Runtime control), blend in the effects smoothly over this many seconds instead of applying them instantly (0).\n\nDoes not work without Runtime control.";
        };
        class fade_out {
            property = "a3ee_pp_fade_out";
            control = "EditShort";
            displayName = "Fade out";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "0";
            typeName = "NUMBER";
            tooltip = "Upon disabling simulation (see Runtime control), blend out the effects smoothly over this many seconds instead of removing them instantly (0).\n\nDoes not work without Runtime control.";
        };
        class cc_structured_hint {
            property = "a3ee_pp_cc_structured_hint";
            control = "StructuredText1";
            description = "Color Corrections";
        };
        class cc_enable {
            property = "a3ee_pp_cc";
            control = "Checkbox";
            displayName = "Enable";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
        };
        class cc_brightness {
            property = "a3ee_pp_cc_brightness";
            control = "EditShort";
            displayName = "Brightness";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "1";
            typeName = "NUMBER";
            tooltip = "Brightness.\nCommon values are between 0-1 where 0 is darkness and 1 is without change, though extremes below 0 or above 1 are supported.";
        };
        class cc_contrast {
            property = "a3ee_pp_cc_contrast";
            control = "EditShort";
            displayName = "Contrast";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "1";
            typeName = "NUMBER";
            tooltip = "Contrast without brightness compensation.\nCommon values 0-1, however values outside the range are supported.";
        };
        class cc_contrast_off {
            property = "a3ee_pp_cc_contrast_off";
            control = "EditShort";
            displayName = "Contrast offset";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "0";
            typeName = "NUMBER";
            tooltip = "Brightness compensation for a Contrast change so that it appears as what we perceive to be contrast.\nIf Contrast above is set to 0.7 instead of 1, make this 0.3 instead of 0 to add the missing brightness. If Contrast above is 1.5, make this -0.5 to remove the excess brightness.";
        };
        class cc_blend_color {
            property = "a3ee_pp_cc_blend_color";
            control = "EditABC";
            displayName = "Blending color (RGB)";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "[0,0,0]";
            typeName = "ARRAY";
            tooltip = "Color which should be blended onto the screen.\nCommon values are 0-1, though values outside this are (for some reason) supported in case you want to blend in ie. negative colors.";
        };
        class cc_blend_factor {
            property = "a3ee_pp_cc_blend_factor";
            control = "EditShort";
            displayName = "Blending factor";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "0";
            typeName = "NUMBER";
            tooltip = "How much of the color specified above should be blended (alpha).\nValues are 0-1 where 0 is no blending (fully transparent), 1 is solid color (no transparency).";
        };
        class cc_desat_color {
            property = "a3ee_pp_cc_desat_color";
            control = "EditABC";
            displayName = "Desaturation color (RGB)";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "[1,1,1]";
            typeName = "ARRAY";
            tooltip = "Color which should be removed (desaturated) from the screen.\nValues same as blending.";
        };
        class cc_desat_factor {
            property = "a3ee_pp_cc_desat_factor";
            control = "EditShort";
            displayName = "Saturation factor";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "1";
            typeName = "NUMBER";
            tooltip = "How much of the original color should remain.\nValues are typically 0-1 where 0 is full desaturation, 1 is no change, values outside this are also supported, try negative saturation factor and be amazed at how trippy it is.";
        };
        class cc_desat_weight {
            property = "a3ee_pp_cc_desat_weight";
            control = "EditABC";
            displayName = "Desaturation weight (RGB)";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "[0.299, 0.587, 0.114]";
            typeName = "ARRAY";
            tooltip = "How the desaturation should be distributed amongst colors.\nThe default values denote how humans usually perceive red/green/blue, so that when you fully desaturate the image, you get greyscale image. If you were to distribute the weights evenly, the final image would appear slightly colored to the human eye.\n\nThe 3 values together should be ~1 when added up.";
        };
        class db_structured_hint {
            property = "a3ee_pp_db_structured_hint";
            control = "StructuredText1";
            description = "Dynamic Blur";
        };
        class db_enable {
            property = "a3ee_pp_db";
            control = "Checkbox";
            displayName = "Enable";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
        };
        class db_bluriness {
            property = "a3ee_pp_db_bluriness";
            control = "EditShort";
            displayName = "Bluriness";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "0";
            typeName = "NUMBER";
            tooltip = "How much to blur the screen.\nTypical values 0-? where 0 is no change and ? is however disoriented you want to be.";
        };
        class ca_structured_hint {
            property = "a3ee_pp_ca_structured_hint";
            control = "StructuredText1";
            description = "Chromatic Aberration";
        };
        class ca_enable {
            property = "a3ee_pp_ca";
            control = "Checkbox";
            displayName = "Enable";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
        };
        class ca_power {
            property = "a3ee_pp_ca_power";
            control = "EditXY";
            displayName = "Aberration power (2-axis)";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "[0.005, 0.005]";
            typeName = "ARRAY";
            tooltip = "Strength of the aberration per-axis.\nBigger values equal to stronger effect within the given axis; X is left-right, Y is up-down on the screen.";
        };
        class ca_correction {
            property = "a3ee_pp_ca_correction";
            control = "Checkbox";
            displayName = "Correct for aspect ratio";
            expression = "_this setVariable [""%s"",_value]";
            defaultValue = "false";
            tooltip = "Enable to get the exact specified power anywhere on the screen.\nWithout this option, horizontal aberration becomes more extreme on the left/right screen edges (assuming widescreen display), distorting the image further.";
        };
    };
    class EventHandlers : EventHandlers {
        class post_process {
            init = "if (isServer && !is3DEN) then { (_this select 0) call a3ee_modules_fnc_postProcess }";
            AttributesChanged3DEN = "[(_this select 0), 'add'] call a3ee_modules_fnc_postProcess";
            UnregisteredFromWorld3DEN = "[(_this select 0), 'del'] call a3ee_modules_fnc_postProcess";
        };
    };
};
