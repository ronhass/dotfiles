return {
    -- Debugging
    {
        "mfussenegger/nvim-dap",
        config = function()

            local function configure()
                local dap_install = require "dap-install"
                dap_install.setup {
                    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
                }

                require("nvim-dap-virtual-text").setup {
                    commented = true,
                }

                local dap, dapui = require "dap", require "dapui"
                dapui.setup {
                    icons = {
                        expanded = "▼",
                        collapsed = "▶",
                        current_frame = "■",
                    },
                    controls = {
                        enabled = false,
                    },
                    layouts = {
                        {
                            elements = {
                                "breakpoints",
                                "stacks",
                                "scopes",
                            },
                            size = 40,
                            position = "left",
                        },
                        {
                            elements = {
                                "repl",
                                "console",
                            },
                            size = 0.25,
                            position = "bottom",
                        },
                    },
                }
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end

            local function configure_debuggers()
                require("dap-python").setup("python", {})
                require("dap-install").config("codelldb", {})
            end

            local function configure_keymaps()
                require("which-key").add({
                    { "<leader>d", group = "Debug" },
                    { "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc = "Conditional Breakpoint" },
                    { "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", desc = "Evaluate Input" },
                    { "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor" },
                    { "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes" },
                    { "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
                    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
                    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
                    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
                    { "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
                    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
                    { "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables" },
                    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
                    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
                    { "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause" },
                    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
                    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
                    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
                    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
                    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
                    { "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
                    {
                        mode= {"v"},
                        {"<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
                    }
                })
            end

            configure()
            configure_debuggers()
            configure_keymaps()
        end,
    },
    "ravenxrz/DAPInstall.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
}
