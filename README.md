The arma-additions repository
=============================

Here be various small tweaks, additions or fixes of various mods that are
commonly used in "MilSim" or "Serious" Arma 3 gameplay communities.

These are maintained mainly by me (Freghar) and as such are pretty specific
to me, but feel free to browse and cherry-pick what you like or just get
inspired by some algorithms.

I realize that the `CfgPatches` names don't have any author-based prefix,
like many Arma modders like to use, but I don't fancy that approach and have
deliberately chosen fairly long classnames to hopefully avoid any conflicts.
Not a great solution, you're right.

To build the PBOs, simply pack the directories in `addons`, using `cpbo` or
`armake` with `--packonly` or using any other tool that can just pack files
into PBO without processing any `.cpp` or `.h(pp)` files.

Features
========

(This list may be slightly out of date when you read it, not updated
 regularly.)

(Also, the "light" version of arma-additions obviously lacks any RHS,
 NIArms and other content mentioned below.)

* **a3aa_functions**
  * **a3ee** - misc functions for Editor Extension, loadout, etc.
  * **cargo** - 'box guard' against impulse looting by weaklings
  * **cbuff** - lightweight circular buffer (programming thing)
  * **hash** - lightweight hash table (programming thing)
  * **misc** - unclassified helpers
  * **saveload** - persistent box/vehicle/terrain save/load, used by my old guer campaign
* **ai_dynamic_skill** - dynamic AI skill setting based on combat mode, vehicles, etc.
* **ares_extras** - additions to (former) Ares, now Achilles
  * **Allow Crew In Immobile (vehicle)** - ai_dynamic_skill enables this by default, but you can disable it for a more vanilla experience
  * **Forget enemies** - incredibly useful if AI suddenly spots sneaky players and you don't want to break the immersion
  * **Reveal enemies** - useful to make AI start shooting on a target which should be obvious
  * **Watch** - makes AI turn to watch a direction (ie. tank turret)
  * **No unload in combat** - stops truck passengers from jumping out when shot upon
  * **Flee** - forcibly make AI run somewhere (don't think it works anymore)
  * **Suppress (bis)** - calls doSuppressiveFire scripting cmd, makes tank shoot cannot at heli, etc.
  * **Assign Task Force** - allows sharing reported contacts between AI groups, so they shoot more
  * **Force WP Setting** - if you set yellow face (AWARE) on a waypoint, this forces it even if AI gets shot at
  * **No Talking** - because elite infiltrators shouldn't shout when they spot you
  * **Locality - Get/Set** - for moving units between server/client/HC
  * **Give Zeus to player (may crash)** - still crashes less than Achilles' version of this :)
  * **Set player insignia (in profile)** - if you set unit insignia in editor to use per-player insignia, this sets it for that specific player
  * **Terrain Objects Hide/Show** - pretty obvious, doesn't work persistenly though
  * **Set new player unit** - basically what Achilles does on Alt+doubleclick, but for another client, not Zeus
  * **Forgive onelife death** - if onelife editor module is used and player dies into spectator, this allows him to respawn
  * **End Mission - Won/Lost** - yeah, that
  * **Move respawn\*** - set new position for the respawn_\* map marker placed in editor
  * **Move JIP teleport point** - same, but for the JIP teleport editor module
  * **Delete units (really)** - very handy if pressing the Delete key throws an error msg because Arma
* **basic_vehicle_cargo** - replace default vehicle contents (NLAW, etc.) with something else
  * (can be overriden on a per-vehicle basis via checkbox in editor)
* **chestpack** - it's a backpack for your belly! .. for when you need something more immediate on your back, like a parachute
* **disable_channels** - disable unused chat channels, CBA configurable
* **dynamic_groups** - set up vanilla [Dynamic Groups](https://community.bistudio.com/wiki/Arma_3_Dynamic_Groups) framework (group management UI) for the mission
* **editor_extensions** - various in-editor enhancements
  * **acre_channels** - pre-set channels for (multiple) ACRE2 radios a unit might have, complete with in-game Journal entries
  * **ambient_anim** - a module to make linked units animate, MP-synced, optionally aborts when unit enters combat
  * **arsenal_respawn** - save starting Arsenal loadout, restore it on respawn
  * **execute_code** - run any SQF code you want, in editor (useful for running something on composition placement) or in game
  * **extended_gear** - force facewear, face, insignia and other on a player avatar
  * **insta_osd** - print nearest town/village/etc. on-screen when the game starts
  * **locality_transfer** - transfer units to a client / HC on mission start, doesn't work too reliably because Arma
  * **onelife** - a comprehensive system for one-life missions allowing teleport on disconnect, pardon on Arma stair kill, etc.
  * **paper_map** - prevents magical map marker sharing, except for a defined radius around the author
  * **persistent_callsign** - useful for compositions as Arma likes to reset callsigns in editor all the time; pre-set in group attributes, Tools menu to copy it to callsign field
  * **playable_ai** - if playing with AI in player slots, order the AI to stop, hold fire, go prone, etc. to avoid acting stupid, useful on stealth missions
  * **spurious_attributes** - removes generally useless editor attributes to save on .sqm size
  * **team_colors** - pre-defines unit colors in a group, works with sthud or vanilla command bar
  * **validate_mission** - various sanity checks under Tools menu (bad ACRE2 radios, overloaded units, etc.), paste result in notepad for examination
  * **modules** - other tiny modules that didn't warrant their own editor_extension
    * **Custom Location** - create a Location like a new town/village/castle/bus/etc., works with insta_osd and is visible on map
    * **Briefing (OPORD)** - populates in-game Journal, uses Arma's Structured Text formatting (see wiki)
    * **Teleport on JIP** - teleports any players who Join-In-Progress to where you place this module
    * **Move respawn** - moves the respawn_\* marker to the location of this module - unlike the marker, this works in 3D! (use for battleships)
    * **Attach synced** - visually position an ammo box on a quadbike's back and sync both to this module, magic happens
    * **Kill player on JIP** - a more gruesome alternative to teleport, for one-life missions
    * **Post Process Effects** - very cool way to (using a trigger!) blur the screen, change color palette, etc. .. can simulate tear gas
  * **menu** - other tiny items under the top menubar -> Tools that aren't part of other editor_extensions
    * **Fill in Role Description** - a quick way to make sensible unit lobby names from unit classname and group callsign, handy for custom callsigns
* **grasskeys** - CBA configurable hotkeys for setting terrain complexity (and hiding grass because AI cheats too)
* **infopanel_control** - CBA configurable left/right panel UI, allows you to disable vanilla mine detector UI, GPS, etc. even if player has the item
* **insta_zeus** - Zeus (Curator) and ACE Arsenal anytime, anywhere in SP, or for host / logged in admin in MP, no editor support needed
* **loadout_copier** - copy/pastes loadout in `getUnitLoadout` format to/from clipboard using a keybind
  * works in Eden editor, Zeus and in 1st/3rd person (separate keybind for convenience)
  * uses clipboard in Eden or singleplayer, internal variable in MP due to Arma safety limitations
    * in hosted MP and [if you're the server](https://community.bistudio.com/wiki/copyToClipboard), copy outputs to clipboard in addition to variable, for debugging
* **misc_tiny_configs** - various Config structure tweaks and (mostly) fixes
  * **add_housedestructionsmoke** - fix for pop-up error on some CUP maps
  * **bright_flares** - Arma lighting update broke all lighting, this makes flares at least somewhat usable again
  * **collapsed_3den** - Eden editor has BLUFOR->NATO->Men expanded by default, this collapses it (presuming you want modded units instead)
  * **ffv_wide_view** - much wider fire-from-vehicles angles in (especially) RHS HMMWV
  * **fire_rate** - make Sting fire faster (due to low game FPS), add slow auto fire for Minimi, etc.
  * **limit_stui_features** - trim down some ShackTac addon features, leave only sthud
  * **portable_boat** - a boat in a backpack, what more do you want? .. unpack/repack like a mortar, cool for specop missions
  * **recoil_tweaks** - adjust (mainly RHS) recoil of various MGs for game balance reasons
  * **rhs_flashlighs** - like bright_flares, make some flashlights much brighter to compensate for broken "HDR" lighting
  * **rhs_suppressors** - RHS specific version of silent_ops suppressor tweaks, make them quieter
  * **smoke_bounce** - tone down UGL smoke bounce on impact, they're not rubber balls anymore
  * **weight_fixes** - adjust inventory weight of (mainly small utility) items to make it less realistic, but more balanced
* **prevent_negative_rating** - avoids mistreatment by the engine (cannot enter friendly vehicles) after friendly fire
  * does nothing if ACE Interaction is present in the modset (it provides the same functionality)
* **quiet_vehicles** - lower volume in vehicles for easier direct speech communication
  * does nothing if ACEX Volume is present in the modset
* **silent_ops** - various tweaks for stealthy gameplay
  * new **Silent Operative** unit (under CIV)
    * has much quieter footstep sounds and is nearly invisible to AI without NVGs during dusk/dawn/night
    * highly trained, can hack UAVs, is medic/engineer, can bury bodies like in Operation Flashpoint!
    * to use, (1) place any blue/red/green soldier, (2) place SilentOP, (3) group-link SilentOp to b/r/g soldier, (4) delete original b/r/g soldier (just the soldier icon, not group icon), (5) SilentOp is now blue/red/green
  * throwing grenades no longer counts as loud shooting :)
  * various **tweaks to suppressors** to make them much quieter, 7.62mm > 6.5mm > 5.56mm > 9mm
* **spectator_acre_channel** - when using vanilla spectator, switches the player to ACRE2 spectator channel
* **static_line_chute** - organized group jumping, initiated by pilot/grplead, parachute not provided (you need to have one already)
