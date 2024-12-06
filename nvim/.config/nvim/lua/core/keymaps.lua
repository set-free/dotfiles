local k = vim.keymap
local v = vim
-- global leader key is <Space> 
v.g.mapleader = " "

--- {n - normal mode}, {пробел_pv - хоткей}, {выполняемая команда}
k.set("n", "<leader>pv", v.cmd.Ex)

-- in normal mode, use <space>v or <space>sh to run specific commands 
k.set("n", "<leader>sv", "<C-w>v") -- to split the screen vertically
k.set("n", "<leader>sh", "<C-w>s") -- splits screen horizontally

-- упревлние буферами(похожи на табы сверху)  
k.set("n", "<leader>bp", v.cmd.bprevious)
k.set("n", "<leader>bn", v.cmd.bnext)

k.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

-- Exit insert mode without hitting Esc
k.set("i", "jj", "<Esc><Esc>", { desc = "Esc" })

------------ Telescope keymapings (grep для neovim)
--find files 
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") 
-- live grep 
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") 
-- find string under cursor 
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") 
-- display list of open buffers
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, {desc= "[?] Find recently"})


-- Resize with arrows
-- k.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
-- k.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
-- k.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
-- k.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Copy file paths
k.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
k.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Make current file executable
-- k.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- close buffer
k.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })
-- Close buffer without closing split
k.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

