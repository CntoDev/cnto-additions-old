/*
 * hide actions - hide some dangerous / unnecessary vanilla menu actions
 */

class CfgPatches {
    class a3aa_mtc_hide_actions {
        units[] = {};
        weapons[] = {};
        magazines[] = {};
        requiredAddons[] = {
            "A3_Ui_F"  /* Eject */
        };
    };
};

class CfgActions {
    class None;
    class Eject : None {
        show = 0;
    };
    /*
     * Rearm would fix the soldier-based annoying rearm, but also hide
     * the vehicle-based rearm from an ammo truck, unfortunately
     */
};
