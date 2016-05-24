/*

        File Name: ExileServer_VehicleUpgrades_utils_logOut.sqf

        Author: Mezo

        Copyright (c) 2016 MezoPlays

        This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
        To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

        Description:

*/
private["_msg"];
private ["_msg"];
_msg = format["Vehicle Upgrades: [%1] : %2",(_this select 1),(_this select 0)];
diag_log _msg;
