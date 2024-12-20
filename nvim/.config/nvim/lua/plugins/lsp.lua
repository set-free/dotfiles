return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        ensure_installed = {
          'ruff',
          'pyright',
          'lua_ls',
          'groovyls',
          'eslint',
          'yamlls',
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.stylua.setup({
        capabilities = capabilities,
      })
      --lspconfig.lua_ls.setup({
      --  capabilities = capabilities,
      --})
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = { disableOrganizeImports = true }, -- Using Ruff's import organizer
          python = { analysis = { ignore = { '*' } } }, -- Ignore all files for analysis to exclusively use Ruff for linting
        },
      })
      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            on_attach = on_attach,
            args = {}, -- Any extra CLI arguments for `ruff` go here.
          },
        },
      })
      ------------------- Hotkeys for LSP -----------------
      --- Документация к LSP серверам -> `:h vim.lsp.buf`
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    end,
  },
}
