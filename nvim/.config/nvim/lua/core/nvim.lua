local o = vim.opt
local g = vim.g

-- Требует наличия xclip или wl-copy!
o.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard

o.fileencoding = 'utf-8' -- the encoding written to a file
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.mouse = 'a' -- allow the mouse to be used in neovim
o.showtabline = 2 -- always show tabs (nvim tabs)
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.termguicolors = true -- set term gui colors (most terminals support this)
o.undofile = true -- enable persistent undo
o.cursorline = true -- highlight the current line
o.number = true -- set numbered lines
o.relativenumber = true -- set relative (number line from current)
o.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time
o.wrap = false -- display lines as one long line
o.listchars = 'tab: ,multispace:|   ,eol:󰌑'

o.spell = false
o.spelllang = { 'en_us', 'ru' } -- Словари рус eng
o.bufhidden = 'hide' -- не показывать буферы

o.wildmenu = true
o.wildmode = 'longest:full,full'

-- Форматирование при сохранении
--vim.api.nvim_create_autocmd("BufWritePre", {
--  callback = function()
--    vim.lsp.buf.format {
--      async = false
--    }
--  end,
--})

-- Показывать всплывающие окна с ошибками при наведении курсора
-- 5 sec.
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

-- Подсветка копируемого текста
local ag = vim.api.nvim_create_augroup
local highlight_group = ag('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
  group = highlight_group,
})

-- pretty icon for diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    }
  }
})

-- o.colorcolumn = "120"             -- Линиия ограничения
-- Не автокомментировать новые линии при переходе на новую строку
-- vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

--- Пример как делать vim.cmd
-- vim.cmd("set tabstop=2")

--- Ещё один пример
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

-- <CR> означает нажать enter
-- использовать русские буквы

-- set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё/|
