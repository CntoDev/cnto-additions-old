/*
 * remove various useless / unused Cfg3DEN attributes that creep into
 * compositions .sqe and mission .sqm files, creating diff noise and increasing
 * composition / mission file size
 *
 * note that not all attributes are here, only the ones that either have
 * a dynamic default value (and thus show in saved compositions every time)
 * or are bugged in some other way that makes them being saved despite not being
 * touched by the mission maker
 *
 * these are otherwise harmless, but it's easier if they're gone
 */

class CfgPatches {
    class Eden_Extensions_Spurious_Attributes {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {
            "A3_3DEN",
            "acex_headless",
            "ace_medical"
        };
    };
};

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    delete acex_headless_blacklist;
                };
            };
            class Identity {
                class Attributes {
                    delete Face;
                    delete NameSound;
                    delete Pitch;
                    delete Speaker;
                    delete UnitInsignia;
                    delete UnitName;
                };
            };
        };
    };
    class Group {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    delete acex_headless_blacklist;
                    delete ace_isMedicalFacility;
                };
            };
        };
    };
};
