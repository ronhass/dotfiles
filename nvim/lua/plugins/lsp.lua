return {
    -- manages LSP configurations
    {
        "neovim/nvim-lspconfig",

        dependencies = { 'saghen/blink.cmp' },

        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                require("which-key").add({
                    { "K", function() vim.lsp.buf.hover() end, buffer = bufnr, desc = "Show documentation" },
                    { "gd", ":Telescope lsp_definitions<CR>", buffer = bufnr, desc = "Goto definition" },
                    { "gh", ":Telescope lsp_references<CR>", buffer = bufnr, desc = "References" },
                })
            end

            require('lspconfig')['pyright'].setup{
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoImportCompletions = true
                        }
                    }
                }
            }

            require('lspconfig')['clangd'].setup{
                on_attach = on_attach,
                capabilities = capabilities,
            }

            require('lspconfig')['rust_analyzer'].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            require'lspconfig'.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {'vim'},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

            require('lspconfig')['bashls'].setup{
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "sh", "zsh" },
            }

            -- Disable diagnostics
            -- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
        end,
    },

    -- managing & installing lsp servers, linters & formatters
    {
        "williamboman/mason.nvim",
        config = true,
        build = ":MasonInstall pyright",
    },
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
}
