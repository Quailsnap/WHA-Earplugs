//====================================================================================
//
//	wh_ep_init.sqf - Initializes values for WH earplugs.
//
//	[] execVM "wh\earplugs\wh_ep_init.sqf";
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initial setup.
//------------------------------------------------------------------------------------

//	Used so that I don't have to use actual #include command, which can create issues.
#define CALL_NOSAVE call compile preprocessFileLineNumbers

//	User-friendly name to track script.
scriptName "WH EARPLUGS";

//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variables that will be flipped on and off.
WH_EP_EARPLUGS = true; // Whether the earpro system is enabled
player setVariable['WH_EP_EARPLUGS_IN',false,true]; // Whether the earplugs are currently in and sound reduced
WH_EP_MANUAL = false; // used for purely keeping track of player actions


//------------------------------------------------------------------------------------
//	Configuration, functions, settings import, and additional setup.
//------------------------------------------------------------------------------------

//	Determine which mods are active.
CALL_NOSAVE "wh\earplugs\init\wh_ep_checkMods.sqf";

//	Allows for missionmaker configuration of important settings.
CALL_NOSAVE "wh\earplugs\wh_ep_CONFIG.sqf";

//	Construct & compile functions.
CALL_NOSAVE "wh\earplugs\wh_ep_functions.sqf";

//	Imports settings if CBA is not present,
//	sets up an options menu if it is.
CALL_NOSAVE "wh\earplugs\init\wh_ep_settings.sqf";

//	Emergency exit if the earplug system is disabled.
if (!WH_EP_EARPLUGS) exitWith {};

//	Setting up our toggle key (Default '-').
CALL_NOSAVE "wh\earplugs\init\wh_ep_toggleKey.sqf";

//	Add basic briefing detailing script features.
//	If CBA is not present, add a settings menu and import profile settings.
CALL_NOSAVE "wh\earplugs\init\wh_ep_briefing.sqf";


//------------------------------------------------------------------------------------
//	Initializing for player.
//------------------------------------------------------------------------------------

//	Let the player initialize properly.
waitUntil{!isNull player};
waitUntil{player == player};

//	Wait for player to get ingame.
waitUntil {!isNull (findDisplay 46)};

//	Reducing volume if player has set that as default.
if WH_EP_DEFAULT then { call wh_ep_fnc_insert };

//	Updating player eventhandlers for respawning and getting in vehicles.
call wh_ep_fnc_updateHandlers;

//	Script tracing.
diag_log "[WH-EP] Initialization finished.";


//------------------------------------------------------------------------------------
//	Adding nametag actions to player.
//------------------------------------------------------------------------------------

//	Add earplug self-interact or addaction.
if WH_EP_ACTION then { call wh_ep_fnc_updateAction; };
