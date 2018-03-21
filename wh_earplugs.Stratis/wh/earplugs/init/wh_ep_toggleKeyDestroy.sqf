//====================================================================================
//
//	wha_ep_toggleKey.sqf - Obliterates modless toggleKey from orbit.
//
//	Contact: Whale #5963
//
//====================================================================================

//	TODO : TBD : perhaps find a more elegant solution.
//	If the keydown / keyup eventhandlers used for the togglekey exist and are not set
//	to their 'off' state (-1)
if (!isNil {uiNamespace getVariable 'WHA_EP_EH_KEYDOWN'} && (uiNamespace getVariable 'WHA_EP_EH_KEYDOWN' > -1)) then
{
	//	Remove the eventhandlers
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',(uiNamespace getVariable 'WHA_EP_EH_KEYDOWN')];
	(findDisplay 46) displayRemoveEventHandler ['KeyUp',(uiNamespace getVariable 'WHA_EP_EH_KEYUP')];
	
	//	Set their ID variables to their 'off' state (-1)
	uiNamespace setVariable ['WHA_EP_EH_KEYDOWN',-1];
	uiNamespace setVariable ['WHA_EP_EH_KEYUP',-1];
};