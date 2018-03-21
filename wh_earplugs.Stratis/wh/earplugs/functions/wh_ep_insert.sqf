//====================================================================================
//
//	wha_ep_insert.sqf - Function that simulates inserting earpro.
//
//	call wha_ep_fnc_insert;
//
//	Contact: Whale #5963
//
//====================================================================================

// TODO : TBD = Merge with remove, make a toggle with true / false param?

//	Exits if earplugs are already in.
if (player getVariable 'WHA_EP_EARPLUGS_IN') exitWith {};

//	Update global variable.
player setVariable ['WHA_EP_EARPLUGS_IN',true,true];

//	Reduce player sound.
2 fadeSound WHA_EP_SOUNDLEVEL;

//	Update action.
call wha_ep_fnc_updateAction;

//	Alert player with hint.
call wha_ep_fnc_hint;