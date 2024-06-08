data:extend({
    {
        type = "int-setting",
        name = config.mod_prefix .. "space-belt-speed",
        setting_type = "startup",
        default_value = 60,
        order = "aa"
    },
    {
        type = "int-setting",
        name = config.mod_prefix .. "underground-space-belt-max-distance",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 0,
        order = "ab"
    },
    -- Space exploration provides its own configuration for deep space belt speed, so we won't provide one here
    {
        type = "int-setting",
        name = config.mod_prefix .. "underground-deep-space-belt-max-distance",
        setting_type = "startup",
        default_value = 14,
        minimum_value = 0,
        order = "ac",
    },
     {
        type = "int-setting",
        name = config.mod_prefix .. "space-pipe-to-ground-max-distance",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
        order = "ba"
    },
    {
        type = "double-setting",
        name = config.mod_prefix .. "space-assembling-machine-speed",
        setting_type = "startup",
        default_value = 2.0,
        minimum_value = 0,
        order = "ca"
    },
    {
        type = "bool-setting",
        name = config.mod_prefix .. "allow-core-fragment-processing-in-mechanical-laboratory",
        setting_type = "startup",
        default_value = false,
        order = "da"
    }
})
