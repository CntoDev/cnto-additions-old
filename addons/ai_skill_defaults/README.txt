Ensure that you have set skillAI and precisionAI in your .Arma3Profile to 1,
that is multiplying the set skill values by 1, thus not lowering them further
beyond what this addon sets.

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

See BI wiki for more info:
https://community.bistudio.com/wiki/server.armaprofile#Arma_3
