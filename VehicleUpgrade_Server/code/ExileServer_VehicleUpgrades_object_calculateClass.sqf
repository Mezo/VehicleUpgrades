/*

 	Name: ExileServer_VehicleUpgrades_object_calculateClass.sqf

 	Author: Mezo
    Copyright (c) 2016 MezoPlays

    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

 	Description:
    Finds the replacement classname of the vehicle being upgraded

*/
_currentClass = _this;
_classToSpawn = getText (missionConfigFile >> "CfgVehicleUpgrades" >> "UpgradableClasses" >> _currentClass >> "replacementClass");
_classToSpawn
