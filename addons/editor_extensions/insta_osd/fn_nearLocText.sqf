/*
 * return a string describing the relation of '_pos' (object or position)
 * to nearby locations with non-empty text
 * if none is found, return ""
 *
 * optionally, specify a custom radius to look within
 */

params ["_pos", ["_radius", 1500]];

if (typeName _pos == "OBJECT") then {
    _pos = position _pos;
};

/* one of:
 *   "near Agios Minas, Syrta" - near Agios Minas, which is near Syrta
 *   "Agios Minas, near Syrta" - at Agios Minas, which is near Syrta
 *   "near Agios Minas"        - near Agios Minas, no village/town nearby
 *   "Agios Minas"             - at Agios Minas, no village/town nearby
 *   "near Syrta"              - near Syrta, the closest location
 *   "Syrta"                   - in Syrta
 */

/* all reasonable location types (not internal ones), from CfgLocationTypes */
private _all_locs = ["Mount", "Name", "Strategic", "StrongpointArea",
    "FlatArea", "FlatAreaCity", "FlatAreaCitySmall", "CityCenter", "Airport",
    "NameMarine", "NameCityCapital", "NameCity", "NameVillage", "NameLocal",
    "Hill", "ViewPoint", "RockArea", "BorderCrossing", "VegetationBroadleaf",
    "VegetationFir", "VegetationPalm", "VegetationVineyard"];
/* "cities" or similarly big landmarks */
private _city_locs = ["NameCity", "NameCityCapital", "NameMarine",
    "NameVillage"];

/* nearest location with non-empty text */
private _nearest_loc_text = {
    params ["_pos", "_types", "_radius"];
    {
        if (text _x != "") exitWith { _x };
        nil;
    } forEach nearestLocations [_pos, _types, _radius];
};

/* look for any nearby loc */
private _loc = ([_pos, _all_locs, _radius] call _nearest_loc_text);
if (isNil "_loc") exitWith {""};

/* if it is a city/village, use it straight away */
if (type _loc in _city_locs) exitWith {
    if (_pos in _loc) then { text _loc } else { "near " + text _loc };
};

/* else use it, but look for a nearby city */
private _city = ([position _loc, _city_locs, _radius] call _nearest_loc_text);
if (!isNil "_city") then {
    if (_pos in _loc) then {
        format ["%1, near %2", text _loc, text _city];
    } else {
        format ["near %1, %2", text _loc, text _city];
    };
} else {
    /* just non-city location alone */
    if (_pos in _loc) then { text _loc } else { "near " + text _loc };
};
