local M = { "nvim-treesitter/nvim-treesitter" }
function M.config()
  require("nvim-treesitter.configs").setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "typescript", "help" },
    --
    -- highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    -- swap = {
    --     enable = true,
    --     swap_next = {
    --       ["<leader>a"] = "@parameter.inner",
    --     },
    --     swap_previous = {
    --       ["<leader>A"] = "@parameter.inner",
    --     },
    --   },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
      disable = { "c", "ruby" }, -- optional, list of language that will be disabled
      -- [options]
    },
    -- },
  })
end

return M
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     config = function()
--       local list = require("nvim-treesitter.parsers").get_parser_configs()
--       list.lua = {
--         install_info = {
--           url = "https://github.com/tjdevries/tree-sitter-lua",
--           revision = "0e860f697901c9b610104eb61d3812755d5211fc",
--           files = { "src/parser.c", "src/scanner.c" },
--           branch = "master",
--         },
--       }
--       list.rsx = {
--         install_info = {
--           url = "https://github.com/tjdevries/tree-sitter-rsx",
--           files = { "src/parser.c", "src/scanner.cc" },
--           branch = "master",
--         },
--       }
--     end,
--   },
--   "nvim-treesitter/nvim-treesitter-textobjects",
--   "JoosepAlviste/nvim-ts-context-commentstring",
--   -- "nvim-treesitter/nvim-treesitter-context",
-- }
-- "vigoux/architext.nvim"
-- {
--     "mfussenegger/nvim-ts-hint-textobject",
--     config = function()
--       vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
--       vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
--     end,
--
