return {
  {
    "catppuccin/nvim",
    lazy = false,
    opts = {
      transparent_background = true,
      transparent = true,
      styles = {
        sidebars = "transparent",
        float = "transparent",
      },
    },
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavor = "frappe",
        background = {
          light = "latte",
          dark = "frappe",
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
