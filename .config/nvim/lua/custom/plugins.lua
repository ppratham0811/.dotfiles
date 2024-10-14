local plugins = {
  {
    "nvimtools/none-ls.nvim",
    config = function ()
      require("custom.configs.null-ls")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "lua-language-server",
        "eslint-lsp",
        "prettier",
        "rust-analyzer",
        "pyright"
      }
    }
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, {name="crates"})
      return M
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require("custom.configs.dashboard")
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  }
  -- {
  --   "ellisonleao/carbon-now.nvim",
  --   lazy = true,
  --   cmd = "CarbonNow",
  --   opts = {}
  -- },
  -- {
  --   "startup-nvim/startup.nvim",
  --   requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  --   config = function()
  --     require("startup").setup()
  --   end
  -- }
}

return plugins
