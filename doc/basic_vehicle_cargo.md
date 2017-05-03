Basic Vehicle Cargo
===================
This functionality aims to replace vanilla and modded vehicle cargo with
something more friendly to the community playing the game. Vanilla vehicles
can include ie. PCMLs or other "overpowered" weapons, modded vehicles often
do the same (ie. adding extra rockets). Most vanilla vehicles add First Aid
kits, which do not align well with ie. ACE3 Advanced Medical.

The fix is to simply remove all vehicle inventory on mission start / on vehicle
spawn, after waiting a second for modded scripts to add their items (in case of
misbehaving mods, like TF47 launchers), and add our own custom inventory to the
vehicles, possibly randomizing it a bit.

This new custom inventory is not mission-customizable, it's hardcoded in the
files of this functionality and contains some ACE3 basic bandages, morphine
and the occasional map/compass/etc. as misc items.

How to use
----------
To use it, simply place the "Basic vehicle cargo" module (under Other) and
you're all set. Anything inheriting `Car`, `Tank`, `Helicopter`, `Plane` or
`Ship` will have a custom inventory.

How to not use
--------------
If you want custom inventory in one specific vehicle and you're sure the vehicle
doesn't come from a misbehaving mod that would add its own stuff on top of
yours, you can disable this functionality for that vehicle and define your own
cargo using the Eden UI or an init line script.

To disable, look under `Object: Special States` in the vehicle Attributes and
check the "Don't clear vehicle cargo" checkbox.
