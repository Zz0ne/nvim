local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("core.packer_config.lsp.mason")
require("core.packer_config.lsp.handlers").setup()
require("core.packer_config.lsp.null-ls")
require("core.packer_config.lsp.lsp-config")
require("core.packer_config.lsp.hover")
require("core.packer_config.lsp.dap-ui")
