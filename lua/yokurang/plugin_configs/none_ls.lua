local none_ls = require("null-ls")

local formatting = none_ls.builtins.formatting
local code_actions = none_ls.builtins.code_actions
local diagnostics = none_ls.builtins.diagnostics

local sources = {
	--[[ formatting ]]
	formatting.eslint_d,
	formatting.autopep8,
	formatting.stylua,
	formatting.stylelint,
	formatting.prettier,

	--[[ code actions ]]
	code_actions.eslint_d,
	code_actions.refactoring,

	--[[ diagnostics ]]
	diagnostics.eslint_d,
	diagnostics.flake8,
}

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use none-ls)
			return client.name == "none-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

none_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
