function process_stage(stage)
    local compatibleMods = require('compatability.mods')
    for key, mod in pairs(compatibleMods) do
        log('Checking if ' .. mod .. ' is enabled')
        if mods[mod] then
            log('Loading ' .. mod .. ' ' .. stage .. ' stage')
            require('compatability.' .. key .. '.' .. stage)
        end
    end
end

return {
    mod_prefix = 'mod-configurations-',
    magic_constant = (1 + 1 / 3) / 10 / 64, -- Whatever the math is, multiplying by this translates "items/second" to the game engine's expected value
    belt_speed_divisor = 480, -- Divide the belt's item/second speed by this to get the engine's expected value. For example, yellow belt should be set to 15/480 by default
}
