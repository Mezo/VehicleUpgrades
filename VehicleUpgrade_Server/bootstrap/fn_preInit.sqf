/*

        File Name: fn_preInit.sqf

        Author: Mezo

        Copyright (c) 2016 MezoPlays

        This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
        To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

        Description:

*/
private["_code","_function","_file"];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
}
forEach
[
    ['ExileServer_VehicleUpgrades_network_UpgradeVehicle','VehicleUpgrade_Server\code\ExileServer_VehicleUpgrades_network_UpgradeVehicle.sqf'],
    ['ExileServer_VehicleUpgrades_object_calculateClass','VehicleUpgrade_Server\code\ExileServer_VehicleUpgrades_object_calculateClass.sqf'],
    ['ExileServer_VehicleUpgrades_utils_logOut','VehicleUpgrade_Server\code\ExileServer_VehicleUpgrades_utils_logOut.sqf']
];
true
