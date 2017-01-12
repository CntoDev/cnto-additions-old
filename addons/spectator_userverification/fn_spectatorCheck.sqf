if(!didJip OR !hasInterface) exitWith{};
0 = [] spawn {
	// wait until mission has loaded in and player is available
    waitUntil { !(isNull player); time > 0};
    if (player isKindOf "VirtualSpectator_F") then {
    	// be sure that the server has assigned the spectator clients
    	// should not be needed as this is only on JIP, but just to take care of any future uses
        waitUntil (!(isNil "Spectator_Players"));
        if (!((getPlayerUID player) in Spectator_Players)) then{
        failMission "LOSER";
        };
    };
};