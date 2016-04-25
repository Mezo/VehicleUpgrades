class CfgPatches
{
	class VehicleUpgrade_Server
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_assets","exile_server_config"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgFunctions
{
    class VehicleUpgrade_Server
    {
        class Bootstrap
        {
            file = "VehicleUpgrade_Server\bootstrap";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};
