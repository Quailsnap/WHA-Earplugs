==========================================================================================

	WHALE'S EARPLUGS (V0.2.0 Alpha) 
	SCRIPT FOR ARMA 3
	
	( https://github.com/Whalen207/WH-EP )
	Contact @ /u/Whalen207 | Whale #5963

	Features:
	-	Plugs reduce in-game effect volume without touching music or Teamspeak.
	-	Toggled in and out with an addAction that can be disabled.
	-	May also be used with a keybind (default "-") that can be disabled.
	-	By default will automatically be put in when entering vehicles.
	-	Configurable levels of sound protection.
	-	Optionally present at mission start / upon respawn.
	-	Full settings menu in briefing screen, or CBA addon options if CBA is present.
	
	Mod Compatibility:
	-	If ACE is present, the normal menu addAction will be replaced with a self-interact
		option found under self-interact > equipment.
	-	If CBA is present, the settings menu in briefing will be replaced with a menu
		under ESC > Options > Addon Options > WH Earplugs.
	-	If CBA is present, the toggle key bind previously only configurable by
		the missionmaker (default "-") can now be changed by users.
	
	Frequently Asked Questions:
	-	"How do I use this script?"
		Add it to a mission using the instructions below.
	-	"Will there ever be an addon version that will automatically run in every mission?"
		Most likely, once I'm done with my Nametag and Unit Marker scripts.
	-	"Does this script affect in-game voice communication?"
		It does affect the direct channel. I'm looking for ways to avoid this.
	
	Planned Features:
	-	Including / excluding certain vehicles from auto earplugs.
	
	How to Test This Script:
	1.	Click on the green 'Clone or Download' button on the main github repository page.
	2.	Download as ZIP. Extract wherever you like.
	3.	Move the mission file alone (wh_earplugs.Stratis) inside your singleplayer mission 
		folder, normally C:\Users\YOURNAME\Documents\Arma 3\USERNAME\missions.
	4.	Open up Arma 3 with no mods, or with CBA, or with CBA and ACE.
	5.	Open the editor and load up Stratis.
	6.	In the top left, use the ajar folder icon to OPEN your mission folder.
	7.	Navigate to wh_earplugs mission and OPEN that.
	8.	In the bottom right, select 'PLAY SCENARIO IN SINGLEPLAYER.'
	
	How to Add This Script to a Mission:
	1.	Move the wh folder (with \earplugs) into your root mission folder.
	2.	Configure your settings inside wh_earplugCONFIG.sqf (Optional)
	3.	Make a file called 'initPlayerLocal.sqf' or 'init.sqf' in the root mission folder.
	4.	Put this code in 'initPlayerLocal.sqf' OR 'init.sqf': 
	5.	[] execVM "wh\earplugs\wh_earplugInit.sqf";
	6.	Make a file called 'description.ext' in the root mission folder.
	7.	Put this code in the 'description.ext' function header (CfgFunctions):
		#include "wh\earplugs\functions\wh_earplugFunctions.hpp"

==========================================================================================