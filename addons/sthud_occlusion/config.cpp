class CfgPatches {
    class STHud_Occlusion {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"STUI_GroupHUD"};
    };
};

class CfgFunctions {
    class STHud_Occlusion {
        class All {
            file = "\sthud_occlusion";
            class setOcclusion { postInit = 1 };
        };
    };
};
