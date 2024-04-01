local magic_constant = (1 + 1 / 3) / 10 / 64 -- Whatever the math is, multiplying by this translates "items/second" to the game engine's expected value
local mod_prefix = 'mod-configurations-'

-- Create table of mods we support
local mods = {{
    name = 'space-exploration',
    file = 'space_exploration.lua'
}}

-- Iterate over supported mods, and if they are installed, load their respective configuration file
for _, mod in pairs(mods) do
    if mods[mod.name] then
        require('compatability/' .. mod.file)
    end
end
