--keymaps

--leader key set
vim.g.mapleader = " "


--locals variables
local keymap = vim.keymap -- for conciseness

--highlight selected text
keymap.set("v", "<leader>se", '"xy/<C-r>x\\><CR>N')

-- macros
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", ";", ":", { desc = "move to command mode with ; instead of : " })
keymap.set('n', '<C-s>', ':w<CR>')
keymap.set('n', '<C-q>', ':q<CR>')
keymap.set('n', '<LEADER>qq', ':qa<CR>')


keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<A-k>", ":m .-2<CR>", { desc = "move line up" })
keymap.set("v", "<A-k>", ":m -2<CR>gv", { desc = "move selected text up" })
keymap.set("n", "<A-j>", ":m .+1<CR>", { desc = "move line down" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv", { desc = "Move selected text down" })

--source line/s or file
vim.keymap.set("n", "<LEADER><LEADER>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<LEADER>x", ":.lua<CR>")
vim.keymap.set("v", "<LEADER>x", ":lua<CR>")

