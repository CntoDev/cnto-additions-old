/*
 * try to remove comments from a string, returning a sanitized string
 */

private _lf = toString [10];

private _str = _this;
private _oldstr = "";

while {_oldstr != _str} do {
    _oldstr = _str;

    private _linec = _str find "//";
    private _blockc = _str find "/*";

    /* line comment exists and is before any block comment */
    if (_linec != -1 && (_blockc == -1 || _linec < _blockc)) then {
        /* anything before the comment */
        private _newstr = _str select [0, _linec];
        private _inside = _str select [_linec+2];
        private _lfpos = _inside find _lf;
        if (_lfpos != -1) then {
            /* found newline, append anything after it (though include it) */
            _newstr = _newstr + (_inside select [_lfpos]);  /* no _lfpos+1 */
        };
        _str = _newstr;
    };

    /* block comment exists and is before any line comment */
    if (_blockc != -1 && (_linec == -1 || _blockc < _linec)) then {
        /* anything before the comment */
        private _newstr = _str select [0, _blockc];
        private _inside = _str select [_blockc+2];
        private _endpos = _inside find "*/";
        if (_endpos != -1) then {
            /* found terminator, append anything after it */
            _newstr = _newstr + (_inside select [_endpos+2]);
        };
        _str = _newstr;
    };
};

_str;
