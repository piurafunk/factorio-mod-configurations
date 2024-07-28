if script.active_mods['space-exploration'] then
    mod_log('intermodal-containers <-> space-exploration: Space Exploration detected, applying compatibility changes')
    local spaceContainerizationResearchName = 'ic-containerization-4'

    local function setContainerizedCannonRecipesEnabled(research, enabled)
        for _, recipe in pairs(research.force.recipes) do
            if (string.match(recipe.name, 'se%-delivery%-cannon%-pack%-ic%-container%-.*')) then
                recipe.enabled = enabled
            end
        end
    end

    local function enableContainerizedCannonRecipes(research)
        if (research.name == spaceContainerizationResearchName) then
            setContainerizedCannonRecipesEnabled(research, true)
        end
    end

    local function disableContainerizedCannonRecipes(research)
        if (research.name == spaceContainerizationResearchName) then
            setContainerizedCannonRecipesEnabled(research, false)
        end
    end

    script.on_event(defines.events.on_research_finished, enableContainerizedCannonRecipes)
    script.on_event(defines.events.on_research_reversed, disableContainerizedCannonRecipes)

    local function checkContainerization4Research()
        for name, force in pairs(game.forces) do
            mod_log('intermodal-containers <-> space-exploration: checking containerization 4 research for force ' ..
                        force.name)
            if (force.technologies[spaceContainerizationResearchName].researched) then
                mod_log('intermodal-containers <-> space-exploration: containerization 4 research already researched for force ' .. force.name)
                enableContainerizedCannonRecipes(force.technologies[spaceContainerizationResearchName])
            end
        end
    end

    local function onConfigurationChanged()
        checkContainerization4Research()
    end

    script.on_configuration_changed(onConfigurationChanged)
end
