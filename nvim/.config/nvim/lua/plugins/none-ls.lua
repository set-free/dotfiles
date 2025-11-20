return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.mypy.with({
           extra_args = function()
           local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
           return { "--python-executable", virtual .. "/bin/python3" }
           end,
        }),
        null_ls.builtins.completion.nvim_snippets,
        -- null_ls.builtins.formatting.luals,
        null_ls.builtins.completion.spell,
        -- null_ls.builtins.formatting.ruff,
        -- null_ls.builtins.diagnostics.ruff,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    }
  end,
}
