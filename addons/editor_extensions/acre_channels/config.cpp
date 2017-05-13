class CfgPatches {
    class Editor_Extensions_acre_channels {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"Editor_Extensions_shared"};
    };
};

class CfgFunctions {
    class a3ee_acre_channels {
        class all {
            file = "\editor_extensions\acre_channels";
            class setChannels;
        };
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class Control {
                class Attributes {
                    class a3ee_acrechannels {
                        property = "a3ee_acrechannels";
                        control = "EditArray";
                        displayName = "ACRE2 Preset Channels";
                        expression = "[_this, _value] call a3ee_acre_channels_fnc_setChannels";
                        condition = "objectBrain";
                        defaultValue = "[]";
                        tooltip = "List of channel numbers to be set by default when a player spawns in. First number in the list is for the first (primary) radio (ie. PRC343), second number is for the second (ie. PRC148), etc., based on inventory order. A special value 0 means to leave the default.\n\nIf this unit is a group leader, the channel settings and group callsign will be recorded in a Diary entry.\n\nExamples:\n2, 2 = 1st and 2nd radios to channel 2, others ignored\n0, 3 = ignore 1st, set 2nd to channel 3, ignore the rest";
                    };
                };
            };
        };
    };
};
