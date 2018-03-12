==========================================================================================

	WHALE'S EARPLUGS (V0.1.0 Alpha) 
	SCRIPT FOR ARMA 3
	
	( https://github.com/Whalen207/WH-EP )
	Contact @ /u/Whalen207 | Whale #5963

	Features:
	-	Reduces in-game effects volume with an action.
	-	Action by default an addAction, can be used from ACE > Equipment if ACE is present.
	-	Earplugs can also be inserted with a key (default "-").
	-	Getting in a vehicle automatically inserts ear protection.
	
	Future Features:
	-	Amount of sound reduction customizable by player.
	-	Able to disable / enable / change toggle key.
	
	How to Implement:
	-	Move the wh folder (with \earplugs) into your root mission folder.
	-	Configure your settings inside wh_earplugCONFIG.sqf (Optional)
	-	Make a file called 'initPlayerLocal.sqf' or 'init.sqf' in the root mission folder.
	-	Put this code in 'initPlayerLocal.sqf' OR 'init.sqf': 
		[] execVM "wh\earplugs\wh_earplugInit.sqf";
	-	Make a file called 'description.ext' in the root mission folder.
	-	Put this code in the 'description.ext' function header (CfgFunctions):
		#include "wh\earplugs\functions\wh_earplugFunctions.hpp"

==========================================================================================