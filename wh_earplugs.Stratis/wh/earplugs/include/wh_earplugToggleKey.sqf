//====================================================================================
//
//	wh_earplugActionKey.sqf - Sets up a key that can be used to toggle plugs with a press.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Setup the Action Key, default '-'.
//------------------------------------------------------------------------------------

//	None of this will execute if the actionkey line in CONFIG is commented out.
if (!isNil "WH_EP_TOGGLEKEY") then
{
	WH_EP_TOGGLEKEY_KEY = (actionKeys WH_EP_TOGGLEKEY) select 0;// This key, a global variable.
	WH_EP_TOGGLEKEY_KEYNAME = actionKeysNames WH_EP_TOGGLEKEY;	// Which is named this...
	
	//	Function that will determine when the disableKey is depressed.
	WH_EP_KEYDOWN = 
	{
		_key = _this select 1;
		_handled = false;
		if(_key == WH_EP_TOGGLEKEY_KEY) then
		{
			if !WH_EP_EARPLUGS_IN 
			then { call wh_ep_fnc_earplugInsert }
			else { call wh_ep_fnc_earplugRemove };
			
			_handled = true;
		};
		_handled;
	};

	//	Function that will determine when the disableKey is released.
	WH_EP_KEYUP = 
	{
		_key = _this select 1;
		_handled = false;
		if(_key == WH_EP_TOGGLEKEY_KEY) then
		{
			_handled = true;
		};
		_handled;
	};
	
	//	Add eventhandlers (functions above).
	(findDisplay 46) displayAddEventHandler   ["keydown", "_this call WH_EP_KEYDOWN"];
	(findDisplay 46) displayAddEventHandler   ["keyup", "_this call WH_EP_KEYUP"];
};