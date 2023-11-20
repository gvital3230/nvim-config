return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "phpdoc" })
      end
    end,
  },
  -- Ensure PHP tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "phpcbf", "phpcs", "php-debug-adapter" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["php"] = { "intelephense", "phpcbf" },
      },
      formatters = {
        phpcbf = {
          -- A function that calculates the directory to run the command in
          cwd = require("conform.util").root_file({ "phpcs.xml" }),
          -- When cwd is not found, don't run the formatter (default false)
          require_cwd = true,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#PHP
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { mason_path .. "packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          name = "Listen for Xdebug (in docker)",
          type = "php",
          request = "launch",
          port = 9003,
          pathMappings = {
            ["/var/www/html/"] = "${workspaceFolder}",
          },
        },
        {
          name = "Listen for Xdebug (local)",
          type = "php",
          request = "launch",
          port = 9003,
        },
        {
          name = "Debug currently open script",
          type = "php",
          request = "launch",
          port = 9003,
          cwd = "${fileDirname}",
          program = "${file}",
          runtimeExecutable = "php",
          runtimeArgs = {
            "-dxdebug.start_with_request=yes",
          },
          env = {
            XDEBUG_MODE = "debug,develop",
            XDEBUG_CONFIG = "client_port=${port}",
          },
        },
      }
    end,
  },
}
