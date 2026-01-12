return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
    local config = require 'nvim-treesitter.configs'
    config.setup {
      ensure_installed = {
        'rust',
        'go',
        'python',
        'json',
        'toml',
        'yaml',
        'lua',
        'vim',
        'vimdoc',
        'markdown',
        'markdown_inline',
        'javascript',
        'groovy',
        'html',
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
