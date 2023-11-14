return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- "joosepalviste/nvim-ts-context-commentstring",
      -- "nvim-treesitter/nvim-treesitter-angular",
    },
    opts = function(_, opts)
      -- add tsx and treesitter
      opts.context_commentstring = {
        enable = true,
      }
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "json",
        "json5",
        "jsonc",
        -- "angular",
      })
    end,
  },
}
