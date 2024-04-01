config = require('config')

-- Create table of mods we support
local compatibleMods = require('compatability.mods')

-- Iterate over supported mods, and if they are installed, load their respective configuration file
for _, mod in pairs(compatibleMods) do
    log('Checking if ' .. mod.name .. ' is enabled')
    if mods[mod.name] then
        log('Loading ' .. mod.name .. ' configuration')
        pcall(require, 'compatability.' .. mod.directory .. '.data')
    end
end
