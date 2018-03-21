//====================================================================================
//
//	wha_ep_init.sqf - Initializes values for WHA earplugs.
//
//	[] execVM "wha\earplugs\wha_ep_init.sqf";
//
//	Contact: Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initial setup.
//------------------------------------------------------------------------------------

//	Used so that I don't have to use actual #include command, which can create issues.
#define CALL_NOSAVE call compile preprocessFileLineNumbers

//	User-friendly name to track script.
scriptName "WHA EARPLUGS";

//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variables that will be flipped on and off.
WHA_EP_EARPLUGS = true; // Whether the earpro system is enabled
player setVariable['WHA_EP_EARPLUGS_IN',false,true]; // Whether the earplugs are currently in and sound reduced
WHA_EP_MANUAL = false; // used for purely keeping track of player actions


//------------------------------------------------------------------------------------
//	Configuration, functions, settings import, and additional setup.
//------------------------------------------------------------------------------------

//	Get an array of which mods are currently active.
_modsArray = [] CALL_NOSAVE "wha\earplugs\init\wha_ep_checkMods.sqf";

//	Interpret returned array from checkMods.
_modsArray params [ ["_cbaPresent",false], ["_acePresent",true] ];

//	Allows for missionmaker configuration of important settings.
CALL_NOSAVE "wha\earplugs\wha_ep_CONFIG.sqf";

//	Emergency exit if the earplug system is disabled.
if (!WHA_EP_EARPLUGS) exitWith {};

//	Construct & compile functions.
//	Uses local variables collected earlier to determine which functions to use.
[_acePresent] CALL_NOSAVE "wha\earplugs\wha_ep_functions.sqf";

//	Imports settings if CBA is not present,
//	sets up an options menu if it is.
[_cbaPresent] CALL_NOSAVE "wha\earplugs\init\wha_ep_settings.sqf";

//	Setting up our toggle key (Default '-').
[_cbaPresent] CALL_NOSAVE "wha\earplugs\init\wha_ep_toggleKey.sqf";

//	Add basic briefing detailing script features.
//	If CBA is not present, add a settings menu and import profile settings.
[_cbaPresent] CALL_NOSAVE "wha\earplugs\init\wha_ep_briefing.sqf";


//------------------------------------------------------------------------------------
//	Initializing for player.
//------------------------------------------------------------------------------------

//	Let the player initialize properly.
waitUntil{!isNull player};
waitUntil{player == player};

//	Wait for player to get ingame.
waitUntil {!isNull (findDisplay 46)};

//	Reducing volume if player has set that as default.
if WHA_EP_DEFAULT then { call wha_ep_fnc_insert };

//	Updating player eventhandlers for respawning and getting in vehicles.
call wha_ep_fnc_updateHandlers;

//	Script tracing.
diag_log "[WHA-EP] Initialization finished.";


//------------------------------------------------------------------------------------
//	Adding earplug actions to player.
//------------------------------------------------------------------------------------

//	Add earplug self-interact or addaction.
if WHA_EP_ACTION then { call wha_ep_fnc_updateAction; };
