/*
 * the Eden editor allows mission makers to rename group callsigns,
 * but uses only local setGroupId to do so, making it work only
 * on the server in MP (as it's done via Eden Attribute, which are
 * server-only)
 *
 * replace the expression with setGroupIdGlobal, so that group ids
 * are broadcasted from the server correctly
 *
 * filed some time ago as https://feedback.bistudio.com/T117142 ,
 * but in a typical BI fashion never fixed despite being trivial
 *
 * NOTE: this currently duplicates new CBA v3.1.0 functionality
 */

class CfgPatches {
    class Global_GroupIDs {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"3den"};
    };
};

class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class Init {
                class Attributes {
                    class Callsign {
                        expression = "_this setGroupIdGlobal [_value];";
                    };
                };
            };
        };
    };
};
