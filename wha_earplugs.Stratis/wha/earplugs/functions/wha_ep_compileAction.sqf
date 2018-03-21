//====================================================================================
//
//	wha_ep_compileAction.sqf - Sets up "put in" and "remove" earplug actions.
//
//	Contact: Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Parameters:
//	1. _acePresent (BOOL) - Presence of ACE addon in mission. Default: false
//------------------------------------------------------------------------------------

params [["_acePresent",false]];


//------------------------------------------------------------------------------------
//	If ACE is present, setup the ACE self-interact actions.
//------------------------------------------------------------------------------------

if _acePresent then
{

//	Action definition for putting in the earplugs.
WHA_EP_ACT_INSERTPLUGS = 
[
	"earplugs",	// Variable name.
	"Insert Earplugs",	// Title to be displayed.
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",	// Icon in menus.
	{ WHA_EP_MANUAL = true; call wha_ep_fnc_insert; },	// Code run upon use.
	{true}	// Condition required to be useable.
] call ace_interact_menu_fnc_createAction;

//	Action definition for removing earplugs.
WHA_EP_ACT_REMOVEPLUGS = 
[
	"earplugs",	// Variable name.
	"Remove Earplugs",	// Title to be displayed.
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Icon in menus.
	{ WHA_EP_MANUAL = false; call wha_ep_fnc_remove; },	// Code run upon use.
	{true}	// Condition required to be useable.
] call ace_interact_menu_fnc_createAction;

//	Save code that will toggle actions.
//	CompileFinal evaluates string code expressions
wha_ep_fnc_updateAction = compileFinal
"
	if (!(player getVariable 'WHA_EP_EARPLUGS_IN')) then
	{
		[player, 1,['ACE_SelfActions','ACE_Equipment','earplugs']] call ace_interact_menu_fnc_removeActionFromObject;

		if (WHA_EP_EARPLUGS && {WHA_EP_ACTION}) then
		{ [player, 1, ['ACE_SelfActions','ACE_Equipment'], WHA_EP_ACT_INSERTPLUGS] call ace_interact_menu_fnc_addActionToObject; };
	}
	else
	{
		[player, 1,['ACE_SelfActions','ACE_Equipment','earplugs']] call ace_interact_menu_fnc_removeActionFromObject;
		[player, 1, ['ACE_SelfActions','ACE_Equipment'], WHA_EP_ACT_REMOVEPLUGS] call ace_interact_menu_fnc_addActionToObject;
	};
"
}


//------------------------------------------------------------------------------------
//	Otherwise, setup vanilla addActions.
//------------------------------------------------------------------------------------

else
{
//	Save code that will toggle actions.
//	CompileFinal evaluates string code expressions
wha_ep_fnc_updateAction = compileFinal
"
	if (!(player getVariable 'WHA_EP_EARPLUGS_IN')) then
	{
		if (!isNil 'WHA_EP_ACT') then { player removeAction WHA_EP_ACT; };
		
		if (WHA_EP_EARPLUGS && {WHA_EP_ACTION}) then
		{ WHA_EP_ACT = player addAction [WHA_EP_ACTION_IN,{ WHA_EP_MANUAL = true; call wha_ep_fnc_insert; }, [], 0.5, false]; };
	}
	else
	{
		if (!isNil 'WHA_EP_ACT') then { player removeAction WHA_EP_ACT; };
		
		if (WHA_EP_ACTION) then
		{ WHA_EP_ACT = player addAction [WHA_EP_ACTION_OUT, { WHA_EP_MANUAL = false; call wha_ep_fnc_remove; }, [], 0.5, false]; };
	};
"
};