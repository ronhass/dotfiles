return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
    },
    keys = {
        { "<leader>t", "<cmd>lua require'neotest'.summary.toggle()<cr>", "Neotest" },
    }
}
