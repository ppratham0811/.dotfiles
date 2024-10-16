local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust, rs"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      diagnostics = {
         enable = true;
      }
    }
  }
})

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- local function organize_imports()
--   local params = {
--     command = "_typescript.organizeImports",
--     arguments = {vim.api.nvim_buf_get_name(0)}
--   }
--   vim.lsp.buf.execute_command(params)
-- end
--
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     preferences = {
--       disableSuggestions = true,
--     }
--   },
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports",
--     }
--   }
-- }

-- lspconfig.tailwindcss.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

