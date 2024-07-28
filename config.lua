function process_stage(stage)
    mod_log('Processing ' .. stage .. ' stage')
    local compatibleMods = require('compatability.mods')
    local activeMods = mods or script.active_mods or {}
    for key, mod in pairs(compatibleMods) do
        mod_log('Checking if ' .. mod .. ' is enabled')
        if activeMods[mod] then
            mod_log('Loading ' .. mod .. ' ' .. stage .. ' stage')
            require('compatability.' .. key .. '.' .. stage)
        else
            mod_log(mod .. ' is not enabled')
        end
    end
end

function mod_log(string)
    log('[mod-configurations] ' .. string)
end

return {
    mod_prefix = 'mod-configurations-',
    magic_constant = (1 + 1 / 3) / 10 / 64, -- Whatever the math is, multiplying by this translates "items/second" to the game engine's expected value
    belt_speed_divisor = 480, -- Divide the belt's item/second speed by this to get the engine's expected value. For example, yellow belt should be set to 15/480 by default
}
