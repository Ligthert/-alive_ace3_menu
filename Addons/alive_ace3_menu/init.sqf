// Magic happens here...

// Docs: https://ace3mod.com/wiki/framework/interactionMenu-framework.html

if ( missionNamespace getVariable ["ace_common", false]) then {

  private ["_alive_main","_action"];

  // Create main self-interaction menu item
  _alive_main = ["alive_main","ALiVE","x\alive\addons\main\logo_alive.paa",{},{true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions"], _alive_main ] call ace_interact_menu_fnc_addActionToObject;


  /// Admin Actions
  _action = ["alive_admin_actions",localize "STR_ALIVE_ADMINACTIONS","x\alive\addons\main\logo_alive.paa",{},{call ALIVE_fnc_isServerAdmin}] call ace_interact_menu_fnc_createAction;
  [player, 1,["ACE_SelfActions","alive_main"], _action] call ace_interact_menu_fnc_addActionToObject;

  // Mark active units units
  _action = [ "alive_mark_active_units", localize "STR_ALIVE_ADMINACTIONS_MARK_UNITS_ENABLE", "", { [] call ALIVE_fnc_markUnits; }, { call ALIVE_fnc_isServerAadmin }] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Enable Ghosting
  _action = ["alive_enable_ghosting",localize "STR_ALIVE_ADMINACTIONS_GHOST_ENABLE","",{[player,true] call ALIVE_fnc_adminGhost}, {!isObjectHidden player}] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Disable Ghosting
  _action = ["alive_disable_ghosting",localize "STR_ALIVE_ADMINACTIONS_GHOST_DISABLE","",{[player,false] call ALIVE_fnc_adminGhost}, {isObjectHidden player}] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Enable Teleporting
  _action = ["alive_enable_teleporting",localize "STR_ALIVE_ADMINACTIONS_TELEPORT_ENABLE","",{ ALiVE_sys_adminactions setVariable ["teleport_enabled", true]; onMapSingleClick {vehicle player setPos _pos;}},{ ALiVE_sys_adminactions getVariable ["teleport_enabled", false] }] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Disable Teleporting
  _action = ["alive_disable_teleporting",localize "STR_ALIVE_ADMINACTIONS_TELEPORT_DISABLE","",{ ALiVE_sys_adminactions setVariable ["teleport_enabled", false]; onMapSingleClick ""},{ ALiVE_sys_adminactions getVariable ["teleport_enabled", false] }] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Teleport units
  _action = ["alive_teleport_units",localize "STR_ALIVE_ADMINACTIONS_TELEPORTUNITS","",{["CAManBase"] spawn ALiVE_fnc_AdminActionsTeleportUnits}, {call ALIVE_fnc_isServerAadmin}] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Profile non-profiled units
  _action = ["alive_profile_units",localize "STR_ALIVE_ADMINACTIONS_CREATE_PROFILES_ENABLE","",{[] call ALIVE_fnc_adminCreateProfiles},{call ALIVE_fnc_isServerAadmin}] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Toggle Installations
  _action = ["alive_toggle_instalations",localize "STR_ALIVE_ADMINACTIONS_OPCOM_TOGGLEINSTALLATIONS","",{[] call ALIVE_fnc_OPCOMToggleInstallations},{!isnil "ALiVE_mil_OPCOM"}] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;

  // Debug Console
  _action = ["alive_debug_console",localize "STR_ALIVE_ADMINACTIONS_CONSOLE_ENABLE","",{createDialog "RscDisplayDebugPublic"},{true}] call ace_interact_menu_fnc_createAction;
  [player,1,["ACE_SelfActions","alive_main","alive_admin_actions"],_action] call ace_interact_menu_fnc_addActionToObject;



  /// Player Options
  _action = ["alive_player_options",localize "STR_ALIVE_PLAYEROPTIONS_SHORT","x\alive\addons\sys_playeroptions\icon_sys_playeroptions.paa",{},{true}] call ace_interact_menu_fnc_createAction;
  [player, 1,["ACE_SelfActions","alive_main"], _action] call ace_interact_menu_fnc_addActionToObject;

  // View distnace
  _action = ["alive_vdist", localize "STR_ALIVE_VDIST", "", { [] call ALIVE_fnc_vDistGuiInit }, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions","alive_main","alive_player_options"], _action] call ace_interact_menu_fnc_addActionToObject;

// Player Tags Enable
// PLayer Tags Disable
// Enable Player Logistics
// Disable Player Logistics
// Reset something
// Manual Save player


};
