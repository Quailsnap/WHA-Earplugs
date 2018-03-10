//====================================================================================
//
//	wh_earplugInit.sqf - Initializes values for WH earplugs.
//
//	[] execVM "wh\earplugs\wh_earplugInit.sqf";
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initial setup.
//------------------------------------------------------------------------------------

//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variables that will be flipped on and off.
WH_EP_EARPLUGS = true;	// Whether the earpro system is enabled
WH_EP_EARPLUGS_IN = false;	// Whether the earplugs are currently in and sound reduced
WH_EP_EARPLUGS_DEFAULT = false;  // TODO : move to config
WH_EP_EARPLUGS_MANUAL = false;	// TODO : uhh? this is used for purely keeping track
								//			of player actions and is not touched auto

//	Determine which mods are active.
#include "include\wh_earplugCheckMods.sqf";

//	Construct & compile action code (earplugUpdateAction) based on presence of ACE.
#include "include\wh_earplugCompileAction.sqf"

//	Construct & compile hint system based on presence of ACE.
#include "include\wh_earplugCompileHint.sqf"


//------------------------------------------------------------------------------------
//	Configuration and settings import and setup.
//------------------------------------------------------------------------------------

//	Allows for missionmaker configuration of important settings.
#include "wh_earplugCONFIG.sqf"

//	Allows for player (client) configuration of other settings.
//#include "include\wh_earplugSettings.sqf"

//	Emergency exit if the earplug system is disabled.
if (!WH_EP_EARPLUGS) exitWith {};


//------------------------------------------------------------------------------------
//	Initializing for player.
//------------------------------------------------------------------------------------

//	Let the player initialize properly.
waitUntil{!isNull player};
waitUntil{player == player};

//	Wait for player to get ingame.
waitUntil {!isNull (findDisplay 46)};

//	Setting up our toggle key (Default '-')
#include "include\wh_earplugToggleKey.sqf"

//	Reducing volume if player has set that as default.
if WH_EP_EARPLUGS_DEFAULT then
{	call wh_ep_fnc_earplugInsert	};

//	Updating player eventhandlers for respawning and getting in vehicles.
call wh_ep_fnc_earplugUpdateHandlers;


//------------------------------------------------------------------------------------
//	Adding nametag actions to player.
//------------------------------------------------------------------------------------

//	Add earplug self-interact or addaction.
call wh_ep_fnc_earplugUpdateAction;
