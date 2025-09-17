return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
      formatters = {
        phpcbf = {
          -- A function that calculates the directory to run the command in
          cwd = require("conform.util").root_file({ "phpcs.xml" }),
          -- When cwd is not found, don't run the formatter (default false)
          require_cwd = true,
        },
      },
      log_level = vim.log.levels.ERROR,
      lsp_fallback = "always",
      timeout_ms = 10000,
    },
  },
}
