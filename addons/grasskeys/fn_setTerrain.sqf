/* only if the game type is not PvP */
switch (getText (getMissionConfig "header" >> "gameType")) do {
    case "";  /* "Unknown" */
    case "CTI";
    case "Sandbox";
    case "Coop": { setTerrainGrid _this };
};
