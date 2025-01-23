local renderer = require("plantuml.render")

local plantuml_commands = {
	preview = function()
		renderer.preview()
	end,
	export = function(args)
		--- @type PlantumlExportType
		local format = args[1] or "png"
		renderer.export(format)
	end,
}

local export_formats = { "png", "svg" }

vim.api.nvim_create_user_command("PlantUML", function(opts)
	local subcommand = opts.fargs[1]
	local command_fn = plantuml_commands[subcommand]

	if command_fn then
		table.remove(opts.fargs, 1)
		command_fn(opts.fargs)
	else
		vim.notify("Invalid Subcommand", vim.log.levels.WARN)
	end
end, {
	nargs = "+",
	complete = function(_, cmd_line, _)
		local args = vim.split(cmd_line, "%s+")
		if #args == 2 then
			return { "preview", "export" }
		elseif #args == 3 and args[2] == "export" then
			return export_formats
		end
		return {}
	end,
	desc = "PlantUML commands",
})
