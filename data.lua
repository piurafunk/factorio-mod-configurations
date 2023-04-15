local magic_constant = (1+1/3)/10 / 64 -- Whatever the math is, multiplying by this translates "items/second" to the game engine's expected value

-- Space belt speed
data.raw["transport-belt"]["se-space-transport-belt"].speed = settings.startup["space-exploration-configuration-space-belt-speed"].value * magic_constant
data.raw["underground-belt"]["se-space-underground-belt"].speed = settings.startup["space-exploration-configuration-space-belt-speed"].value * magic_constant
data.raw["splitter"]["se-space-splitter"].speed = settings.startup["space-exploration-configuration-space-belt-speed"].value * magic_constant

-- Space underground belt distance
data.raw["underground-belt"]["se-space-underground-belt"].max_distance = settings.startup["space-exploration-configuration-underground-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-black"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-blue"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-cyan"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-green"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-magenta"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-red"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-white"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value
data.raw["underground-belt"]["se-deep-space-underground-belt-yellow"].max_distance = settings.startup["space-exploration-configuration-underground-deep-space-belt-max-distance"].value

-- Space pipe to ground
data.raw["pipe-to-ground"]["se-space-pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance = settings.startup["space-exploration-configuration-space-pipe-to-ground-max-distance"].value

-- Space assembling machine speed
data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_speed = settings.startup["space-exploration-configuration-space-assembling-machine-speed"].value
