class CfgPatches {
	class alive_ace3_menu {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Characters_F_BLUFOR"};
		author[] = {"Lowlands Tactical"};
	};
};

class Extended_PostInit_EventHandlers
{
	alive_ace3_menu_postinit="[] execVM '\alive_ace3_menu\init.sqf'";
};
