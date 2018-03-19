//====================================================================================
//
//	wh_ep_compileHint.sqf - Sets up "put in" and "remove" earplug hints.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If ACE is present, setup the ACE structured text..
//------------------------------------------------------------------------------------

if WH_EP_MOD_ACE then
{
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
	wh_ep_fnc_hint = compileFinal
	"
		_hint = (player getVariable 'WH_EP_EARPLUGS_IN')
		then { 'Earplugs inserted.' }
		else { 'Earplugs removed.' };
		
		hintSilent _hint;
	"
};