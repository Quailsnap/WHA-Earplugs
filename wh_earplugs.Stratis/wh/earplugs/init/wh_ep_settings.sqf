//====================================================================================
//
//	wha_ep_settings.sqf - Imports settings if CBA is not present, sets up a 
//							briefing settings interface if it is.
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
//	If CBA is not present, get saved settings from player profile.
//------------------------------------------------------------------------------------

if !_cbaPresent then
{
	//	Var for whether earpro should be in by default.
	WHA_EP_DEFAULT = profileNamespace getVariable ["WHA_EP_DEFAULT",WHA_EP_DEFAULT];

	//	Var for whether earpro action should be shown.
	WHA_EP_ACTION = profileNamespace getVariable ["WHA_EP_ACTION",WHA_EP_ACTION];
	
	//	Var for amount of sound reduction having earpro in gives.
	WHA_EP_SOUNDLEVEL = profileNamespace getVariable ["WHA_EP_SOUNDLEVEL",WHA_EP_SOUNDLEVEL];
	
	//	Var for whether earpro should be automatically put in upon entering vehicles.
	WHA_EP_AUTO = profileNamespace getVariable ["WHA_EP_AUTO",WHA_EP_AUTO];
	
	//	Var for which vehicles earpro should be automatically put in for.
	WHA_EP_AUTO_VEHICLES = profileNamespace getVariable ["WHA_EP_AUTO_VEHICLES",WHA_EP_AUTO_VEHICLES];
	
	//	Var for whether there should be a toggleKey (default "-") for earpro.
	WHA_EP_TOGGLE = profileNamespace getVariable ["WHA_EP_TOGGLE",WHA_EP_TOGGLE];
}


//------------------------------------------------------------------------------------
//	If CBA is present, set up settings interface.
//------------------------------------------------------------------------------------

else
{
	//	Setting for whether plugs should be automatically put in when entering vehicles.
	[
		"WHA_EP_AUTO",		// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Vehicle Earplugs", 		// Name shown in menu.
		"WHA Earplugs", 				// Category shown in menu.
		WHA_EP_AUTO, 		// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ call wha_ep_fnc_updateHandlers; }
	] call CBA_Settings_fnc_init;

	//	Which vehicles to apply automatic plugs to.
	[
		"WHA_EP_AUTO_VEHICLES",		// Internal setting name and value set.
		"LIST", 					// Setting type.
		"Which Vehicles?", 			// Name shown in menu.
		"WHA Earplugs", 				// Category shown in menu.
		[
			[WHA_EP_AUTO_VEHICLES,['Tank','Helicopter','Car','Plane','Ship','StaticWeapon'],['Tank','Helicopter','Car','Plane','Ship'],['Tank','Helicopter','Plane'],['Helicopter','Plane'],['Plane']],
			["Default","All Vehicles","All Except Turrets","Tanks and Air","Helicopters and Planes","Just Planes"],
			0
		] 							// Setting type-specific data.
									// Executed at mission start and every change.
	] call CBA_Settings_fnc_init;

	//	Setting for whether plugs should be in at mission start / respawns.
	[
		"WHA_EP_DEFAULT",	// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Plugs at Mission Start", 	// Name shown in menu.
		"WHA Earplugs", 				// Category shown in menu.
		WHA_EP_DEFAULT, 	// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ call wha_ep_fnc_updateHandlers; }
	] call CBA_Settings_fnc_init;

	//	Setting for whether plugs should be in at mission start / respawns.
	[
		"WHA_EP_ACTION",	// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Show Earplug Action", 		// Name shown in menu.
		"WHA Earplugs", 				// Category shown in menu.
		WHA_EP_ACTION, 		// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{
			if WHA_EP_ACTION then { call wha_ep_fnc_updateAction; }
			else
			//	Attempt to remove action
			{
				// TODO : TBD : Functions for removing action, maybe make addon detection global again?
				// Detect if ACE action
				if (isClass (configFile >> "CfgPatches" >> "ace_common"))
				then { [player, 1,['ACE_SelfActions','ACE_Equipment','earplugs']] call ace_interact_menu_fnc_removeActionFromObject; }
				// If not, vanilla removal
				else { if (!isNil 'WHA_EP_ACT') then { player removeAction WHA_EP_ACT; }; };
			};
		}
	] call CBA_Settings_fnc_init;
	
	//	Setting to dynamically alter sound level.
	[
		"WHA_EP_SOUNDLEVEL",			// Internal setting name and value set.
		"SLIDER", 					// Setting type.
		"Sound Level", 				// Name shown in menu.
		"WHA Earplugs", 				// Category shown in menu.
		[0.1, 0.9, WHA_EP_SOUNDLEVEL, 2]// Setting type-specific data.
	] call CBA_Settings_fnc_init;
};