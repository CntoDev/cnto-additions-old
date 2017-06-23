/*
 * These are default skill values for editor-placed and zeus-spawned units.
 *
 * The skill slider in editor still works, but places the values below as
 * "center points" instead of 0.5, so that skill slider (GUI) values below
 * 50% are interpolated between 0 and the number here, values above 50%
 * slider are interpolated between the number here and 1.
 * Simply put, this allows the MM to adjust skill per-unit, with the center
 * being the number below and not 0.5. Zeus skill slider bypasses this and
 * sets skill directly.
 */
[
    [  "aimingAccuracy",  0.2  ],
    [  "aimingShake",     0.2  ],
    [  "aimingSpeed",     0.9  ],
    [  "endurance",       1.0  ],
    [  "spotDistance",    0.8  ],
    [  "spotTime",        0.9  ],
    [  "courage",         1.0  ],
    [  "reloadSpeed",     1.0  ],
    [  "commanding",      1.0  ],
    [  "general",         1.0  ]
]
