return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "phpdoc" })
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
    },
  },
  -- Ensure PHP tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "php-debug-adapter" })
    end,
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
