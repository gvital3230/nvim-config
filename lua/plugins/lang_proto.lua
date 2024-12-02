return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        proto = { "buf" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        pbls = {
          capabilities = {
            -- it complains about this
            -- https://github.com/LazyVim/LazyVim/issues/3028
            offsetEncoding = { "utf-16" },
          },
        },
      },
    },
  },
}
