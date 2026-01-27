vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })

keymap("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

local scroll_moves_cursor = true

if scroll_moves_cursor then
	keymap("n", "<ScrollWheelUp>", "k", { desc = "Scroll up" })
	keymap("n", "<ScrollWheelDown>", "j", { desc = "Scroll down" })
	keymap("v", "<ScrollWheelUp>", "k", { desc = "Scroll up" })
	keymap("v", "<ScrollWheelDown>", "j", { desc = "Scroll down" })
end
