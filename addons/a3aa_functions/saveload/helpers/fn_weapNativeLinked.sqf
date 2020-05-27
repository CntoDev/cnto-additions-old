/* return a list of built-in linked items (attachments) for a weapon class */

private _litems = configProperties [
    configfile >> "CfgWeapons" >> _this >> "LinkedItems", "isClass _x", true
];
if (_litems isEqualTo []) exitWith { [] };

private _classnames = [];
{
    _classnames pushBack getText (_x >> "item");
} forEach _litems;

_classnames;
