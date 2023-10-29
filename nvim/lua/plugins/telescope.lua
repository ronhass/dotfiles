return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        width = 0.9,
                        preview_width = 0.6
                    }
                },
                cache_picker = {
                    num_pickers = 10,
                },
            }

        }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
    },
    "nvim-telescope/telescope-file-browser.nvim",
}
