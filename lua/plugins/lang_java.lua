return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            -- cmd = {
            --   "jdtls",
            --   "--jvm-arg=" .. string.format(
            --     "-javaagent:%s",
            --     vim.fn.expand("/Users/vital/.local/share/nvim/mason/share/lombok-nightly/lombok.jar")
            --   ),
            -- },
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({
              -- your nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
