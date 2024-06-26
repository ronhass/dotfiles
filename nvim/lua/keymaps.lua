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
        r = {":Telescope pickers<CR>", "Navigate last telescope pickers"},
        e = {":NvimTreeToggle<CR>", "File Browser"},
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

    ["<leader>m"] = {
        name = "+more",
        b = {":Telescope buffers<CR>", "Buffers"},
        m = {":Telescope man_pages sections=ALL<CR>", "Man pages"},
        r = {function() vim.lsp.buf.rename() end, "Rename"},
        h = {":LazyGitFilterCurrentFile<CR>", "File git history"},
        d = {":Telescope diagnostics<CR>", "Show diagnostics"},
        e = {":NvimTreeFindFileToggle<CR>", "File browser (on current file)"},
    },
})

require('leap').add_default_mappings()
