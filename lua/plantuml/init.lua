local M = {}

--- @class PlantumlOpts
--- @field output_dir string
--- @field view string
--- @field auto_refresh boolean

local config = require("plantuml.config")

--- comment
--- @param opts PlantumlOpts
M.setup = function(opts)
	config.output_dir = opts.output_dir or config.output_dir
	config.view = opts.view or config.view
	config.auto_refresh = opts.auto_refresh or config.auto_refresh
end

return M
