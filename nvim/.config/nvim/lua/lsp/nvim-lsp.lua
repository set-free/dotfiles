local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable({
  'pyright',
-- 'stylua',
  'luals',
  'ruff',
  'rust-analyzer',
})

vim.diagnostic.config({
  -- virtual_text = { current_line = false },
  virtual_lines = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

-- ручное добавление настройки для lsp-server
-- Example #1
-- vim.lsp.config.clangd = {
--   cmd = { 'clangd', '--background-index' },
--   root_markers = { 'compile_commands.json', 'compile_flags.txt' },
--   filetypes = { 'c', 'cpp' },
-- }
--
vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.config['pyright'] = {
  capabilities = capabilities
}

-- Autocompletion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

----------------------------------------------------------------------------------
-- For Astral Ty
-- vim.lsp.config('ty', { settings = { ['ty'] = { experimental = { rename = true } } } })

-- formatters
--  {
--    "stevearc/conform.nvim",
--    config = function()
--      require("conform").setup({
--        -- Use `:help formatters` to see a list of builtin formatters
--        formatters_by_ft = {
--          python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
--          terraform = { "tofu_fmt" },
--        },
--        format_on_save = {
--          lsp_fallback = true,
--          async = false,
--          timeout_ms = 1000,
--        },
--      })
--    end,
--  },
