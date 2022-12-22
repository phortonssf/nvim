local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

require("packer").startup({
  function(use)
    -- ####### CORE #######
    use 'lewis6991/impatient.nvim' --faster load times
    use 'wbthomason/packer.nvim' -- Package manager
    use {'mbbill/undotree'}

    -- language server
    use 'onsails/lspkind-nvim'

    -- use('hrsh7th/nvim-cmp')
    -- use('hrsh7th/cmp-buffer')
    -- use('hrsh7th/cmp-path')
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-cmdline'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
    -- Useful status updates for LSP
    use 'j-hui/fidget.nvim'

    -- MORE LSP SETTINGS
    use {'jose-elias-alvarez/nvim-lsp-ts-utils'}
    use{'jose-elias-alvarez/null-ls.nvim'}
    use 'folke/lsp-colors.nvim'

    -- TREESITTER
    use 'nvim-lua/plenary.nvim'
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management
    use { "nvim-zh/better-escape.vim", event = { "InsertEnter" } }

    -- Language Plugins
    use {
      "cuducos/yaml.nvim",
      ft = {"yaml"}, -- optional
      requires = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim" -- optional
      },
      config = function ()
        require("yaml_nvim").init()
      end,
    }
    -- docker file syntax
    use 'ekalinin/Dockerfile.vim'
    -- markdown preview
    use {"ellisonleao/glow.nvim"}
    -- terraform completion
    use 'juliosueiras/vim-terraform-completion'
    use 'hashivim/vim-terraform'
    use 'vim-syntastic/syntastic'
    use 'neomake/neomake'
    -- Lua
    use({
      "olimorris/persisted.nvim",
      --module = "persisted", -- For lazy loading
      config = function()
      end,
    })
    -- GIT
    -- -- Add git related info in the signs columns and popups
    --
    use {'christoomey/vim-conflicted'}
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    -- use 'ruanyl/vim-gh-line' -- open current line in github/
    use {
      'ldelossa/gh.nvim',
      requires =  { 'ldelossa/litee.nvim'  }
    }
    use 'f-person/git-blame.nvim'
    use { "nvim-telescope/telescope-github.nvim" }
    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function ()
        require"octo".setup()
      end
    }
    use {'rhysd/committia.vim'}

    use {'RRethy/vim-illuminate'}

      -- Manage your yank history
    use({
      "gbprod/yanky.nvim",
      config = [[require('config.yanky')]]
    })
-- Map keys
    use {
      "folke/which-key.nvim",
      config = function()
        -- require("which-key").setup {
        --   -- your configuration comes here
        --   -- or leave it empty to use the default settings
        --   -- refer to the configuration section below
        -- }
      end
    }
    use({
      'mrjones2014/legendary.nvim'
      -- sqlite is only needed if you want to use frecency sorting
      -- requires = 'kkharji/sqlite.lua'
    })
    use {
      "lazytanuki/nvim-mapper",
      config = function() require("nvim-mapper").setup{} end,
      before = "telescope.nvim"
    }
    -- Lua
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Highlight URLs inside vim
    use { "itchyny/vim-highlighturl", event = "VimEnter" }
    use 'eandrju/cellular-automaton.nvim'

    -- TELESCOPE
    use { 'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {'nvim-telescope/telescope-live-grep-args.nvim'}
    use { "nvim-telescope/telescope-file-browser.nvim" } -- file_browser
    use {'cljoly/telescope-repo.nvim'}
    use {'nvim-telescope/telescope-project.nvim'}
    use { "LinArcX/telescope-command-palette.nvim" }
    use {"nvim-telescope/telescope-ui-select.nvim"}
    -- STATUSLINES
    -- use 'itchyny/lightline.vim' -- Fancier statusline
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --bufferline
    use({
      "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
      end,
    })
    use { "gelguy/wilder.nvim"}
    use('tpope/vim-eunuch') -- Unix commands
    use('folke/trouble.nvim') -- quickfix list
    use 'karb94/neoscroll.nvim' -- smooth scroll
    use { 'ThePrimeagen/vim-be-good'}
    use { 'ThePrimeagen/harpoon'}

    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()

      end
    })
   -- use 'tpope/vim-surround' -- add )}] around
    use 'wellle/targets.vim' -- adds more text targets (, etc
    -- better % matches
    use {
      'andymass/vim-matchup',
          setup = function()
          end
    }
    use 'kyazdani42/nvim-web-devicons' --icons
    -- highlight cursor on move
    use {'edluffy/specs.nvim'}

    use {
      "folke/zen-mode.nvim",    -- fullscreen mode
      config = function()
        require("zen-mode").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {'ayosec/hltermpaste.vim'}      -- highlight after paste from ctrl-shift-v
    use 'lukas-reineke/indent-blankline.nvim'    -- Add indentation guides even on blank lines
    -- use {'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins'}
    -- Echoes the path to the identifier under the cursor.
    use 'mogelbrod/vim-jsonpath'
    use {'stevearc/dressing.nvim'}
    -- THEMES
    use { 'folke/tokyonight.nvim'}
    use { 'EdenEast/nightfox.nvim'}
    use { 'Shatur/neovim-ayu'}
    use { 'savq/melange'}
    use { 'NTBBloodbath/doom-one.nvim' }
    use {'sainnhe/gruvbox-material'}
    use {'sainnhe/everforest'}
    use {
      'rose-pine/neovim',
       as = 'rose-pine'
    }
    use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
    use 'nvim-lualine/lualine.nvim'
    use 'morhetz/gruvbox'

  end,
  config = {
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  },
})

-- use terminal colors
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox-material ]]

-- old lightline settings
-- vim.g.lightline = {
--   colorscheme = 'gruvbox_material',
--   active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'gitsigns', 'readonly', 'filename', 'modified' } } },
--   component_function = { gitbranch = 'FugitiveHead', gitsigns = "GitSigns" },
-- }

local result = vim.api.nvim_exec(
  [[
  let g:better_escape_shortcut = ['kk', 'jj']
   " settings for highlight after paste ctrl-shift-v
  let g:hltermpaste_timeout = 3000
  let g:hltermpaste_match_group = "DiffAdd"

 " old light line settings
 " let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be " }
 " let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
 " let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
 " let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

]], false
)
vim.keymap.set('n', '<C-k>', ":bprev<CR>", {})
--Enable mouse mode
vim.o.mouse = 'a'

require"octo".setup()
require('litee.lib').setup({})
require('litee.gh').setup({})
require('legendary').setup({
  keymaps = {
    -- map keys to a command
    { '<leader>ff', ':Telescope find_files', description = 'Find files' },
    -- map keys to a function
    { '<leader>h', function() print('hello world!') end, description = 'Say hello' },
    -- keymaps have opts.silent = true by default, but you can override it
    { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
    -- create keymaps with different implementations per-mode
    {
      '<leader>c',
      { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
      description = 'Toggle comment'
    },
    -- create item groups to create sub-menus in the finder
    -- note that only keymaps, commands, and functions
    -- can be added to item groups
    {
      -- groups with same itemgroup will be merged
      itemgroup = 'short ID',
      description = 'A submenu of items...',
      icon = '',
      keymaps = {
        -- more keymaps here
      },
    },
  },
})
-- local wk = require("which-key")
-- local leader_opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },
--  leader_opts
-- })
require("persisted").setup({
  save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
  command = "VimLeavePre", -- the autocommand for which the session is saved
  silent = false, -- silent nvim message when sourcing session file
  use_git_branch = false, -- create session files based on the branch of the git enabled repository
  autosave = true, -- automatically save session files when exiting Neovim
  should_autosave = nil, -- function to determine if a session should be autosaved
  autoload = true, -- automatically load the session for the cwd on Neovim startup
  on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
  follow_cwd = true, -- change session file name to match current working directory if it changes
  allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
  ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
  before_save = nil, -- function to run before the session is saved to disk
  after_save = nil, -- function to run after the session is saved to disk
  after_source = nil, -- function to run after the session is sourced
  telescope = { -- options for the telescope extension
    before_source = nil, -- function to run before the session is sourced via telescope
    after_source = nil, -- function to run after the session is sourced via telescope
    reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
  },
})
vim.g.matchup_surround_enabled = 1
