//=======================================================================================
//
//	wh_earplugConfig.sqf - Contains configurable values for WH earplugs.
//
//	Note:	If CBA is enabled, many of these settings may be altered by individual
//			clients to their taste. 
//
//	@ /u/Whalen207 | Whale #5963
//
//=======================================================================================

//---------------------------------------------------------------------------------------
//	Configuration Values. Feel free to modify.
//---------------------------------------------------------------------------------------

//	Main Values					// Description							(Recommended Value)

WH_EP_EARPLUGS = true;			// Enable or disable the earplugs system.		(true)

WH_EP_SOUNDLEVEL = 0.4;			// Level of sound when earplugs are in, of 1 	(0.4)

WH_EP_EARPLUGS_DEFAULT = false;	// Whether earplugs should be in at 			(false)
								// mission start.

WH_EP_AUTO_VEHICLES = true;		// Will automatically put in plugs				(true)
								// when entering vehicles if true.

WH_EP_TOGGLEKEY = "timeDec";	//	Key that can be pressed to toggle plugs.	("timeDec")
								//	Default is "timeDec", which is normally
								//	the (-) key. Other keys available here:
								//	https://community.bistudio.com/wiki/inputAction/actions/bindings
								//	Don't want any key? Comment out the line.