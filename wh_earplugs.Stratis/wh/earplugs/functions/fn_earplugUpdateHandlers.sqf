//====================================================================================
//
//	wh_earplugUpdateHandlers.sqf - Updates eventhandlers for unit respawns and vehicles.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If the earpro system is enabled, set up the Event Handlers.
//------------------------------------------------------------------------------------

if WH_EP_EARPLUGS then
{
	// TODO : TBD : move to own files, they gonna get bigger anyways
	WH_EP_EH_RESPAWN =
	player addEventHandler 
	["Respawn",{ call wh_ep_fnc_earplugUpdateAction; if WH_EP_EARPLUGS_DEFAULT then {call wh_ep_fnc_earplugInsert}; }];
	
	if WH_EP_AUTO_VEHICLES then
	{
		WH_EP_EH_VEHICLEIN =
		player addEventHandler 
		["GetInMan",{ call wh_ep_fnc_earplugInsert; }];
		
		WH_EP_EH_VEHICLEOUT =
		player addEventHandler 
		["GetOutMan",{ if !WH_EP_EARPLUGS_MANUAL then {call wh_ep_fnc_earplugRemove;}; }];
	};
}


//------------------------------------------------------------------------------------
//	If the earpro system is not enabled, destroy the Event Handlers.
//------------------------------------------------------------------------------------

else
{
	if (!isNil "WH_EP_EH_RESPAWN") then
	{ player removeEventHandler WH_EP_EH_RESPAWN };
	
	if (!isNil "WH_EP_EH_VEHICLEIN") then
	{ player removeEventHandler WH_EP_EH_VEHICLEIN };
	
	if (!isNil "WH_EP_EH_VEHICLEOUT") then
	{ player removeEventHandler WH_EP_EH_VEHICLEOUT };
};