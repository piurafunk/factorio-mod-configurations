config = require('config')
-- Create table of mods we support
local compatibleMods = require('compatability.mods')

for _, mod in pairs(compatibleMods) do
    log('Checking if ' .. mod.name .. ' is enabled')
    if mods[mod.name] then
        log('Loading ' .. mod.name .. ' configuration')
        pcall(require, 'compatability.' .. mod.directory .. '.settings')
    end
end
