local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<C-b>", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<C-h>", "<cmd>Telescope help_tags<cr>", opts)

keymap("n", "<space>g", "<cmd>LazyGit<cr>", opts)

keymap("n", "<C-s>", "<cmd>w<cr>", opts)
keymap("n", "<space>w", "<cmd>set list!<cr>", opts)

keymap("n", "<space>b", "<cmd>Git blame<cr>", opts)
