private _set_grass = {
    switch (_this) do {
        case "grasskeys_low_down":      { setTerrainGrid 50 };
        case "grasskeys_standard_down": { setTerrainGrid 25 };
        case "grasskeys_high_down":     { setTerrainGrid 12.5 };
        case "grasskeys_veryhigh_down": { setTerrainGrid 6.25 };
        case "grasskeys_ultra_down":    { setTerrainGrid 3.125 };
    };
};

private _key = _this select 6;

/* only if the game type is not PvP */
switch (getText (getMissionConfig "header" >> "gameType")) do {
    case "";  //Unknown
    case "Sandbox";
    case "Coop";
    case "ZCoop": { _key call _set_grass };
};
