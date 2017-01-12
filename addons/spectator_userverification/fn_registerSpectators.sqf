if(isServer) then {
	0 = [] spawn {
		// wait until mission has loaded in and players are initialized
		waitUntil {time > 10 };

		Spectator_Players = [];
		{
			if(isPlayer _x) then {
		    Spectator_Players pushback getPlayerUID _x;
		    };
		} forEach entities "VirtualSpectator_F";
		publicVariable "Spectator_Players";
	};
};