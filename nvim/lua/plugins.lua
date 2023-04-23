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
    use 'sainnhe/sonokai'

    -- TreeSitter (syntax parser)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require("plug-treesitter") end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {
        'nvim-treesitter/playground',
        run = ':TSInstall query',
        config = function() require("nvim-treesitter.configs").setup({}) end,
    }

    -- Lualine (status line)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require("lualine").setup() end,
    }

    -- add, delete, change surroundings (cs, ds)
    use 'tpope/vim-surround'

    -- managing & installing lsp servers, linters & formatters
	use {
        'williamboman/mason.nvim', -- in charge of managing lsp servers, linters & formatters,
        config = function() require("mason").setup() end,
    }
	use 'williamboman/mason-lspconfig.nvim' -- bridges gap b/w mason & lspconfig

    -- manages LSP configurations
    use {
        'neovim/nvim-lspconfig',
        config = function() require("plug-lspconfig") end,
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function() require("plug-telescope") end,
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- LazyGit integration
    use 'kdheepak/lazygit.nvim'

    -- Autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        config = function() require("plug-cmp") end,
    }
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Ensure PEP8 indentation
    use 'Vimjas/vim-python-pep8-indent'

    -- add/remove comments (gc)
    use {
        'numToStr/Comment.nvim',
        config = function() require("Comment").setup() end,
    }

    -- Automatically pair parantheses etc.
    use 'jiangmiao/auto-pairs'

    -- -- Game to practice vim
    -- use 'ThePrimeagen/vim-be-good'

    use({
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup() end,
    })

    -- Nice-looking code references etc.
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({symbol_in_winbar = { folder_level = 7 }})
        end,
        requires = {
            {"nvim-tree/nvim-web-devicons"},
            --Please make sure you install markdown and markdown_inline parser
            {"nvim-treesitter/nvim-treesitter"}
        }
    })

    -- Maximize splits
    use 'szw/vim-maximizer'

    -- Integration with tmux to navigate splits (Ctrl+h/j/k/l)
    use 'christoomey/vim-tmux-navigator'

    -- Manage "projects"
    use 'natecraddock/workspaces.nvim'
    use {
        'natecraddock/sessions.nvim',
        config = function() require("plug-workspaces") end,
    }

    -- Replace text object with register (gr)
    use 'vim-scripts/ReplaceWithRegister'

    -- Add indentation guides
    use "lukas-reineke/indent-blankline.nvim"

    -- Inline git blame
    use "f-person/git-blame.nvim"

    -- Jump to locations by two characters (s/S)
    use "ggandor/leap.nvim"

    -- Code outline
    use {
        'ronhass/symbols-outline.nvim',
        config = function() require("plug-symbols-outline") end,
    }

    -- Automatically configure indentation according to current file
    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }

    -- Help on key bindings
    use {
        'folke/which-key.nvim',
        config = function() require('which-key').setup {} end,
    }

    -- Debugging
    use {
        'mfussenegger/nvim-dap',
        config = function() require("plug-dap") end,
    }
    use 'ravenxrz/DAPInstall.nvim'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap-python'
    use 'nvim-telescope/telescope-dap.nvim'

    use {
        'akinsho/git-conflict.nvim', tag = "*", config = function() require('git-conflict').setup() end,
    }

    use 'airblade/vim-gitgutter'
end)
