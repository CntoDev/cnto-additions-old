private _spd = abs speed _this;
switch true do {
    case (_spd > 200): {0.5};
    case (_spd > 150): {1};
    case (_spd > 100): {2};
    case (_spd > 50):  {4};
    default            {6};
};
