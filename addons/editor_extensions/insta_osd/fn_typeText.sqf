/*
 * type text, letter by letter, provided in '_this' as an array of strings,
 * one per line, in the bottom right side of the screen
 *
 * optionally, an array may be used instead of a string, specifying extra
 * properties:
 *   is heading - true/false
 *
 * examples:
 *   ["first line", "second line"] call a3aa_ee_insta_osd_fnc_typeText;
 *   [["big heading", true], "second line"] call a3aa_ee_insta_osd_fnc_typeText;
 */

private _textblocks = [];

{
    private _format = "";

    if (typeName _x == "ARRAY") then {
        _x params ["_text", ["_heading", false]];
        if (_heading) then {
            _format = _format + "size='1' font='PuristaBold' ";
        };
        _x = _text;
    };

    _textblocks pushBack [_x, _format];
    /* empty "" = delay between lines, nonempty = no delay */
    _textblocks pushBack [" ", "<br/>"];
} forEach _this;

[
    _textblocks,
    safezoneX - 0.01,
    safeZoneY + (1 - 0.125) * safeZoneH,
    true,
    "<t align='right' size='0.7' font='PuristaMedium'>%1</t>"
] spawn BIS_fnc_typeText2;
