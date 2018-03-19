//====================================================================================
//
//	wh_ep_remove.sqf - Function that simulates removing earpro.
//
//	call wh_ep_fnc_remove;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//	Emergency exit.
if (!(player getVariable 'WH_EP_EARPLUGS_IN')) exitWith {};

//	Update global variable.
player setVariable ['WH_EP_EARPLUGS_IN',false,true];

//	Reduce player sound.
2 fadeSound 1;

//	Update action.
call wh_ep_fnc_updateAction;

//	Alert player with hint.
call wh_ep_fnc_hint;