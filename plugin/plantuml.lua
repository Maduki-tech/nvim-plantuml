vim.api.nvim_create_user_command("PlantUMLPreview", function()
	require("plantuml.render").preview()
end, {})
