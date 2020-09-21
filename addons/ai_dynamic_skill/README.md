This addon requires skillAI and precisionAI to be set to 1.0.

Use either Regular or Veteran difficulty (and do not remove the
`misc_tiny_configs/difficulties` pbo) or (in case of Custom difficulty)
make sure that both settings are set to 1.0 in the server's `.Arma3Profile`,
and the Custom difficulty is selected/forced by `server.cfg`.

`.Arma3Profile`:

    class DifficultyPresets
    {
        class CustomDifficulty
        {
            class Options
            {
                ...
            };
            aiLevelPreset=3;
        };
        class CustomAILevel
        {
            skillAI=1;
            precisionAI=1;
        };
    };

`server.cfg`:

    forcedDifficulty = "custom";

See BI wiki for more info:
https://community.bistudio.com/wiki/server.armaprofile#Arma_3
