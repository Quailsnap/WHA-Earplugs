//====================================================================================
//
//	wh_earplugUpdateHandlers.sqf - Updates eventhandlers for unit respawns and vehicles.
//									Featuring your favorite redundancy protection.
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
	if (isNil "WH_EP_EH_RESPAWN") then
	{
		WH_EP_EH_RESPAWN =
		player addEventHandler 
		["Respawn",
		{
			call wh_ep_fnc_earplugUpdateAction; 
			if WH_EP_EARPLUGS_DEFAULT then {call wh_ep_fnc_earplugInsert}; 
		}];
	};
	
	if WH_EP_AUTO_VEHICLES then
	{
		if (isNil "WH_EP_EH_VEHICLEIN") then
		{ 
			WH_EP_EH_VEHICLEIN = player addEventHandler 
			["GetInMan",{ call wh_ep_fnc_earplugInsert; }]; 
		};
		
		if (isNil "WH_EP_EH_VEHICLEOUT") then
		{
			WH_EP_EH_VEHICLEOUT = player addEventHandler 
			["GetOutMan",{ if !WH_EP_EARPLUGS_MANUAL then {call wh_ep_fnc_earplugRemove;}; }];
		};
	}
	else
	{
		if (!isNil "WH_EP_EH_VEHICLEIN") then
		{
			player removeEventHandler ["GetInMan",WH_EP_EH_VEHICLEIN];
			WH_EP_EH_VEHICLEIN = nil;
		};
	
		if (!isNil "WH_EP_EH_VEHICLEOUT") then
		{
			player removeEventHandler ["GetOutMan",WH_EP_EH_VEHICLEOUT];
			WH_EP_EH_VEHICLEOUT = nil;
		};
	};
}


//------------------------------------------------------------------------------------
//	If the earpro system is not enabled, destroy the Event Handlers.
//------------------------------------------------------------------------------------

else
{
	if (!isNil "WH_EP_EH_RESPAWN") then
	{
		player removeEventHandler ["Respawn",WH_EP_EH_RESPAWN];
		WH_EP_EH_RESPAWN = nil;
	};
	
	if (!isNil "WH_EP_EH_VEHICLEIN") then
	{
		player removeEventHandler ["GetInMan",WH_EP_EH_VEHICLEIN];
		WH_EP_EH_VEHICLEIN = nil;
	};
	
	if (!isNil "WH_EP_EH_VEHICLEOUT") then
	{
		player removeEventHandler ["GetOutMan",WH_EP_EH_VEHICLEOUT];
		WH_EP_EH_VEHICLOUT = nil;
	};
};