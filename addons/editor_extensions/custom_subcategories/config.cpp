/*
 * adds CNTO composition category and subcategories to keep things organized
 */

class CfgPatches {
    class Eden_Extensions_Custom_Subcategories {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
    };
};

class CfgEditorSubcategories
{
	class CNTODefaults // Category class, you point to it in editorSubcategory property
	{
		displayName = "CNTO Defaults"; // Name visible in the list
	};
	
	class CNTOStandardFaction // Category class, you point to it in editorSubcategory property
	{
		displayName = "CNTO Standard Faction"; // Name visible in the list
	};	
	
	class CNTOStandardFactionAdaptation // Category class, you point to it in editorSubcategory property
	{
		displayName = "CNTO Standard Faction Adaptation"; // Name visible in the list
	};	
	
	class CNTOCustomFaction // Category class, you point to it in editorSubcategory property
	{
		displayName = "CNTO Custom Faction"; // Name visible in the list
	};		
};