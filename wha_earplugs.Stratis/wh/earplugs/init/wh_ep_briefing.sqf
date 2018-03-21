//====================================================================================
//
//	wha_ep_briefing.sqf - Adds a briefing describing WHA earplug features.
//
//	Contact: Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Parameters:
//	1. _cbaPresent (BOOL) - Presence of CBA addon in mission. Default: false
//------------------------------------------------------------------------------------

params [["_cbaPresent",false]];


//------------------------------------------------------------------------------------
//	Construct a briefing depending on present settings.
//------------------------------------------------------------------------------------

//	Emergency exit if briefing is toggled off.
if !WHA_EP_SHOWBRIEF exitWith {};

//	Begin constructing string that will be added as briefing.
_briefingString = 
format ["<br/><font size='18'>WHA EARPLUGS</font><br/><br/>
WHA earplugs are enabled in this mission.<br/>Currently they are, by default, %1.<br/>",
["out","in"] select WHA_EP_DEFAULT];

//	Only add the part mentioning the toggle key if a toggle key exists.
if WHA_EP_TOGGLE then
{ 
	if !_cbaPresent then
	{
		_briefingString = _briefingString + 
		format["You can toggle the earplugs in and out with %1.<br/>",WHA_EP_TOGGLE_NAME];
	}
	else
	{
		_briefingString = _briefingString + 
		"You can toggle the earplugs in and out with a keypress set under ESC > OPTIONS > CONTROLS > CONFIGURE ADDONS > WHA EARPLUGS.<br/>A hold-to-deafen key is also configurable there.<br/>";
	};
};

//	Mention current sound level.
_briefingString = _briefingString + 
format["By default the sound reduction is %1 (out of 1.0).<br/>",WHA_EP_SOUNDLEVEL];

//	If auto earplugs in vehicles is enabled, mention it.
if WHA_EP_AUTO then
{
	_briefingString = _briefingString + 
	"Earplugs will be automatically put in when you enter a vehicle.<br/>";
};

//	If CBA is present, mention the addons option menu.
if _cbaPresent then
{
	_briefingString = _briefingString + 
	"A menu with configurable options for each player is available under ESC > OPTIONS > ADDON OPTIONS > WHA EARPLUGS.<br/>";
}
//	If it isn't, mention the briefing options menu.
else
{
	_briefingString = _briefingString + 
	"A menu with configurable options for each player is available beneath this briefing.<br/>For additional customization, use the Community Base Addons mod.<br/>";
};


//------------------------------------------------------------------------------------
//	If CBA is not present, add a settings menu under the briefing.
//------------------------------------------------------------------------------------

//	Check CBA presence.

if !_cbaPresent then
{
	//--------------------------------------------------------------------------------
	//	Add briefing settings menu.
	//--------------------------------------------------------------------------------

	//	Horizontal separator between brief and settings menu.
	_briefingString = _briefingString + "____________________<br/><br/>";
	_briefingString = _briefingString + "<font size='18'>SETTINGS</font><br/><br/>";
	
	_briefingString = _briefingString + "EARPLUG STATE:   ( <execute expression=""call wha_ep_fnc_insert;WHA_EP_MANUAL=true;"">IN</execute> / <execute expression=""call wha_ep_fnc_remove;WHA_EP_MANUAL=false;"">OUT</execute> ) 
	<br/>Toggle your earplugs.<br/><br/>";
	
	_briefingString = _briefingString + "DEFAULT STATE:   ( <execute expression=""hintsilent 'Earplugs will be in by default.';WHA_EP_DEFAULT=true;profileNamespace setVariable ['WHA_EP_DEFAULT',true];saveProfileNamespace;call wha_ep_fnc_updateHandlers;"">YES</execute> / <execute expression=""hintsilent 'Earplugs will be out by default.';WHA_EP_DEFAULT=false;profileNamespace setVariable ['WHA_EP_DEFAULT',false];saveProfileNamespace;call wha_ep_fnc_updateHandlers;"">NO</execute> ) 
	( Default: NO )
	<br/>Will your earplugs be in at mission start and upon respawn?<br/><br/>";
	
	_briefingString = _briefingString + "EARPLUG ACTION:   ( <execute expression=""hintsilent 'Earplugs action will be shown.';WHA_EP_ACTION=true;profileNamespace setVariable ['WHA_EP_ACTION',true];saveProfileNamespace;call wha_ep_fnc_updateAction;"">SHOW</execute> / <execute expression=""hintsilent 'Earplug action will be hidden.';WHA_EP_ACTION=false;profileNamespace setVariable ['WHA_EP_ACTION',false];saveProfileNamespace;if (!isNil 'WHA_EP_ACT') then { player removeAction WHA_EP_ACT; };"">HIDE</execute> ) 
	( Default: SHOW )
	<br/>Should we give you an menu action to toggle your earplugs at will?<br/><br/>";
	
	_briefingString = _briefingString + "SOUND LEVEL:   ( 
	<execute expression=""hintsilent 'Sound level will be 20% when plugs are in. You must put in the plugs again for this to take effect.';WHA_EP_SOUNDLEVEL=0.2;profileNamespace setVariable ['WHA_EP_SOUNDLEVEL',0.2];saveProfileNamespace;"">20%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 40% when plugs are in. You must put in the plugs again for this to take effect.';WHA_EP_SOUNDLEVEL=0.4;profileNamespace setVariable ['WHA_EP_SOUNDLEVEL',0.4];saveProfileNamespace;"">40%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 50% when plugs are in. You must put in the plugs again for this to take effect.';WHA_EP_SOUNDLEVEL=0.5;profileNamespace setVariable ['WHA_EP_SOUNDLEVEL',0.5];saveProfileNamespace;"">50%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 60% when plugs are in. You must put in the plugs again for this to take effect.';WHA_EP_SOUNDLEVEL=0.6;profileNamespace setVariable ['WHA_EP_SOUNDLEVEL',0.6];saveProfileNamespace;"">60%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 80% when plugs are in. You must put in the plugs again for this to take effect.';WHA_EP_SOUNDLEVEL=0.8;profileNamespace setVariable ['WHA_EP_SOUNDLEVEL',0.8];saveProfileNamespace;"">80%</execute> ) 
	( Default: 50% )
	<br/>What percentage of the original should the dampened sound be?<br/><br/>";
	
	_briefingString = _briefingString + "VEHICLE PLUGS:   ( <execute expression=""hintsilent 'Earplugs will be automatically put in when entering vehicles.';WHA_EP_AUTO=true;profileNamespace setVariable ['WHA_EP_AUTO',true];saveProfileNamespace;call wha_ep_fnc_updateHandlers;"">YES</execute> / <execute expression=""hintsilent 'Earplug state will not be affected when entering vehicles.';WHA_EP_AUTO=false;profileNamespace setVariable ['WHA_EP_AUTO',false];saveProfileNamespace;call wha_ep_fnc_updateHandlers;"">NO</execute> ) ( Default: YES )<br/>
	
	( 
	<execute expression=""hintsilent 'Earplugs will be automatically put in when entering all vehicles, including static weapons.';WHA_EP_AUTO_VEHICLES=['Tank','Helicopter','Car','Plane','Ship','StaticWeapon'];profileNamespace setVariable ['WHA_EP_AUTO_VEHICLES',['Tank','Helicopter','Car','Plane','Ship','StaticWeapon']];saveProfileNamespace;"">ALL VEHICLES</execute> / 
	<execute expression=""hintsilent 'Earplugs will be automatically put in when entering all vehicles except static weapons.';WHA_EP_AUTO_VEHICLES=['Tank','Helicopter','Car','Plane','Ship'];profileNamespace setVariable ['WHA_EP_AUTO_VEHICLES',['Tank','Helicopter','Car','Plane','Ship']];saveProfileNamespace;"">ALL EXCEPT TURRETS</execute> / 
	<execute expression=""hintsilent 'Earplugs will be automatically put in when entering tanks, planes, or helicopters.';WHA_EP_AUTO_VEHICLES=['Tank','Helicopter','Plane'];profileNamespace setVariable ['WHA_EP_AUTO_VEHICLES',['Tank','Helicopter','Plane']];saveProfileNamespace;"">TANKS AND AIR</execute> / 
	<execute expression=""hintsilent 'Earplugs will be automatically put in when entering air vehicles.';WHA_EP_AUTO_VEHICLES=['Helicopter','Plane'];profileNamespace setVariable ['WHA_EP_AUTO_VEHICLES',['Helicopter','Plane']];saveProfileNamespace;"">ALL AIR</execute> / 
	<execute expression=""hintsilent 'Earplugs will be automatically put in when entering jets.';WHA_EP_AUTO_VEHICLES=['Plane'];profileNamespace setVariable ['WHA_EP_AUTO_VEHICLES',['Plane']];saveProfileNamespace;"">PLANES ONLY</execute> 
	) <br/>
	
	Do you want plugs automatically put in when entering vehicles?<br/>
	Also, which vehicles do you want to automatically use plugs?<br/><br/>";
	
	_briefingString = _briefingString + "TOGGLE KEY:   ( <execute expression=""hintsilent format['Earplugs can be toggled in and out with your %1 key.',WHA_EP_TOGGLE_NAME];WHA_EP_TOGGLE=true;[false] call compile preprocessFileLineNumbers 'wha\earplugs\init\wha_ep_toggleKey.sqf';profileNamespace setVariable ['WHA_EP_TOGGLE',true];saveProfileNamespace;"">YES</execute> / <execute expression=""hintsilent format['The %1 key will not be used for earplugs.',WHA_EP_TOGGLE_NAME];WHA_EP_TOGGLE=false;call compile preprocessFileLineNumbers 'wha\earplugs\init\wha_ep_toggleKeyDestroy.sqf';profileNamespace setVariable ['WHA_EP_TOGGLE',false];saveProfileNamespace;"">NO</execute> ) 
	( Default: NO )" +
	format['<br/>Do you want the %1 key to be used to quickly put in or remove earplugs?<br/><br/>',WHA_EP_TOGGLE_NAME];
};


//------------------------------------------------------------------------------------
//	Add a debug menu regardless of CBA presence. ( TBD : TODO )
//------------------------------------------------------------------------------------

// Reset Action


// Restart System


//	Reset Settings


//------------------------------------------------------------------------------------
//	Add briefing to map screen.
//------------------------------------------------------------------------------------

if !(player diarySubjectExists "whscripts") then
{	player createDiarySubject ["whscripts","WHA Scripts"];	};

player createDiaryRecord ["whscripts", ["WHA Earplugs",_briefingString]];