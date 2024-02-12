return {
  { "hdiniz/vim-gradle" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("lazyvim.config").icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = require("lazyvim.config").icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = require("lazyvim.config").icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = require("lazyvim.config").icons.diagnostics.Info,
          },
        },
      },
      servers = {
        marksman = {},
      },
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",

    opts = {
      ensure_installed = {
        "asm-lsp",
        "clangd",
        "markdownlint",
        "marksman",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "java-test",
        "java-debug-adapter",
        "zls",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "asm_lsp", "groovyls", "lua_ls", "rust_analyzer", "gradle_ls" } },
  },
}
