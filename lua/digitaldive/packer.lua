require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP CONFIG
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use "jose-elias-alvarez/null-ls.nvim"
  -- use { -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   requires = {
  --     -- Automatically install LSPs to stdpath for neovim:
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',
  --     -- Useful status updates for LSP
  --     'j-hui/fidget.nvim',
  --     -- Additional lua configuration, makes nvim stuff amazing
  --     'folke/neodev.nvim',
  --   },
  -- }
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }


-- treesitter config
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  -- -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'



  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  -- use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  --  Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- "princejoogie/dir-telescope.nvim",
    }
  }
  use { "princejoogie/dir-telescope.nvim" }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" }
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { "nvim-telescope/telescope-smart-history.nvim" }
  use { "nvim-telescope/telescope-smart-history.nvim" }
  use { "cbochs/grapple.nvim" }
  use { 'LionC/nest.nvim' }
  use {
    'nyngwang/NeoRoot.lua',
    config = function()
      require('neo-root').setup {
        CUR_MODE = 2 -- 1 for file/buffer mode, 2 for proj-mode
      }
    end
  }

  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use { 'folke/tokyonight.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'Shatur/neovim-ayu' }
  use { 'savq/melange' }
  use { 'NTBBloodbath/doom-one.nvim' }
  use { 'sainnhe/gruvbox-material' }
  use { 'sainnhe/everforest' }
  use {
    'rose-pine/neovim',
    as = 'rose-pine'
  }
  use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim'
  use 'morhetz/gruvbox'

  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'stevearc/dressing.nvim'
  use { "folke/which-key.nvim" }
  use 'terrortylor/nvim-comment'
  use { "catppuccin/nvim", as = "catppuccin" }

  use({
    'ray-x/navigator.lua',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },
  })

  use 'ThePrimeagen/vim-be-good'
  -- use "kevinhwang91/nvim-bqf"
  use "nvim-treesitter/nvim-treesitter-context"
  -- use 'wellle/targets.vim'
  use "kylechui/nvim-surround"
  -- use 'andymass/vim-matchup'
  use "gelguy/wilder.nvim"
  use 'mbbill/undotree'
  use "karb94/neoscroll.nvim"
  use "sindrets/diffview.nvim"
  use "edluffy/specs.nvim"
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)
