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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("syntax on")
vim.cmd("set termguicolors")
vim.cmd("colorscheme sonokai")

-- Fix unbearable blue in DiffText
vim.api.nvim_set_hl(0, "DiffText", { background = 0x18282b });

vim.cmd("let g:gitblame_enabled = 0")

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set nofoldenable")
vim.cmd("set cmdheight=0")

vim.cmd([[
if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
]])

vim.cmd("let g:gitgutter_highlight_linenrs = 1")
vim.cmd("let g:gitgutter_signs = 0")
