-- leader key to space
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", opts) -- increment
keymap("n", "<leader>-", "<C-x>", opts) -- decrement

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window
keymap("n", "<leader>sm", ":MaximizerToggle!<CR>", opts) -- close current split window

keymap("n", "<leader>tn", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fr", ":Telescope resume<CR>", opts)
keymap("n", "<leader>fe", ":Telescope file_browser<CR>", opts)

keymap("n", "<leader>g", ":LazyGit<CR>", opts)

keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<leader>w", ":set list!<CR>", opts)

keymap("n", "<leader>b", ":Git blame<CR>", opts)

-- Toggle the aerial window with <leader>a
keymap("n", "<leader>a", ":AerialToggle!<CR>", opts)
