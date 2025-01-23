local config = require("plantuml.config")

--- @enum PlantumlExportType
local PlantumlExportType = {
	png = "png",
	svg = "svg",
}

local M = {}

local function isPumlFile()
	local bufname = vim.api.nvim_buf_get_name(0)
	return bufname:match("%.puml")
end

local function renderAndPreview()
	if not vim.fn.executable("plantuml") then
		vim.notify("Plantuml is not installed or not in the Path", vim.log.levels.ERROR)
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

M.preview = function()
	if not isPumlFile() then
		vim.notify("Only `.puml` file is supportet for now", vim.log.levels.ERROR, {})
		return
	end

	renderAndPreview()

	if config.auto_refresh then
		vim.api.nvim_create_autocmd("BufWritePost", {
			buffer = vim.api.nvim_get_current_buf(),
			callback = function()
				renderAndPreview()
			end,
		})
	end
end

--- @param type PlantumlExportType
M.export = function(type)
	-- TODO: add input request to ask where to save
	if type == "png" then
		vim.print("PNG")
	elseif type == "svg" then
		vim.print("SVG")
	end
end

return M
