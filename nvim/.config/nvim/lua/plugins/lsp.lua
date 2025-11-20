return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        ensure_installed = { 'ruff', 'pyright', 'lua_ls', 'eslint', 'yamlls', 'rust_analyzer'}
    })

    vim.diagnostic.config({
      -- virtual_text = true,
      -- virtual_text = { current_line = false },
      virtual_lines = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    end,
  },
}
