_vehicle = _this;
_vehicleClass = typeOf _vehicle;
_requirements = getArray (missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableClasses" >> _vehicleClass >> "requiredItems");
_vehicleInventory = _vehicle call ExileClient_util_containerCargo_list;
_result = true;

{
    _requiredItemClassName = _x select 0;
    _requiredItemCount = _x select 1;
    _itemCountInVehicle = { _x isEqualTo _requiredItemClassName } count _vehicleInventory;

    if (_itemCountInVehicle < _requiredItemCount) exitWith
    {
        _result = false;
    };
}
forEach _requirements;

_result
