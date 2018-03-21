//====================================================================================
//
//	wha_ep_remove.sqf - Function that simulates removing earpro.
//
//	call wha_ep_fnc_remove;
//
//	Contact: Whale #5963
//
//====================================================================================

//	Exits if earplugs are already out.
if (!(player getVariable 'WHA_EP_EARPLUGS_IN')) exitWith {};

//	Update global variable.
player setVariable ['WHA_EP_EARPLUGS_IN',false,true];

//	Reduce player sound.
2 fadeSound 1;

//	Update action.
call wha_ep_fnc_updateAction;

//	Alert player with hint.
call wha_ep_fnc_hint;