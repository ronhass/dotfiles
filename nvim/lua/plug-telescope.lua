local actions = require("telescope.actions")
require("telescope").setup{
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                width = 0.9,
                preview_width = 0.6
            }
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true
        }
    }
}

require("telescope").load_extension "file_browser"

