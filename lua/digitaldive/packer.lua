local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
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

    -- Map keys
    use {
      "lazytanuki/nvim-mapper",
      config = function() require("nvim-mapper").setup{} end,
      before = "telescope.nvim"
    }
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
    }    use('jose-elias-alvarez/nvim-lsp-ts-utils')
    use('jose-elias-alvarez/null-ls.nvim')
    use 'folke/lsp-colors.nvim'

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

    -- GIT
    -- -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    -- use 'ruanyl/vim-gh-line' -- open current line in github/
    use 'f-person/git-blame.nvim'
    use { "LinArcX/telescope-command-palette.nvim" }
    use 'nvim-lua/plenary.nvim'

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management

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
    -- TELESCOPE
    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "nvim-telescope/telescope-file-browser.nvim" } -- file_browser
    use {'cljoly/telescope-repo.nvim'}
    use {'nvim-telescope/telescope-project.nvim'}


    -- STATUSLINES
    use 'itchyny/lightline.vim' -- Fancier statusline
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --bufferline

    use({"gelguy/wilder.nvim" })
    use('tpope/vim-eunuch') -- Unix commands
    use('folke/trouble.nvim') -- quickfix list
    use 'karb94/neoscroll.nvim' -- smooth scroll
    use { 'ThePrimeagen/vim-be-good'}

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use 'tpope/vim-surround' -- add )}] around
    use 'wellle/targets.vim' -- adds more text targets (, etc
    use 'kyazdani42/nvim-web-devicons'
    -- highlight cursor on move
    use {'edluffy/specs.nvim'}
    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {'ayosec/hltermpaste.vim'}
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- Echoes the path to the identifier under the cursor.
    use 'mogelbrod/vim-jsonpath'
    -- THEMES
    use { 'folke/tokyonight.nvim'}
    use { 'EdenEast/nightfox.nvim'}
    use { 'Shatur/neovim-ayu'}
    use "savq/melange"
    use { 'NTBBloodbath/doom-one.nvim' }
    use {'sainnhe/gruvbox-material'}
    use {'sainnhe/everforest'}
    use {
      'rose-pine/neovim',
       as = 'rose-pine'
    }
    use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  end,
  config = {
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  },
})


-- allows to view start up times for pkgs
-- usage
-- :LuaCacheProfile
-- Clear cache
-- :LuaCacheClear
require'impatient'.enable_profile()
require("trouble").setup {}

-- use terminal colors
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox-material]]
vim.g.lightline = {
  colorscheme = 'gruvbox_material',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}
local result = vim.api.nvim_exec(
  [[

   " settings for highlight after paste ctrl-shift-v
  let g:hltermpaste_timeout = 3000
  let g:hltermpaste_match_group = "DiffAdd"

  let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be " }
  let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
  let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
  let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
  let g:tmuxline_preset = {
  \'a'    : '#S',
  \'b'    : '%R',
  \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
  \'win'  : [ '#I', '#W' ],
  \'cwin' : [ '#I', '#W', '#F' ],
  \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
  \'y'    : [ '%a' ],
  \'z'    : '#H #{prefix_highlight}'
  \}
  let g:tmuxline_separators = {
  \ 'left' : "\ue0bc",
  \ 'left_alt': "\ue0bd",
  \ 'right' : "\ue0ba",
  \ 'right_alt' : "\ue0bd",
  \ 'space' : ' '}
]], false
)
vim.keymap.set('n', '<C-k>', ":bprev<CR>", {})
--Enable mouse mode
vim.o.mouse = 'a'
