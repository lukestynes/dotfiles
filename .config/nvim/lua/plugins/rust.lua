return {
  -- Crates.nvim
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },
  -- Rustacean
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^5", -- Recommended
  --   lazy = false, -- This plugin is already lazy
  -- },
}
