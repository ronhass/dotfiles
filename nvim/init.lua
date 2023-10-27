local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("options")

require("lazy").setup({
    -- colorschemes
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme sonokai]])
        end,
    },

    -- TreeSitter (syntax parser)
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        config = function()
            require("plug-treesitter")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
    },

    -- Lualine (status line)
    {
        "nvim-lualine/lualine.nvim",
        config = true,
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    -- add, delete, change surroundings (cs, ds)
    "tpope/vim-surround",

    -- managing & installing lsp servers, linters & formatters
    {
        "williamboman/mason.nvim",
        config = true,
        build = ":MasonInstall pyright",
    },
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

    -- manages LSP configurations
    {
        "neovim/nvim-lspconfig",
        config = function() require("plug-lspconfig") end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("plug-telescope") end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
    },
    "nvim-telescope/telescope-file-browser.nvim",

    -- LazyGit integration
    "kdheepak/lazygit.nvim",

    -- Autocompletion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "hrsh7th/nvim-cmp",
        config = true,
    },
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",

    -- Ensure PEP8 indentation
    "Vimjas/vim-python-pep8-indent",

    -- add/remove comments (gc)
    {
        "numToStr/Comment.nvim",
        config = true,
    },

    -- Automatically pair parantheses etc.
    "jiangmiao/auto-pairs",

    -- Maximize splits
    "szw/vim-maximizer",

    -- Integration with tmux to navigate splits (Ctrl+h/j/k/l)
    "christoomey/vim-tmux-navigator",

    -- Replace text object with register (gr)
    "vim-scripts/ReplaceWithRegister",

    -- Add indentation guides
    "lukas-reineke/indent-blankline.nvim",

    -- Inline git blame
    "f-person/git-blame.nvim",

    -- Jump to locations by two characters (s/S)
    "ggandor/leap.nvim",

    -- Code outline
    {
        "ronhass/symbols-outline.nvim",
        config = true,
    },

    -- Automatically configure indentation according to current file
    {
        "nmac427/guess-indent.nvim",
        config = true,
    },

    -- Help on key bindings
    {
        "folke/which-key.nvim",
        config = function() require("keymaps") end,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        config = function() require("plug-dap") end,
    },
    "ravenxrz/DAPInstall.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",

    {
        "akinsho/git-conflict.nvim",
        config = true,
    },

    {
        "nvim-tree/nvim-tree.lua",
        config = true,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
})
