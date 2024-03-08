return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    -- priority = 1000,
    opts = {
      flavour = "mocha",
      term_colors = false,
      background = {
        dark = "mocha",
      },
      --color_overrides = {
      --  all = {
      -- text = "#ffffff",
      --  },
      --},
      -- dim_inactive = {
      --  enabled = true, -- dims the background color of inactive window
      --  shade = "dark",
      --  percentage = 0.15, -- percentage of the shade to apply to the inactive window
      --},
      transparent_background = false,
      custom_highlights = function(color)
        local neotree_bg = "#111111"
        return {
          --NormalFloat = { fg = "red", bg = color.none },
          NeotreeNormal = { bg = neotree_bg },
          NeotreeNormalNC = { bg = neotree_bg },
          NeotreeNormalFloat = { bg = neotree_bg },
          -- NotifyINFOTitle3 = { fg = "#ffffff" },

          -- WinSeparator = { bg = "#111111", fg = "#222222" },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        treesitter = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  },
}
