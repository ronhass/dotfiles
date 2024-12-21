local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

---------------------
-- General Keymaps
-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

require("which-key").add({
    {"<leader>a", "ggVG", desc="Select all text"},
    {"<leader>p", ":Telescope find_files<CR>", desc="Find file"},
    {"<leader>f", ":Telescope live_grep<CR>", desc="Live grep"},
    {"<leader>c", ":Telescope grep_string<CR>", desc="Search for current word"},
    {"<leader>h", ":Telescope help_tags<CR>", desc="Help"},
    {"<leader>r", ":Telescope pickers<CR>", desc="Navigate last telescope pickers"},
    {"<leader>e", ":NvimTreeToggle<CR>", desc="File Browser"},
    {"<leader>l", ":Telescope oldfiles only_cwd=true<CR>", desc="Latest files"},
    {"<leader>g", ":LazyGit<CR>", desc="LazyGit"},
    {"<leader>w", ":set list!<CR>", desc="Toggle whitespaces"},
    {"<leader>b", ":GitBlameToggle<CR>", desc="Git blame (toggle)"},
    {"<leader>o", ":SymbolsOutline<CR>", desc="Outline (toggle)"},
    {"<leader>n", ":nohl<CR>", desc="Clear search highlights"},
    {"<leader>+", "<C-a>", desc="Increment number"},
    {"<leader>-", "<C-x>", desc="Decrement number"},

    {"<leader>s", group="splits"},
    {"<leader>sv", "<C-w>v", desc="Split window vertically"},
    {"<leader>sh", "<C-w>s", desc="Split window horizontally"},
    {"<leader>se", "<C-w>=", desc="Equalize split windows sizes"},
    {"<leader>sn", "<C-w>w", desc="Goto next split"},
    {"<leader>sx", ":close<CR>", desc="Close split"},
    {"<leader>sm", ":MaximizerToggle!<CR>", desc="Maximize split (toggle)"},

    {"<leader>m", group="more"},
    {"<leader>mb", ":Telescope buffers<CR>", desc="Buffers"},
    {"<leader>mm", ":Telescope man_pages sections=ALL<CR>", desc="Man pages"},
    {"<leader>mr", function() vim.lsp.buf.rename() end, desc="Rename"},
    {"<leader>mh", ":LazyGitFilterCurrentFile<CR>", desc="File git history"},
    {"<leader>md", ":Telescope diagnostics<CR>", desc="Show diagnostics"},
    {"<leader>me", ":NvimTreeFindFileToggle<CR>", desc="File browser (on current file)"},
})

require('leap').add_default_mappings()
