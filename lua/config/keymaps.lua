-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- jk for easy ESC
vim.keymap.set({ "i", "v" }, "jk", "<ESC>")

-- Resize with arrows - remap from default LazyVim
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")

vim.keymap.set("n", "<A-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<A-Down>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>")

-- Terminal window navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- delete lazyvim default mappings
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.del("n", "<leader>ur")
vim.keymap.set(
  "n",
  "<leader>h",
  "<cmd>nohlsearch<bar>diffupdate<bar>normal! <c-l><cr>",
  { desc = "redraw / clear hlsearch / diff update" }
)

-- unset defalut windows mappings
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

-- quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Prev buffer" })

-- unset default tabs mappings
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })

-- Launch DAP serve for lua
-- @TODO make it more generic
vim.keymap.set("n", "<F5>", "<cmd>lua require'osv'.launch({port = 8086})<CR>", { desc = "Launch lua DAP server" })

vim.keymap.set(
  "n",
  "<leader>fo",
  "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
  { desc = "Find files with ignored" }
)
vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep_args<CR>", { desc = "Text" })
