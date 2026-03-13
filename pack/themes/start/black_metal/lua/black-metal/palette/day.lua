local M = {}

M.get = function()
    local Config = require("black-metal").options()
    ---@type black-metal.Theme
    local c = require("black-metal.palette")[Config.theme]
    local Util = require("black-metal.util")
    return Util.generate_light_variant(vim.deepcopy(c))
end

return M
