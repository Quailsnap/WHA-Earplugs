//====================================================================================
//
//	wh_ep_insert.sqf - Function that simulates inserting earpro.
//
//	call wh_ep_fnc_insert;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

// TODO : TBD = Merge with remove, make a toggle with true / false param?

//	Emergency exit.
if (player getVariable 'WH_EP_EARPLUGS_IN') exitWith {};

//	Update global variable.
player setVariable ['WH_EP_EARPLUGS_IN',true,true];

//	Reduce player sound.
2 fadeSound WH_EP_SOUNDLEVEL;

//	Update action.
call wh_ep_fnc_updateAction;

//	Alert player with hint.
call wh_ep_fnc_hint;