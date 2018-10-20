Arma 3 Editor Extensions (A3EE)
===============================
This is by far the biggest of the additions, so it's worth documenting.

---

Modules
-------
These are editor modules available under the Modules, A3EE category.

### Ambient Animation
Place the module, set a comma-separated list of animation names (as seen in the
Animation Viewer) in its properties and synchronize any soldier units to it.
Great for adding extra immersion to a mission, though for more dynamic scenes,
consider scripting `playMove` with compatible animations and triggers instead.
This module is really just for idle stationary ambient animations.

### Attach Synced
Place the module, then synchronize a "parent" object to it. Then synchronize any
"child" objects to the module. When you start the mission, the "child" objects
will be attached (using `attachTo`) to the "parent" one, with relative distances
and positions as in the editor.
Useful for ammo boxes on a truck or tanks on a flying submarine.

### Briefing (OPORD)
An easy way to provide structured mission info on the map screen. New lines in
the text are auto-converted to line breaks, for conveniece.

### Custom Location
Allows you to create a Town/Village/Forest/etc. area as if it was hardcoded into
the map itself. The location shows on the map and mods working with map
locations will be able to find it. Good for ie. custom PMC base.

Additional functionality allows the removal of player corpses, useful when
players re-connect before units roll out the base. If you want to use this side
functionality without actually creating a named location, just leave the
location name empty.

### Execute Code
Modular way of running a piece of code on mission start / on respawn without you
having to remember ie. how to copy the code to a Respawn event handler. Compared
to init lines, it supports line and block comments, like `init.sqf`.

### Execute Code (Eden)
Runs a piece of code on every mission load in the Eden editor (and every time
the module's UI is opened and "OK" is pressed. Also every time it's copy-pasted,
etc. Useful for storing default mission settings.

### Insta OSD Location Info
Shows an On Screen Display info (bottom right) about the location the players
are currently in, on mission start. Optionally allows setting the first (bold)
line of the text (ie. to mission name) and a delay after mission start.
Useful for a "cinematic" effect when starting the mission, also to give players
an idea of where they are and what time it is

### Keep Playable AI
Transfers a player unit as AI to the server upon player disconnect, even with
`disabledAI` in `description.ext` or Eden. Optionally, makes the AI passive
(no movement/engagement).
Useful when players experience technical difficulties and have to re-connect,
especially for one-life missions with enabled AI on Playable slots.

### Kill player on JIP
Simply kill the player unit upon joining if they joined-in-progress (after
mission start). If spectator was configured for the mission, these players will
enter spectator.
Useful for one-life missions (Coop or PvP).

### Locality transfer (to HC)
Allows transferring unit groups to a Headless Client on mission start. To make
it work, you also need to select a checkbox in group Attributes for each group
you want to be transferred, in addition to having this module placed.
The number of HCs specified tells the code how long to wait (for how many HCs)
at mission start before starting round-robin group distribution amongst HCs.

### Move respawn
Move any respawn markers matching the specified filter to the module's location,
or more specifically to the nearest surface below the module's location.
Useful for respawning players/units on a specific floor of a building or a naval
vessel (carrier).

### Post Process Effects
Visual effects to be applied on the mission. Useful for simulating toxic gas
areas (image blur) together with trigger-based activation or for altering the
color tone of the mission (ie. blue tint on a winter map to make it "colder").

### Teleport on JIP
Teleport a player who joined-in-progress to the location of this module. Useful
for special mission start scenarios (inside a plane, parachuting down) where you
want any latecomers to spawn ie. at a respawn point (or somewhere else) instead
of mid-air without a parachute or in the plane on the ground.

---

Eden editor Tools
-----------------
Various helpful tools and checks reachable through the menu bar of the Eden
editor, Tools, under A3EE Tools.

### Validate mission
This will attempt to find various common errors that mission makers tend to make
when editing a unit's arsenal (overloaded units, ACRE2 radios with unique IDs,
etc.) or working in the editor in general. The report is copied to clipboard and
can be pasted to ie. notepad for review.

### Fill in Role Description
Take the group callsign and unit name and put them inside the Role Description
field (unit Attributes) of each unit that was selected when this tool was used.
Overwrites any previous Role Description!

Useful to quickly create a custom force of multiple groups having the same or
similar units, so the group callsigns can be seen in the Lobby, without the
mission maker having to manually edit every single soldier's Role Description.

### Restore persistent Callsigns
When you copy/paste a group in Eden (or place it from a custom composition),
it gets default Callsign assigned. The same happens on delete and ctrl-z (undo).
It seems that Eden likes to remove your custom Callsign when it can, hence this
feature - it allows you to store your favourite Persistent Callsign in group
Attributes, below the normal one, and restore/recall it anytime with this tool.
It also allows using the same callsign for multiple groups, so you can place
all of them ie. with a custom composition, delete unwanted ones and restore
Callsigns only to the remaining ones.

Useful for storing Callsigns in custom compositions or when copy/pasting groups
across missions or when you want to feel safe that Eden won't eat your Callsign.

---

Unit Attributes
---------------
These are accessible by double-clicking a unit (or right clicking, Attributes).

### Object: Control, Team color
The team (unit) color inside a group (squad/fireteam), shown on the vanilla
group HUD and ShackTac radar HUD.

### Object: Control, ACRE2 Preset Channels
Default ACRE2 radio channels, set on mission start, for the unit. Works only
on player units. This field itself is a list of channel numbers to be set on
1st radio, 2nd radio, etc. according to unit inventory order. Extra values are
ignored (player has less radios than channels specified) and 0 as a channel
number means to not touch that specific radio (leave default channel).

Useful for company-wide channel presets for both short and long range radios.

### Object: Extended Gear
Overrides for equipment pieces that are normally set from a player's profile.
Allows forcing facewear (ie. balaclava for special forces), insignia or even
face (ie. when playing African civilians).

A special "Use player insignia" option allows to define per-player insignia,
so that each player has their own, which can be ie. a country flag. This uses
a variable called `a3ee_player_insignia` in the client profile namespace,
which should be a `CfgUnitInsignia` class name.
