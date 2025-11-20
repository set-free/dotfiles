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

-- Ctrl-S по умолчанию в режиме редактирования вызывает справку(парметры для функции например)
-- Так же нам не нужны никакие плагины для комментариев — для этого есть сочетание gc (выделить и нажать gc)

--  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd(
	"LspAttach",
	{
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }

			k.set('n', 'K', vim.lsp.buf.hover, opts)
			k.set('n', 'gd', vim.lsp.buf.definition, opts)
			k.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			k.set("n", "gi", vim.lsp.buf.implementation, opts)

			k.set('n', '<F2>', vim.lsp.buf.rename, opts)
			k.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
			-- format text
			k.set('n', '<leader>gf', function() vim.lsp.buf.format({ async = true }) end, opts)
			k.set('n', '<leader>li', '<cmd>LspInfo<CR>', opts)
			k.set("n", "gr", vim.lsp.buf.references, opts)
			-- Open the diagnostic under the cursor in a float window
			k.set("n", "<leader>d", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts)
		end,
	}
)

------------------- Hotkeys for LSP -----------------
--- Документация к LSP серверам -> `:h vim.lsp.buf`
--k.set('n', 'K', vim.lsp.buf.hover, {})
--k.set('n', 'gd', vim.lsp.buf.definition, {})
--k.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
--
--k.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--k.set('n', '<leader>gf', vim.lsp.buf.format, {})    -- форматировать текст
--k.set('n', '<leader>li', '<cmd>LspInfo<CR>', opts)
--k.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
