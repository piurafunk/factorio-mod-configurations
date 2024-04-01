if (mods['space-exploration']) then
    log('Space Exploration detected, applying compatibility changes')

    -- Fix containerization 3 tech requiring production science pack to research, but isn't listed as a prerequisite
    if not data.raw.technology['ic-containerization-3'].prerequisites['production-science-pack'] then
        table.insert(data.raw.technology['ic-containerization-3'].prerequisites, 'production-science-pack')
    end

    -- Add containerization 4 tech, 100 count more than containerization 3, and requires utility science pack
    local technologyUnit = table.deepcopy(data.raw.technology['ic-containerization-3'].unit)
    technologyUnit.count = technologyUnit.count + 100
    table.insert(technologyUnit.ingredients, {'utility-science-pack', 1})

    intermodal_containers.add_tier({
        tier = 4,
        ingredients = {
            {'ic-containerization-machine-3', 1},
            {'electric-engine-unit', 8},
            {'processing-unit', 8},
            {'steel-plate', 50}
        },
        colour = {r = 1, g = 1, b = 1},
        upgrade = nil,
        speed = settings.startup[config.mod_prefix .. "space-belt-speed"].value / 15,
        prerequisites = {'advanced-electronics-2', 'electric-engine', 'ic-containerization-3', 'utility-science-pack', 'steel-processing'},
        unit = technologyUnit,
    })
end
