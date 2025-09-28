return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
      formatters = {
        ["google-java-format"] = {
          -- Use AOSP style instead of Google Style (4-space indentation).
          prepend_args = { "--aosp" },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      -- Just override the Java executable path
      cmd = {
        vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
        "--java-executable",
        vim.fn.expand("~/.sdkman/candidates/java/21.0.8-amzn/bin/java"),
      },
      -- settings = {
      --   java = {
      --     home = "~/.sdkman/candidates/java/21.0.8-amzn/bin/java",
      --   },
      -- },
    },
  },
}
