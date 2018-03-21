//====================================================================================
//
//	wh_ep_updateHandlers.sqf - Updates eventhandlers for unit respawns and vehicles.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If the earpro system is enabled, set up the Event Handlers.
//------------------------------------------------------------------------------------

if WH_EP_EARPLUGS then
{
	// TODO : TBD : move to own files? maybe
	//	If respawn eventhandler is not already present...
	if (isNil "WH_EP_EH_RESPAWN") then
	{
		//	Add a respawn handler with the following code:
		WH_EP_EH_RESPAWN = player addEventHandler ["Respawn",
		{
			//	Re-add the appropriate action (ACE or modless, insert or remove).
			call wh_ep_fnc_updateAction; 
			
			//	Insert the earpro if it's supposed to be in on respawn.
			if WH_EP_DEFAULT then {call wh_ep_fnc_Insert}; 
		}];
	};
	
	//	If the player wants earpro in automatically when entering vehicles...
	if WH_EP_AUTO then
	{
		if (isNil "WH_EP_EH_VEHICLEIN") then
		{ 
			WH_EP_EH_VEHICLEIN = player addEventHandler ["GetInMan",
			{
				_veh = (_this select 2);
				
				//	Check whether the vehicle is in the array of 'earpro' vehicles.
				_vehicleOfType = [_veh, WH_EP_AUTO_VEHICLES] call wh_ep_fnc_vehicleOfType;
				
				//	If it is, insert earpro.
				if _vehicleOfType then { call wh_ep_fnc_insert; };
			}]; 
		};
		
		if (isNil "WH_EP_EH_VEHICLEOUT") then
		{
			//	Automatically remove earpro if the player didn't put it in manually
			//	prior to mounting the vehicle and the vehicle is one that automatically
			//	inserts earpro.
			WH_EP_EH_VEHICLEOUT = player addEventHandler ["GetOutMan",
			{ if !WH_EP_MANUAL then {call wh_ep_fnc_remove;}; }];
		};
	}
	else
	{
		//	Remove vehicle eventhandlers if player does not want auto earpro
		//	and the eventhandlers are present.
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
		WH_EP_EH_VEHICLEOUT = nil;
	};
};