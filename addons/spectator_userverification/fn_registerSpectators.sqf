if(isServer) then {
sleep 5;
Spectator_Players = [];
{
	if(_x isKindOf "VirtualSpectator_F") then {
    Spectator_Players pushback getPlayerUID _x;
    };
} forEach allPlayers;
publicVariable "Spectator_Players";
};