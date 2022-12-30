vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
-- vim.opt.hlsearch = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.listchars = "eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:·"
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.timeoutlen = 250

vim.cmd("syntax on")
vim.cmd("set termguicolors")
vim.cmd("colorscheme sonokai")

vim.cmd("let g:gitblame_enabled = 0")

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set nofoldenable")
