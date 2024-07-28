if (mods['space-exploration']) then
    for _, recipeName in pairs(se_ic_containerized_cannon_recipes) do
        -- Disable cannonized containerized resources initially, re-unlock based on tech researched
        if (data.raw.recipe['se-delivery-cannon-pack-' .. recipeName]) then
            data.raw.recipe['se-delivery-cannon-pack-' .. recipeName].enabled = false
        end
    end
end
