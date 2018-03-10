//====================================================================================
//
//	wh_earplugACEAction.sqf - Adds ACE self-interact option for earplugs.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	<>
//------------------------------------------------------------------------------------

//	<>

Airstrike_Action = 
	["earplugsin",
	"Put in Earplugs",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	{ call wh_ep_fnc_earplugInsert },
	{true}] call ace_interact_menu_fnc_createAction;

" \n " " \n "[this, 1, ["ACE_SelfActions"], Airstrike_Action] call ace_interact_menu_fnc_addActionToObject;