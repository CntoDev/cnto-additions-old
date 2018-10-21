params ["_buff", "_idx", "_val"];
_buff set [_idx % (count _buff), _val];
_val;
