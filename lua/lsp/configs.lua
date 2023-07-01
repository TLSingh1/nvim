local lspconfig = require("lspconfig")

local servers = {
	"jsonls",
	"lua_ls",
	"rust_analyzer",
	"tsserver",
	"cssls",
	"html",
	"svelte",
	"tailwindcss",
	"gopls",
	"golangci_lint_ls",
	"marksman",
  "vuels",
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
