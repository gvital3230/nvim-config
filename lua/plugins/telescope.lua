return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- opts = {
      --   {
      --     auto_quoting = true, -- enable/disable auto-quoting
      --     -- define mappings, e.g.
      --     -- theme = "dropdown", -- use dropdown theme
      --     -- theme = { }, -- use own theme spec
      --     -- layout_config = { mirror=true }, -- mirror preview pane
      --     layout_config = {
      --       height = 0.5,
      --       width = 0.8,
      --       preview_cutoff = 120,
      --       preview_width = 0.6,
      --       prompt_position = "top",
      --     },
      --   },
      -- },
    },
  },
  keys = {
    { "<leader>sg", "<cmd>Telescope live_grep_args<CR>", desc = "Text" },
    {
      "<leader>fo",
      "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
      desc = "Find files with ignored",
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
            ["<C-c>"] = require("telescope.actions").close,
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
            ["<C-q>"] = function(...)
              require("telescope.actions").smart_send_to_qflist(...)
              require("telescope.actions").open_qflist(...)
            end,
            ["<CR>"] = require("telescope.actions").select_default,
          },
          n = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = function(...)
              require("telescope.actions").smart_send_to_qflist(...)
              require("telescope.actions").open_qflist(...)
            end,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-o>"] = require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --no-ignore ",
              }),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --iglob ",
              }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
    })

    telescope.load_extension("live_grep_args")
  end,
}
