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
}
