vim.lsp.enable({
  'pyright',
  'stylua',
  'ruff',
})

vim.diagnostic.config({
  -- virtual_text = { current_line = false },
  virtual_lines = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})


-- ручное добавление настройки для lsp-server
-- vim.lsp.config('rust_analyzer', {
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- })
