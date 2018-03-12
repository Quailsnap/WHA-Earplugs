//====================================================================================
//
//	wh_earplugBriefing.sqf - Adds a briefing describing WH earplug features.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Construct a briefing depending on present settings.
//------------------------------------------------------------------------------------

//	Emergency exit if briefing is toggled off.
if !WH_EP_SHOWBRIEF exitWith {};

//	Begin constructing string that will be added as briefing.
_briefingString = 
format ["<br/><font size='18'>WH EARPLUGS</font><br/><br/>
WH earplugs are enabled in this mission.<br/>Currently they are, by default, %1.<br/>",
["out","in"] select WH_EP_EARPLUGS_DEFAULT];

//	Only add the part mentioning the toggle key if a toggle key exists.
if WH_EP_TOGGLE then
{ 
	_briefingString = _briefingString + 
	format["You can toggle the earplugs in and out with %1.<br/>",WH_EP_TOGGLE_NAME];
};

//	Mention current sound level.
_briefingString = _briefingString + 
format["By default the sound reduction is %1 (out of 1.0).<br/>",WH_EP_SOUNDLEVEL];

//	If auto earplugs in vehicles is enabled, mention it.
if WH_EP_AUTO_VEHICLES then
{
	_briefingString = _briefingString + 
	"Earplugs will be automatically put in when you enter a vehicle.<br/>";
};

//	If CBA is present, mention the addons option menu.
if WH_EP_MOD_CBA then
{
	_briefingString = _briefingString + 
	"A menu with configurable options for each player is available under ESC > OPTIONS > ADDON OPTIONS.<br/>";
}
//	If it isn't, mention the briefing options menu.
else
{
	_briefingString = _briefingString + 
	"A menu with configurable options for each player is available beneath this briefing.
	For additional customization, use the Community Base Addons mod.<br/><br/>";
};


//------------------------------------------------------------------------------------
//	If CBA is not present, add a settings menu under the briefing.
//------------------------------------------------------------------------------------

//	Check CBA presence.

if !WH_EP_MOD_CBA then
{
	//--------------------------------------------------------------------------------
	//	Add briefing settings menu.
	//--------------------------------------------------------------------------------

	//	Horizontal separator between brief and settings menu.
	_briefingString = _briefingString + "____________________<br/><br/>";
	_briefingString = _briefingString + "<font size='18'>SETTINGS</font><br/><br/>";
	
	_briefingString = _briefingString + "EARPLUG STATE:   ( <execute expression=""call wh_ep_fnc_earplugInsert;WH_EP_EARPLUGS_MANUAL=true;"">IN</execute> / <execute expression=""call wh_ep_fnc_earplugRemove;WH_EP_EARPLUGS_MANUAL=false;"">OUT</execute> ) 
	<br/>Toggle your earplugs.<br/><br/>";
	
	_briefingString = _briefingString + "DEFAULT STATE:   ( <execute expression=""hintsilent 'Earplugs will be in by default.';WH_EP_EARPLUGS_DEFAULT=true;profileNamespace setVariable ['WH_EP_EARPLUGS_DEFAULT',true];saveProfileNamespace;call wh_ep_fnc_earplugUpdateHandlers;"">YES</execute> / <execute expression=""hintsilent 'Earplugs will be in by default.';WH_EP_EARPLUGS_DEFAULT=false;profileNamespace setVariable ['WH_EP_EARPLUGS_DEFAULT',false];saveProfileNamespace;call wh_ep_fnc_earplugUpdateHandlers;"">NO</execute> ) 
	( Default: NO )
	<br/>Will your earplugs be in at mission start and upon respawn?<br/><br/>";
	
	_briefingString = _briefingString + "EARPLUG ACTION:   ( <execute expression=""hintsilent 'Earplugs action will be shown.';WH_EP_EARPLUGS_ACTION=true;profileNamespace setVariable ['WH_EP_EARPLUGS_ACTION',true];saveProfileNamespace;call wh_ep_fnc_earplugUpdateAction;"">SHOW</execute> / <execute expression=""hintsilent 'Earplug action will be hidden after inserting and removing.';WH_EP_EARPLUGS_ACTION=false;profileNamespace setVariable ['WH_EP_EARPLUGS_ACTION',false];saveProfileNamespace;"">HIDE</execute> ) 
	( Default: SHOW )
	<br/>Should we give you an menu action to toggle your earplugs at will?<br/><br/>";
	
	_briefingString = _briefingString + "SOUND LEVEL:   ( 
	<execute expression=""hintsilent 'Sound level will be 20% when plugs are in.';WH_EP_SOUNDLEVEL=0.2;profileNamespace setVariable ['WH_EP_SOUNDLEVEL',0.2];saveProfileNamespace;"">20%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 40% when plugs are in.';WH_EP_SOUNDLEVEL=0.4;profileNamespace setVariable ['WH_EP_SOUNDLEVEL',0.4];saveProfileNamespace;"">40%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 50% when plugs are in.';WH_EP_SOUNDLEVEL=0.5;profileNamespace setVariable ['WH_EP_SOUNDLEVEL',0.5];saveProfileNamespace;"">50%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 60% when plugs are in.';WH_EP_SOUNDLEVEL=0.6;profileNamespace setVariable ['WH_EP_SOUNDLEVEL',0.6];saveProfileNamespace;"">60%</execute> / 
	<execute expression=""hintsilent 'Sound level will be 80% when plugs are in.';WH_EP_SOUNDLEVEL=0.8;profileNamespace setVariable ['WH_EP_SOUNDLEVEL',0.8];saveProfileNamespace;"">80%</execute> ) 
	( Default: 40% )
	<br/>What percentage of the original should the dampened sound be?<br/><br/>";
	
	_briefingString = _briefingString + "VEHICLE PLUGS:   ( <execute expression=""hintsilent 'Earplugs will be automatically put in when entering vehicles.';WH_EP_AUTO_VEHICLES=true;profileNamespace setVariable ['WH_EP_AUTO_VEHICLES',true];saveProfileNamespace;call wh_ep_fnc_earplugUpdateHandlers;"">YES</execute> / <execute expression=""hintsilent 'Earplug state will not be affected when entering vehicles.';WH_EP_AUTO_VEHICLES=false;profileNamespace setVariable ['WH_EP_AUTO_VEHICLES',false];saveProfileNamespace;call wh_ep_fnc_earplugUpdateHandlers;"">NO</execute> ) 
	( Default: YES )
	<br/>Do you want plugs automatically put in when entering vehicles?<br/><br/>";
	
	_briefingString = _briefingString + "TOGGLE KEY:   ( <execute expression=""hintsilent format['Earplugs can be toggled in and out with your %1 key. This will require a mission restart to take effect.',WH_EP_TOGGLE_NAME];WH_EP_TOGGLE=true;profileNamespace setVariable ['WH_EP_TOGGLE',true];saveProfileNamespace;call wh_ep_fnc_earplugUpdateAction;"">YES</execute> / <execute expression=""hintsilent format['The %1 key will not be used for earplugs. This will require a mission restart to take effect.',WH_EP_TOGGLE_NAME];WH_EP_TOGGLE=false;profileNamespace setVariable ['WH_EP_TOGGLE',false];saveProfileNamespace;"">NO</execute> ) 
	( Default: YES )" +
	format['<br/>Do you want the %1 key to be used to quickly put in or remove earplugs?<br/><br/>',WH_EP_TOGGLE_NAME];
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
{	player createDiarySubject ["whscripts","WH Scripts"];	};

player createDiaryRecord ["whscripts", ["WH Earplugs",_briefingString]];