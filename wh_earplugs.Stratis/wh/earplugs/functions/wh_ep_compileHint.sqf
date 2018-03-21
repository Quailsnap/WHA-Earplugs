//====================================================================================
//
//	wh_ep_compileHint.sqf - Sets up "put in" and "remove" earplug hints.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Parameters:
//	1. _acePresent (BOOL) - Presence of ACE addon in mission. Default: false
//------------------------------------------------------------------------------------

params [["_acePresent",false]];


//------------------------------------------------------------------------------------
//	If ACE is present, setup the ACE structured text..
//------------------------------------------------------------------------------------

if _acePresent then
{
	//	CompileFinal evaluates string code expressions
	wh_ep_fnc_hint = compileFinal
	"
		_hint = if (player getVariable 'WH_EP_EARPLUGS_IN')
		then { 'Earplugs inserted.' }
		else { 'Earplugs removed.' };

		_hint call ace_common_fnc_displayTextStructured;
	"
}


//------------------------------------------------------------------------------------
//	Otherwise, setup vanilla hints.
//------------------------------------------------------------------------------------

else
{
	//	CompileFinal evaluates string code expressions
	wh_ep_fnc_hint = compileFinal
	"
		_hint = if (player getVariable 'WH_EP_EARPLUGS_IN')
		then { 'Earplugs inserted.' }
		else { 'Earplugs removed.' };

		hintSilent _hint;
	"
};