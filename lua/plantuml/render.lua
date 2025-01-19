local config = require("plantuml.config")

local M = {}

local function isPumlFile()
	local bufname = vim.api.nvim_buf_get_name(0)
	return bufname:match("%.puml")
end

M.preview = function()
	if not isPumlFile() then
		vim.notify("Only `.puml` file is supportet for now", vim.log.levels.ERROR, {})
		return
	end

	local buf = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local uml_file = config.output_dir .. "/diagram.puml"
	local output_file = config.output_dir .. "/diagram.png"

	local uml = table.concat(lines, "\n")
	local file = io.open(uml_file, "w")

	if file == nil then
		return
	end

	file:write(uml)
	file:close()

	local cmd = string.format("plantuml -tpng %s -o %s", uml_file, config.output_dir)
	os.execute(cmd)

	os.execute(string.format("%s %s", config.viewer, output_file))
end

return M
