return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "quicknotes",
        path = "~/Documents/Vaults/quicknotes",
      },
      {
        name = "cpp",
        path = "~/Documents/Vaults/cpp",
      },
      {
        name = "neovim",
        path = "~/Documents/Vaults/nvim",
      },
      {
        name = "books",
        path = "~/Documents/Vaults/writting/",
      },
    },

    ui = { enable = false  }
    -- see below for full list of options 👇
  },
}
