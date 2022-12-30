-- leader key to space
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

---------------------
-- General Keymaps
-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

require("which-key").register({
    ["<leader>"] = {
        a = {"ggVG", "Select all text"},
        p = {":Telescope find_files<CR>", "Find file"},
        f = {":Telescope live_grep<CR>", "Live grep"},
        c = {":Telescope grep_string<CR>", "Search for current word"},
        h = {":Telescope help_tags<CR>", "Help"},
        r = {":Telescope resume<CR>", "Resume the last peeker"},
        e = {":Telescope file_browser path=%:p:h<CR>", "File Browser"},
        l = {":Telescope oldfiles only_cwd=true<CR>", "Latest files"},
        g = {":LazyGit<CR>", "LazyGit"},
        w = {":set list!<CR>", "Toggle whitespaces"},
        b = {":GitBlameToggle<CR>", "Git blame (toggle)"},
        o = {":SymbolsOutline<CR>", "Outline (toggle)"},
        n = {":nohl<CR>", "Clear search highlights"},
        ["+"] = {"<C-a>", "Increment number"},
        ["-"] = {"<C-x>", "Decrement number"},
    },

    ["<leader>s"] = {
        name = "+splits",
        v = {"<C-w>v", "Split window vertically"},
        h = {"<C-w>s", "Split window horizontally"},
        e = {"<C-w>=", "Equalize split windows sizes"},
        n = {"<C-w>w", "Goto next split"},
        x = {":close<CR>", "Close split"},
        m = {":MaximizerToggle!<CR>", "Maximize split (toggle)"},
    },

    ["<leader>t"] = {
        name = "+tabs",
        c = {":tabnew<CR>", "Create new tab"},
        x = {":tabclose<CR>", "Close tab"},
        n = {":tabn<CR>", "Goto next tab"},
        p = {":tabp<CR", "Goto previous tab"},
    },

    ["<leader>m"] = {
        name = "+more",
        b = {":Telescope buffers<CR>", "Buffers"},
        m = {":Telescope man_pages sections=ALL<CR>", "Man pages"},
        p = {":Telescope workspaces<CR>", "Choose project"},
        r = {":Lspsaga rename<CR>", "Rename"},
        a = {":Lspsaga code_action<CR>", "Code actions"},
    },
})

require('leap').add_default_mappings()
