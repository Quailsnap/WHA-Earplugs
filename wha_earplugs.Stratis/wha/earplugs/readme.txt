==========================================================================================

	WHALE'S EARPLUGS (V0.3.3 Beta) 
	SCRIPT FOR ARMA 3
	
	( https://github.com/Quailsnap/WHA-Earplugs )
	Contact: Whale#5963

	Features:
	-	Plugs reduce in-game effect volume without touching Teamspeak.
	-	They can be toggled in and out with an addAction that can be disabled.
	-	May also be used with a keybind (default "-") that can be disabled.
	-	By default will automatically be put in when entering vehicles.
	-	Users can select which types of vehicles automatically trigger earplugs, if any.
	-	Configurable levels of sound protection.
	-	Optionally present at mission start / upon respawn.
	-	Full settings menu in briefing screen, or CBA addon options if CBA is present.
	
	Mod Compatibility:
	-	This script is not compatible with ACE Hearing.
	-	If ACE Core is present, the normal menu addAction will be replaced with a self-interact
		option found under self-interact > equipment.
	-	If CBA is present: the settings menu in briefing will be replaced with a menu
		under ESC > Options > Addon Options > WHA Earplugs; the toggle key bind previously 
		only configurable by the missionmaker (default "-") can now be changed by users
		in ESC > Options > Controls > Configure Addons > WHA Earplugs; and an additional
		"Hold to Deafen" button can be utilized.
	
	Frequently Asked Questions:
	-	"How do I use this script?"
		Add it to a mission using the instructions below.
	-	"Will there ever be an addon version that will automatically run in every mission?"
		There is an alpha version available at:
		https://github.com/Quailsnap/WHA-Earplugs-Addon
	-	"Does this script affect in-game voice communication?"
		It does affect the direct channel, but not others (group, side, etc). I'm looking for ways to avoid this.
	
	Planned Features:
	-	???
	
	How to Download:
	1.	For stable releases, go to the main github page, click on 'releases',
		find the latest release, and click on the source code .zip to download it.
	2.	For the most recent version, go the main github page, click on the green
		'Clone or download' button, and download ZIP.
		
	How to Test:
	1.	Move the mission file alone (wha_earplugs.Stratis) inside your singleplayer mission 
		folder, normally C:\Users\YOURNAME\Documents\Arma 3\USERNAME\missions.
	2.	Open up Arma 3 with no mods, or with CBA, or with CBA and ACE.
	3.	Open the editor and load up Stratis.
	4.	In the top left, use the ajar folder icon to OPEN your mission folder.
	5.	Navigate to wha_earplugs mission and OPEN that.
	6.	In the bottom right, select 'PLAY SCENARIO IN SINGLEPLAYER.'
	
	How to Add to a Mission:
	1.	Move the wh folder (with \earplugs) into your root mission folder.
	2.	Configure your settings inside wha_earplugCONFIG.sqf (Optional)
	3.	Make a file called 'initPlayerLocal.sqf' or 'init.sqf' in the root mission folder.
	4.	Put this code in 'initPlayerLocal.sqf' OR 'init.sqf' to have the mission run the
		script each time it starts up: 
		[] execVM "wha\earplugs\wha_earplugInit.sqf";

==========================================================================================