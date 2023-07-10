local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach =  cmp_nvim_lsp.on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
