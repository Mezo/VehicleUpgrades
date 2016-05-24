/*

        File Name: VehicleUpgrades_Client_init.sqf

        Author: Mezo

        Copyright (c) 2016 MezoPlays

        This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
        To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

        Description:

*/
private ['_code', '_function', '_file'];
{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
}
forEach
[
    ['ExileClient_VehicleUpgrades_network_sendRequest','VehicleUpgrade_Client\Functions\ExileClient_VehicleUpgrades_network_sendRequest.sqf'],
    ['ExileClient_VehicleUpgrades_inventory_checkRequirements','VehicleUpgrade_Client\Functions\ExileClient_VehicleUpgrades_inventory_checkRequirements.sqf'],
    ['ExileClient_VehicleUpgrades_util_listRequirements','VehicleUpgrade_Client\Functions\ExileClient_VehicleUpgrades_util_listRequirements.sqf']
];
