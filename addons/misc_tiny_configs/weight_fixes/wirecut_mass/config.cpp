/*
 * reduce wirecutter mass to match other handheld items
 */

class CfgPatches {
    class Weight_Fixes_Wirecut_Mass {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "ace_logistics_wirecutter"
        };
    };
};

class CfgWeapons {
    class CBA_MiscItem;
    class ACE_ItemCore : CBA_MiscItem {
        class ItemInfo;
    };
    class ACE_wirecutter : ACE_ItemCore {
        class ItemInfo : ItemInfo {
            mass = 2;
        };
    };
};
