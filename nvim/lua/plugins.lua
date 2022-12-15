-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorschemes
    use 'crucerucalin/peaksea.vim'
    use 'joshdick/onedark.vim'
    use 'morhetz/gruvbox'
    use 'dracula/vim'
    use 'arcticicestudio/nord-vim'
    use 'tomasiser/vim-code-dark'
    use 'bluz71/vim-nightfly-guicolors'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-surround' -- add, delete, change surroundings (it's awesome)

    -- managing & installing lsp servers, linters & formatters
	use 'williamboman/mason.nvim' -- in charge of managing lsp servers, linters & formatters
	use 'williamboman/mason-lspconfig.nvim' -- bridges gap b/w mason & lspconfig

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

    -- use {
    --     'stevearc/aerial.nvim',
    --     config = function() require('aerial').setup() end
    -- }

    -- use 'Vimjas/vim-python-pep8-indent'

    -- use 'tpope/vim-fugitive'

    use 'numToStr/Comment.nvim'

    use 'jiangmiao/auto-pairs'

    use 'ThePrimeagen/vim-be-good'
    use({
        "glepnir/lspsaga.nvim",
        branch = "main"
    })

    use 'szw/vim-maximizer'

    use 'christoomey/vim-tmux-navigator'

    use 'natecraddock/workspaces.nvim'

    use 'natecraddock/sessions.nvim'

    use 'vim-scripts/ReplaceWithRegister'

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    use "lukas-reineke/indent-blankline.nvim"

    use "f-person/git-blame.nvim"
end)
