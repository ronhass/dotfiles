return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'crucerucalin/peaksea.vim'
  use 'joshdick/onedark.vim'
  use 'morhetz/gruvbox'
  use 'dracula/vim'
  use 'arcticicestudio/nord-vim'
  use 'tomasiser/vim-code-dark'

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'neovim/nvim-lspconfig'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'nvim-telescope/telescope-file-browser.nvim'

  -- use 'tpope/vim-vinegar'

  use 'kdheepak/lazygit.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
		  'stevearc/aerial.nvim',
		  config = function() require('aerial').setup() end
  }

  -- use 'Vimjas/vim-python-pep8-indent'

  use 'tpope/vim-fugitive'

  use 'numToStr/Comment.nvim'

  use 'jiangmiao/auto-pairs'
end)
