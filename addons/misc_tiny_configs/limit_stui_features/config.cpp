/*
 * disable unwanted STUI features (as there's no CBA setting menu for them)
 * (this doesn't fully disable the modifications done via Config)
 */
class CfgPatches {
    class Limit_STUI_Features {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "STUI_AutoBrightness",
            //"STUI_GroupIndicators",
            "STUI_NameTags",
            "STUI_Stamina"
        };
    };
};

class Extended_PreInit_EventHandlers {
    delete STUI_AutoBrightness;
    //delete STUI_GroupIndicators;
    delete STUI_NameTags;
    delete STUI_Stamina;
};
