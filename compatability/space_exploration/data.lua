-- Space belt speed
data.raw["transport-belt"]["se-space-transport-belt"].speed = settings.startup[config.mod_prefix .. "space-belt-speed"].value * config.magic_constant
data.raw["underground-belt"]["se-space-underground-belt"].speed = settings.startup[config.mod_prefix .. "space-belt-speed"].value * config.magic_constant
data.raw["splitter"]["se-space-splitter"].speed = settings.startup[config.mod_prefix .. "space-belt-speed"].value * config.magic_constant

-- Space underground belt distance
data.raw["underground-belt"]["se-space-underground-belt"].max_distance = settings.startup[config.mod_prefix .. "underground-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-black"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-blue"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-cyan"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-green"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-magenta"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-red"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-white"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-yellow"].max_distance = settings.startup[config.mod_prefix .. "underground-deep-space-belt-max-distance"].value

-- Space pipe to ground
data.raw["pipe-to-ground"]["se-space-pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance = settings.startup[config.mod_prefix .. "space-pipe-to-ground-max-distance"].value

-- Space assembling machine speed
data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_speed = settings.startup[config.mod_prefix .. "space-assembling-machine-speed"].value

-- Mechanical Facility
local allowCoreFragmentProcessingInMechanicalLaboratory = settings.startup[config.mod_prefix .. "allow-core-fragment-processing-in-mechanical-laboratory"].value
if allowCoreFragmentProcessingInMechanicalLaboratory then
    table.insert(data.raw['assembling-machine']['se-space-mechanical-laboratory'].crafting_categories, 'core-fragment-processing')
end
