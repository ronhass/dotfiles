return {
    -- manages LSP configurations
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                require("which-key").register({
                    g = {
                        d = {":Telescope lsp_definitions<CR>", "Goto definition"},
                        h = {":Telescope lsp_references<CR>", "References"},
                    },
                    K = {function() vim.lsp.buf.hover() end, "Show documentation"},
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
            })

            require'lspconfig'.lua_ls.setup {
                on_attach = on_attach,
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
