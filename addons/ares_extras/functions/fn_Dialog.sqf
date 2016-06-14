/*
 * show a multiple-choice dialog in the curator interface
 *
 * the API is similar to Ares_fnc_ShowChooseDialog, except one associated
 * value with each choice - this function then returns the associated value
 * instead of an index within the choices array
 *
 * ie. [ "Choose Your Distance",
 *         [
 *             "Distance be",
 *             [
 *                 ["About 10m", 10],
 *                 ["Lets say 100m", 100],
 *                 ["Make that 1234m", 1234]
 *             ]
 *         ]
 *     ]
 *
 * would return (as Number) 100 when the user selects 100.
 * If the last member of the choices array is a Number (instead of 2-member
 * array), it is used as a default starting index into the choices array.
 *
 * When given multiple choices,
 *
 * ie. [ "Choose Your Distance And Speed",
 *         [
 *             [
 *                 "Distance be",
 *                 [
 *                     ["About 10m", 10],
 *                     ["Lets say 100m", 100],
 *                     ["Make that 1234m", 1234],
 *                 ],
 *                 2
 *             ],
 *             [
 *                 "Speed along",
 *                 [
 *                     ["Woo 10kmh", 10],
 *                     ["Dangerous 5000kmh", 5000],
 *                 ]
 *             ]
 *         ]
 *     ]
 *
 * this function returns an array of the selected choices, ie. [1234,5000].
 */

params ["_header", "_choiceset"];

/* first syntax type - choices passed directly without wrapping array */
if (typeName (_choiceset select 0) != "ARRAY") then {
    _choiceset = [_choiceset];
};

/* we pass the former to Ares_fnc_ShowChooseDialog
 * and interpret its return value as the latter */
private _chset_questions = [];
private _chset_values = [];

{
    _x params ["_head", "_choices", ["_default", 0]];

    private _texts = _choices apply { _x select 0 };
    private _values = _choices apply { _x select 1 };

    _chset_questions pushBack [_head, _texts, _default];
    _chset_values pushBack _values;
} forEach _choiceset;

private _idxs = [_header, _chset_questions] call Ares_fnc_ShowChooseDialog;

/* reply cancelled */
if (count _idxs == 0) exitWith { nil };

/* one question only - return one value */
if (count _idxs == 1) exitWith {
    private _idx = _idxs select 0;
    private _values = _chset_values select 0;
    _values select _idx;
};

/* multiple questions - return array of replies */
private _replies = [];
{
    private _choices = _chset_values select _forEachIndex;
    _replies pushback (_choices select _x);
} forEach _idxs;

_replies;
