local navic = require("nvim-navic")


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set("n", "lr", "<cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set("n", "<leader>ma", "<cmd>Lspsaga code_action<CR>", opts)

  if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
  end
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    settings = {
	    python = {
		    analysis = {
			    autoImportCompletions = false
		    }
	    }
    }
}

require('lspconfig')['clangd'].setup{
    on_attach = on_attach
}

require('lspconfig')['rust_analyzer'].setup({
    on_attach = on_attach
    -- settings = {
    --     ["rust-analyzer"] = {
    --         imports = {
    --             granularity = {
    --                 group = "module",
    --             },
    --             prefix = "self",
    --         },
    --         cargo = {
    --             buildScripts = {
    --                 enable = true,
    --             },
    --         },
    --         procMacro = {
    --             enable = true
    --         },
    --     }
    -- }
})

-- Disable diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
