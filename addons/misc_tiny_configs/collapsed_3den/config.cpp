/*
 * this collapses all editor categories/subcategories by default,
 * so that ie. NATO->Infantry->Rifleman isn't expanded by default,
 * in both the right pane and double-click on ground
 *
 * really useful when you use exclusively modded units and vanilla
 * menus are getting in the way, *especially* as they reopen after
 * returning from scenario Preview, closing the Config Viewer, etc.
 */

class CfgPatches {
    class Collapsed_3DEN {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"3den"};
    };
};

class ctrlControlsGroupNoScrollbars;
class ctrlTree;

/*
 * right pane
 */
class Display3DEN {
    class Controls {
        class PanelRight: ctrlControlsGroupNoScrollbars {
            class Controls {
                class PanelRightCreate: ctrlControlsGroupNoScrollbars {
                    class Controls {
                        class Create: ctrlControlsGroupNoScrollbars {
                            class Controls {
                                class CreateObjectWEST: ctrlTree {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_WEST
                                };
                                class CreateObjectEAST: CreateObjectWEST {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_EAST
                                };
                                class CreateObjectGUER: CreateObjectWEST {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_GUER
                                };
                                class CreateObjectCIV: CreateObjectWEST {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_CIV
                                };
                                class CreateObjectEMPTY: CreateObjectWEST {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_EMPTY
                                };
                                class CreateGroupWEST: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_GROUP_WEST
                                };
                                class CreateGroupEAST: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_GROUP_EAST
                                };
                                class CreateGroupGUER: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_GROUP_GUER
                                };
                                class CreateGroupCIV: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_GROUP_CIV
                                };
                                class CreateGroupEMPTY: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_GROUP_EMPTY
                                };
                                class CreateGroupCUSTOM: CreateObjectWEST {
                                    defaultItem[] = {};  //DEFAULT_SELECT_GROUP_CUSTOM
                                };
                                class CreateTrigger: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_TRIGGER
                                };
                                class CreateWaypoint: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_WAYPOINT
                                };
                                class CreateObjectLogic: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_LOGIC
                                };
                                class CreateObjectModule: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_MODULE
                                };
                                class CreateMarkerIcon: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_MARKER_ICON
                                };
                                class CreateMarkerArea: CreateObjectEMPTY {
                                    defaultItem[] = {};  //DEFAULT_SELECT_MARKER_SHAPE
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};

/*
 * double-click on ground
 */
class DisplaySimulated;
class Display3DENPlace: DisplaySimulated {
    class ControlsBackground {
        class PanelRightCreate: ctrlControlsGroupNoScrollbars {
            class Controls {
                class Create: ctrlControlsGroupNoScrollbars {
                    class Controls {
                        class CreateObjectWEST: ctrlTree {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_WEST
                        };
                        class CreateObjectEAST: CreateObjectWEST {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_EAST
                        };
                        class CreateObjectGUER: CreateObjectWEST {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_GUER
                        };
                        class CreateObjectCIV: CreateObjectWEST {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_CIV
                        };
                        class CreateObjectEMPTY: CreateObjectWEST {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_EMPTY
                        };
                        class CreateGroupWEST: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_GROUP_WEST
                        };
                        class CreateGroupEAST: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_GROUP_EAST
                        };
                        class CreateGroupGUER: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_GROUP_GUER
                        };
                        class CreateGroupCIV: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_GROUP_CIV
                        };
                        class CreateGroupEMPTY: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_GROUP_EMPTY
                        };
                        class CreateGroupCUSTOM: CreateObjectWEST {
                            defaultItem[] = {};  //DEFAULT_SELECT_GROUP_CUSTOM
                        };
                        class CreateTrigger: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_TRIGGER
                        };
                        class CreateWaypoint: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_WAYPOINT
                        };
                        class CreateObjectLogic: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_LOGIC
                        };
                        class CreateObjectModule: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_OBJECT_MODULE
                        };
                        class CreateMarkerIcon: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_MARKER_ICON
                        };
                        class CreateMarkerArea: CreateObjectEMPTY {
                            defaultItem[] = {};  //DEFAULT_SELECT_MARKER_SHAPE
                        };
                    };
                };
            };
        };
    };
};
