data:extend({
    {
        type = "int-setting",
        name = "space-exploration-configuration-space-belt-speed",
        setting_type = "startup",
        default_value = 60,
        order = "aa"
    },
    {
        type = "int-setting",
        name = "space-exploration-configuration-underground-space-belt-max-distance",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 0,
        order = "ab"
    },
    {
        type = "int-setting",
        name = "space-exploration-configuration-underground-deep-space-belt-max-distance",
        setting_type = "startup",
        default_value = 17,
        minimum_value = 0,
        order = "ac",
    },
     {
        type = "int-setting",
        name = "space-exploration-configuration-space-pipe-to-ground-max-distance",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
        order = "ba"
    },
    {
        type = "double-setting",
        name = "space-exploration-configuration-space-assembling-machine-speed",
        setting_type = "startup",
        default_value = 2.0,
        minimum_value = 0,
        order = "ca"
    },
    {
        type = "bool-setting",
        name = "space-exploration-configuration-allow-core-fragment-processing-in-mechanical-laboratory",
        setting_type = "startup",
        default_value = false,
        order = "da"
    }
})
