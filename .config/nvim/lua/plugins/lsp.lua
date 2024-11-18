return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable eslint formatting as it's slow and timing out on big projects
      -- taken from
      -- https://github.com/LazyVim/LazyVim/pull/4225/files
      setup = {
        eslint = function() end,
      },
    },
  },
}
