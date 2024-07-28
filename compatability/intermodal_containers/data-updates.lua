if (mods['space-exploration']) then
    local data_util = require('__space-exploration__.data_util')

    log('Space Exploration detected, applying compatibility changes')

    -- Fix containerization 3 tech requiring production science pack to research, but isn't listed as a prerequisite
    if not data.raw.technology['ic-containerization-3'].prerequisites['production-science-pack'] then
        table.insert(data.raw.technology['ic-containerization-3'].prerequisites, 'production-science-pack')
    end

    -- Add containerization 4 tech, 100 count more than containerization 3, and requires utility science pack
    local containerization_4_technologyUnit = table.deepcopy(data.raw.technology['ic-containerization-3'].unit)
    containerization_4_technologyUnit.count = containerization_4_technologyUnit.count + 100
    table.insert(containerization_4_technologyUnit.ingredients, {'utility-science-pack', 1})

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
        prerequisites = {
            -- Ingredients
            'steel-processing',
            'electric-engine',
            'advanced-electronics-2',
            'ic-containerization-3',
            -- Sciences
            'logistic-science-pack',
            'chemical-science-pack',
            'se-rocket-science-pack',
            'space-science-pack',
            'production-science-pack',
            'utility-science-pack',
        },
        unit = containerization_4_technologyUnit,
        localised_name = 'Space containerization machine'
    })

    -- Add containerization 5 tech, 100 count more than containerization 4, and requires several space exploration sciences
    local containerization_5_technologyUnit = table.deepcopy(containerization_4_technologyUnit)
    containerization_5_technologyUnit.count = containerization_5_technologyUnit.count + 100

    -- Iterate over new required science packs and add them to the technology
    local containerization_5_new_sciences = {
        'se-astronomic-science-pack-4',
        'se-biological-science-pack-4',
        'se-energy-science-pack-4',
        'se-material-science-pack-4',
        'se-deep-space-science-pack-2',
    }
    for _, sciencePack in pairs(containerization_5_new_sciences) do
        table.insert(containerization_5_technologyUnit.ingredients, {sciencePack, 1})
    end    

    intermodal_containers.add_tier({
        tier = 5,
        ingredients = {
            {'ic-containerization-machine-4', 1},
            {'se-heavy-assembly', 8},
            {'se-quantum-processor', 8},
            {'se-heavy-girder', 15},
        },
        colour = {r = 0, g = 0, b = 0},
        upgrade = nil,
        speed = settings.startup["se-deep-space-belt-speed-2"].value / 15,
        prerequisites = {
            -- Ingredients
            'ic-containerization-4',
            'se-heavy-girder',
            'se-heavy-assembly',
            'se-quantum-processor',
            -- Sciences
            'se-deep-space-transport-belt',
            'logistic-science-pack',
            'chemical-science-pack',
            'se-rocket-science-pack',
            'space-science-pack',
            'production-science-pack',
            'utility-science-pack',
            'se-astronomic-science-pack-4',
            'se-biological-science-pack-4',
            'se-energy-science-pack-4',
            'se-material-science-pack-4',
            'se-deep-space-science-pack-2',
        },
        unit = containerization_5_technologyUnit,
        localised_name = 'Deep space containerization machine'
    })

    -- Prevent SpaceExploration from modifying the cost of the tech
    table.insert(se_procedural_tech_exclusions, "ic-containerization-5")

    -- Reduce container stack size, so that it's not more compact than straight steel plate
    data.raw.item['ic-container'].stack_size = 5

    -- Add a new recycle recipe inspired by the steel barrel recycling recipe
    data:extend({
        {
            type = 'recipe',
            name = config.mod_prefix .. 'intermodal-container-recycle',
            localised_name = {'recipe-names.' .. config.mod_prefix .. 'intermodal-container-recycling'},
            show_amount_in_title = false,
            enabled = false,
            ingredients = {
                {type = 'item', name = 'ic-container', amount = 1},
            },
            results = {
                {type = 'item', name = 'steel-plate', amount = 8},
            },
            hide_from_stats = true,
            energy_required = 1.5,
            order = 'b-d',
            group = 'intermediate-products',
            subgroup = 'recycling',
            category = 'hard-recycling',
            icons = data_util.transition_icons({
                icon = data.raw.item['ic-container'].icon,
                icon_size = data.raw.item['ic-container'].icon_size,
                scale = 0.5,
            }, {
                icon = data.raw.item["steel-plate"].icon,
                icon_size = data.raw.item["steel-plate"].icon_size,
                scale = 0.5,
            }),
            allow_as_intermediate = false,
            allow_intermediates = false,
            always_show_products = true,
        },
    })

    table.insert(data.raw.technology['se-recycling-facility'].effects, {
        type = 'unlock-recipe',
        recipe = config.mod_prefix .. 'intermodal-container-recycle',
    })

    -- Iterate over all cannonized items and add their containerized versions to the delivery cannon recipes
    local new_recipes = {}
    se_ic_containerized_cannon_recipes = se_ic_containerized_cannon_recipes or {}
    for _, resource in pairs(se_delivery_cannon_recipes) do
        local name = 'ic-container-' .. resource.name
        log('Adding ' .. name .. ' to containerized recipes')
        new_recipes[config.mod_prefix .. 'containerized-' .. resource.name] = {name = name}
        table.insert(se_ic_containerized_cannon_recipes, name)
    end

    -- Merge the new recipes array to the delivery cannon recipes
    for k, v in pairs(new_recipes) do
        log('Adding ' .. v.name .. ' to delivery cannon recipes')
        se_delivery_cannon_recipes[k] = v
    end
end
