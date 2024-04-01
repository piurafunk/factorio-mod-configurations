config = require('config')

-- Create table of mods we support
local compatibleMods = require('compatability.mods')

-- Iterate over supported mods, and if they are installed, load their respective configuration file
process_stage('data-updates')
