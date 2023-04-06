-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  require("which-key").register({
      g = {
          d = {":Lspsaga goto_definition<CR>", "Goto definition"},
          h = {":Lspsaga lsp_finder<CR>", "References"},
          p = {":Lspsaga peek_definition<CR>", "Peek definition"},
      },
      K = {":Lspsaga hover_doc<CR>", "Show documentation"},
  }, {buffer = bufnr})
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    settings = {
	    python = {
		    analysis = {
			    autoImportCompletions = true
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

require('lspconfig')['sumneko_lua'].setup{
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            },
        },
    },
}

require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
    filetypes = { "sh", "zsh" },
}

-- Disable diagnostics
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
