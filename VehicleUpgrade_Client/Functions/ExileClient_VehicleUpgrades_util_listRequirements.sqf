/*

 	Name: ExileClient_VehicleUpgrades_util_listRequirements.sqf

 	Author: Mezo
    Copyright (c) 2016 MezoPlays

    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

 	Description:
    Lists the needed items to upgrade the vehicle being interacted with.

*/
_vehicle = cursorTarget;
_vehicleClass = typeOf _vehicle;
try
{
    if !(isClass(missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableClasses" >> _vehicleClass)) then
    {
            throw "Something went wrong!";
    };
    if !(local _vehicle) then
    {
            throw "Get in the vehicle first!";
    };

    _neededitems = getArray (missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableClasses" >> _vehicleClass >> "requiredItems");
    {
        _itemclass = _x select 0;
        _itemAmmount = _x select 1;
        _itemconfigNum = _itemclass call ExileClient_util_cargo_getType;
        switch (_itemconfigNum) do
        {
            case (1): { _Cfg = "CfgMagazines"; };
            case (2): { _Cfg = "CfgWeapons"; };
            case (3): { _Cfg = "CfgVehicles"; };
            default (0):  { _Cfg = "CfgVehicles"; };
        };
        _congifName = getText(configFile >> _Cfg >> _itemclass >> "displayname");
        systemChat format ["You need %1 x %2",_itemAmmount,_itemclass];
    } forEach _neededitems;
}
catch
{
    ["Whoops",[_exception]] call ExileClient_gui_notification_event_addNotification;
};
