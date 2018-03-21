//====================================================================================
//
//	wha_ep_updateHandlers.sqf - Updates eventhandlers for unit respawns and vehicles.
//
//	Contact: Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If the earpro system is enabled, set up the Event Handlers.
//------------------------------------------------------------------------------------

if WHA_EP_EARPLUGS then
{
	// TODO : TBD : move to own files? maybe
	//	If respawn eventhandler is not already present...
	if (isNil "WHA_EP_EH_RESPAWN") then
	{
		//	Add a respawn handler with the following code:
		WHA_EP_EH_RESPAWN = player addEventHandler ["Respawn",
		{
			//	Re-add the appropriate action (ACE or modless, insert or remove).
			call wha_ep_fnc_updateAction; 
			
			//	Insert the earpro if it's supposed to be in on respawn.
			if WHA_EP_DEFAULT then {call wha_ep_fnc_Insert}; 
		}];
	};
	
	//	If the player wants earpro in automatically when entering vehicles...
	if WHA_EP_AUTO then
	{
		if (isNil "WHA_EP_EH_VEHICLEIN") then
		{ 
			WHA_EP_EH_VEHICLEIN = player addEventHandler ["GetInMan",
			{
				_veh = (_this select 2);
				
				//	Check whether the vehicle is in the array of 'earpro' vehicles.
				_vehicleOfType = [_veh, WHA_EP_AUTO_VEHICLES] call wha_ep_fnc_vehicleOfType;
				
				//	If it is, insert earpro.
				if _vehicleOfType then { call wha_ep_fnc_insert; };
			}]; 
		};
		
		if (isNil "WHA_EP_EH_VEHICLEOUT") then
		{
			//	Automatically remove earpro if the player didn't put it in manually
			//	prior to mounting the vehicle and the vehicle is one that automatically
			//	inserts earpro.
			WHA_EP_EH_VEHICLEOUT = player addEventHandler ["GetOutMan",
			{ if !WHA_EP_MANUAL then {call wha_ep_fnc_remove;}; }];
		};
	}
	else
	{
		//	Remove vehicle eventhandlers if player does not want auto earpro
		//	and the eventhandlers are present.
		if (!isNil "WHA_EP_EH_VEHICLEIN") then
		{
			player removeEventHandler ["GetInMan",WHA_EP_EH_VEHICLEIN];
			WHA_EP_EH_VEHICLEIN = nil;
		};
	
		if (!isNil "WHA_EP_EH_VEHICLEOUT") then
		{
			player removeEventHandler ["GetOutMan",WHA_EP_EH_VEHICLEOUT];
			WHA_EP_EH_VEHICLEOUT = nil;
		};
	};
}


//------------------------------------------------------------------------------------
//	If the earpro system is not enabled, destroy the Event Handlers.
//------------------------------------------------------------------------------------

else
{
	if (!isNil "WHA_EP_EH_RESPAWN") then
	{
		player removeEventHandler ["Respawn",WHA_EP_EH_RESPAWN];
		WHA_EP_EH_RESPAWN = nil;
	};
	
	if (!isNil "WHA_EP_EH_VEHICLEIN") then
	{
		player removeEventHandler ["GetInMan",WHA_EP_EH_VEHICLEIN];
		WHA_EP_EH_VEHICLEIN = nil;
	};
	
	if (!isNil "WHA_EP_EH_VEHICLEOUT") then
	{
		player removeEventHandler ["GetOutMan",WHA_EP_EH_VEHICLEOUT];
		WHA_EP_EH_VEHICLEOUT = nil;
	};
};