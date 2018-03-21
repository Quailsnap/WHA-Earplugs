//=======================================================================================
//
//	wh_ep_CONFIG.sqf - Contains configurable values for WH earplugs.
//
//	Note:	Many of these settings may be altered by individual clients to their taste
//			via the CBA settings or briefing menu. If they are using the briefing menu,
//			and change their settings, they not be reminded of what is set here as default.
//
//	@ /u/Whalen207 | Whale #5963
//
//=======================================================================================

//---------------------------------------------------------------------------------------
//	Configuration Values. Feel free to modify.
//---------------------------------------------------------------------------------------

// Config Value					// Description							(Default Value)

WH_EP_EARPLUGS = true;			// Enable or disable the earplugs system.		(true)

WH_EP_SOUNDLEVEL = 0.5;			// Level of sound when earplugs are in, of 1. 	(0.5)

WH_EP_DEFAULT = false;			// Whether earplugs should be in at start.		(false)

WH_EP_ACTION = true;			// To show or not show the action for the plugs	(true)
								// whether in ACE or in vanilla action menu.
								
WH_EP_AUTO = true;				// Will automatically put in plugs				(true)
								// when entering certain vehicles if true.
								
								// Which vehicle config classes to use auto		(["Tank","Helicopter",
								// plugs with. Recommended choices include		"Car","Plane","Ship"])
								// "Tank","Helicopter","Car","StaticWeapon",
								// "Plane", and "Ship". Must be in an array.
WH_EP_AUTO_VEHICLES = ["Tank","Helicopter","Car","Plane","Ship"];
								

WH_EP_TOGGLE = false;			// Whether to enable the toggle key below.		(false)
								// Note: only for modless. CBA users can bind their own.

WH_EP_TOGGLE_KEY = "timeDec";	// Key that can be pressed to toggle plugs.	("timeDec")
								// Default is "timeDec", which is normally
								// the (-) key. Other keys available here:
								// https://community.bistudio.com/wiki/inputAction/actions/bindings

WH_EP_SHOWBRIEF = true;			// Whether to show a briefing describing		(true)
								// the features of WH Earplugs. Highly
								// recommended, especially if not using CBA.

//	Text for addActions.
WH_EP_ACTION_IN = "<t color='#8ef724'>Insert Earplugs</t>";
WH_EP_ACTION_OUT = "<t color='#f7b224'>Remove Earplugs</t>";