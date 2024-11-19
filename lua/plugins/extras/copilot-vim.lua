-- NOTE: Only enable either copilot-vim or codeium-vim at the same time
return {
  -- Use native snippets from Neovim v0.10
  {
    "nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      -- Disable ghost text for nvim-cmp, use copilot suggestion instead
      opts.experimental.ghost_text = false
    end,
    keys = function()
      return {}
    end,
  },
  -- Setup copilot.vim
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      -- For copilot.vim
      -- enable copilot for specific filetypes
      vim.g.copilot_filetypes = {
        ["TelescopePrompt"] = false,
      }

      -- Set to true to assume that copilot is already mapped
      vim.g.copilot_assume_mapped = true
      -- Set workspace folders
      vim.g.copilot_workspace_folders = "~/projects"

      -- Setup keymaps
      local keymap = vim.keymap.set
      local opts = { silent = true }

      -- Set <C-y> to accept copilot suggestion
      keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

      -- Set <C-i> to accept line
      keymap("i", "<C-o>", "<Plug>(copilot-accept-line)", opts)

      -- Set <C-L> to accept word
      keymap("i", "<C-i>", "<Plug>(copilot-accept-word)", opts)

      -- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
      keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
      keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
      keymap("i", "<C-l>", "<Plug>(copilot-suggest)", opts)

      -- Set <C-d> to dismiss suggestion
      keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)
    end,
  },
  -- Add status line icon for copilot
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(
        opts.sections.lualine_x,
        2,
        LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
          local clients = package.loaded["copilot"] and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or {}
          if #clients > 0 then
            local status = require("copilot.api").status.data.status
            return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
          end
        end)
      )
    end,
  },
}
