return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		local rust_tools = require("rust-tools")
		rust_tools.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
				end,
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
			tools = { -- rust-tools options
				autoSetHints = true,
				reload_workspace_from_cargo_toml = true,
				runnables = {
					use_telescope = true,
				},
				inlay_hints = {
					show_parameter_hints = true,
					parameter_hints_prefix = "<-",
					other_hints_prefix = "=>",
				},
			},
		})
		rust_tools.inlay_hints.enable()
		rust_tools.runnables.runnables()
		rust_tools.hover_actions.hover_actions()
		rust_tools.hover_range.hover_range()
		rust_tools.open_cargo_toml.open_cargo_toml()
		rust_tools.parent_module.parent_module()
		rust_tools.join_lines.join_lines()
	end,
}
