return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
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
          ["<C-n>"] = require("telescope.actions").move_selection_next,
          ["<C-p>"] = require("telescope.actions").move_selection_previous,
          ["<C-q>"] = function(...)
            require("telescope.actions").smart_send_to_qflist(...)
            require("telescope.actions").open_qflist(...)
          end,
        },
      },
    },
  },
}
