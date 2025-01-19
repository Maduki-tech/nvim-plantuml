local M = {}

--- @class PlantumlOpts
--- @field output_dir string
--- @field view string

local config = require("plantuml.config")

--- comment
--- @param opts PlantumlOpts
M.setup = function(opts)
	config.output_dir = opts.output_dir or config.output_dir
	config.view = opts.view or config.view
end

return M
