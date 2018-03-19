// ====================================================================================
//
//	wh_ep_functions.sqf - Compiles functions for Whale's earpro script.
//
//	@ /u/Whalen207 | Whale #5963
//
// ====================================================================================

//---------------------------------------------------------------------------------------
//	Preprocess and compile static functions.
//---------------------------------------------------------------------------------------

//	Preprocessor shortcut for compiling a function and permanently saving it.
#define COMPILE_FINAL compileFinal preprocessFileLineNumbers

//	Establishing functions.
wh_ep_fnc_insert = COMPILE_FINAL "wh\earplugs\functions\wh_ep_insert.sqf";
wh_ep_fnc_remove = COMPILE_FINAL "wh\earplugs\functions\wh_ep_remove.sqf";
wh_ep_fnc_updateHandlers = COMPILE_FINAL "wh\earplugs\functions\wh_ep_updateHandlers.sqf";
wh_ep_fnc_vehicleOfType = COMPILE_FINAL "wh\earplugs\functions\wh_ep_vehicleOfType.sqf";


//---------------------------------------------------------------------------------------
//	Preprocess and compile functions that vary depending on mod presence.
//---------------------------------------------------------------------------------------

//	Preprocessor shortcut for compiling and running code once without saving.
//	Used because all the compiling is done within the files below.
#define CALL_NOSAVE call compile preprocessFileLineNumbers

//	Construct & compile hint system based on presence of ACE.
CALL_NOSAVE "wh\earplugs\functions\wh_ep_compileHint.sqf";

//	Construct & compile action system based on presence of ACE.
CALL_NOSAVE "wh\earplugs\functions\wh_ep_compileAction.sqf";