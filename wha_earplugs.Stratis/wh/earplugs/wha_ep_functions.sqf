// ====================================================================================
//
//	wha_ep_functions.sqf - Compiles functions for Whale's earpro script.
//
//	Contact: Whale #5963
//
// ====================================================================================

//-------------------------------------------------------------------------------------
//	Parameters:
//	1. _acePresent (BOOL) - Presence of ACE addon in mission. Default: false
//-------------------------------------------------------------------------------------

params [["_acePresent",false]];


//-------------------------------------------------------------------------------------
//	Preprocess and compile static functions.
//-------------------------------------------------------------------------------------

//	Preprocessor shortcut for compiling a function and permanently saving it.
#define COMPILE_FINAL compileFinal preprocessFileLineNumbers

//	Establishing functions.
wha_ep_fnc_insert = COMPILE_FINAL "wha\earplugs\functions\wha_ep_insert.sqf";
wha_ep_fnc_remove = COMPILE_FINAL "wha\earplugs\functions\wha_ep_remove.sqf";
wha_ep_fnc_updateHandlers = COMPILE_FINAL "wha\earplugs\functions\wha_ep_updateHandlers.sqf";
wha_ep_fnc_vehicleOfType = COMPILE_FINAL "wha\earplugs\functions\wha_ep_vehicleOfType.sqf";


//-------------------------------------------------------------------------------------
//	Preprocess and compile functions that vary depending on mod presence.
//-------------------------------------------------------------------------------------

//	Preprocessor shortcut for compiling and running code once without saving.
//	Used because all the compiling is done within the files below.
#define CALL_NOSAVE call compile preprocessFileLineNumbers

//	Construct hint system based on presence of ACE.
//	Compilation takes place within the file. TODO : TBD : Don't do this.
[_acePresent] CALL_NOSAVE "wha\earplugs\functions\wha_ep_compileHint.sqf";

//	Construct & compile action system based on presence of ACE.
//	Compilation takes place within the file. TODO : TBD : Don't do this.
[_acePresent] CALL_NOSAVE "wha\earplugs\functions\wha_ep_compileAction.sqf";