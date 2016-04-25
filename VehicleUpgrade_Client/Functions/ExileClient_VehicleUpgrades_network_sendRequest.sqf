_vehicle = cursorTarget;
_vehiclePosition = getPos _vehicle;
_vehicleNetId = netId _vehicle;
_vehicleObject = objectFromNetId _vehicleNetId;
_vehicleOriginalClass = typeOf _vehicleObject;
_requiredRespect = getNumber (missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableVehicles" >> _vehicleOriginalClass >> "neededRespect");

try
{
    if !(_vehicleOriginalClass isKindOf "AIR" || _vehicleOriginalClass isKindOf "CAR" || _vehicleOriginalClass isKindOf "TANK") then
    {
        throw "That's not a vehicle!";
    };
    if !(isClass(missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableClasses" >> _vehicleOriginalClass)) then
    {
        throw "This Vehicle Cannot be upgraded!";
    };
    if !(ExileClientPlayerScore >= _requiredRespect) then
    {
        throw "You need more respect for that!";
    };
    _inventoryCheckRet = _vehicleObject call ExileClient_VehicleUpgrades_inventory_checkRequirements;
    if !(_inventoryCheckRet) then
    {
        throw "You're Missing Parts!";
    };
    if !(local _vehicle) then
    {
        throw "Get In The Driver Seat First!";
    };
    if !(_vehicle getVariable ["ExileIsPersistent", false]) then
    {
        throw "The Vehicle Must Be Persistent!";
    };
    ["Success",["Your vehicle has been upgraded!"]] call ExileClient_gui_notification_event_addNotification;
    ["UpgradeVehicle",[_vehicleObject,_vehicleOriginalClass]] call ExileClient_system_network_send;
    playSound "Whip";
}
catch
{
    ["Whoops",[_exception]] call ExileClient_gui_notification_event_addNotification;
};
