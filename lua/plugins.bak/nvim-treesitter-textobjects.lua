-- nvim-treesitter-textobjects is installed by default in Lazyvim
-- here we are defigning some new keymaps
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    textobjects = {
      move = {
        enable = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]o"] = "@loop.*",
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[o"] = "@loop.*",
          ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
          ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  },
}
