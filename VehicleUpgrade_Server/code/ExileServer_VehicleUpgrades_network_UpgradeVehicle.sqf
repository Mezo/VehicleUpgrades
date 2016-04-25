_playerSessionID = _this select 0;
_package = _this select 1;

_vehicleObject = _package select 0;
_pincode = _vehicleObject getVariable ["ExileAccessCode", ""];
_vehicleOriginalClass = _package select 1;
_vehiclePosition = getpos _vehicleObject;
_vehicleDir = getDir _vehicleObject;

_playerObject = _playerSessionID call ExileServer_system_session_getPlayerObject;
_ownerUID = getPlayerUID _playerObject;


try
{
    if !(count _pincode == 4) then
    {
        throw format ["%1 has done the impossible and needs a refund for a %2 - [%3]", (name _playerObject),(getText(configFile >> "CfgVehicles" >> _vehicleOriginalClass >> "displayName")), _vehicleOriginalClass];
    };
    if !(isClass(missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableClasses" >> _vehicleOriginalClass)) then
    {
        throw format ["Failed to find replacable class :: %1 need a refund for a %2", (name _playerObject),(getText(configFile >> "CfgVehicles" >> _vehicleOriginalClass >> "displayName"))];
    };
    if !(alive _playerObject) then
    {
        throw format ["%1 Upgraded a vehicle whilst dead!", (name _playerObject)];
    };
    _vehicleObject call ExileServer_object_vehicle_database_delete;
    deleteVehicle _vehicleObject;
    _vehicleClass = _vehicleOriginalClass call ExileServer_VehicleUpgrades_object_calculateClass;
    _vehicle = [_vehicleClass, _vehiclePosition, _vehicleDir, true, _pincode] call ExileServer_object_vehicle_createPersistentVehicle;
    _playerObject allowdamage false;
    _vehicle allowDamage false;
    _vehicle setVariable ["ExileIsLocked",1];
    _vehicle setVariable ["ExileOwnerUID", _ownerUID];
    _vehicle setVariable ["ExileAccessCode", _pincode];
    _vehicle setVariable ["ExileIsPersistent", true, true];
    _vehicle lock 2;
    _vehicle call ExileServer_object_vehicle_database_insert;
    _vehicle call ExileServer_object_vehicle_database_update;
    _vehicle allowDamage true;
    _playerObject allowDamage true;
    _logUpgrade = format["%1 has upgraded a %2 to a %3",(name _playerObject),(getText(configFile >> "CfgVehicles" >> _vehicleOriginalClass >> "displayName")),(getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName"))];
    ["UPGRADE LOG",_logUpgrade] call ExileServer_VehicleUpgrades_utils_logOut;

}
catch
{
    ["Network Error",_exception] call ExileServer_VehicleUpgrades_utils_logOut;
};
