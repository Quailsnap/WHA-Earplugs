//====================================================================================
//
//	wh_ep_checkMods.sqf - Checks the presence of certain mods.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Checking for mods using the configs they add to CfgPatches.
//------------------------------------------------------------------------------------

//	CBA
WH_EP_MOD_CBA = (isClass (configFile >> "CfgPatches" >> "cba_common"));

//	ACE core
WH_EP_MOD_ACE = (isClass (configFile >> "CfgPatches" >> "ace_common"));

//	ACE hearing
WH_EP_MOD_ACEH = (isClass (configFile >> "CfgPatches" >> "ace_hearing"));