return {
    -- add, delete, change surroundings (cs, ds)
    "tpope/vim-surround",

    -- Ensure PEP8 indentation
    "Vimjas/vim-python-pep8-indent",

    -- add/remove comments (gc)
    {
        "numToStr/Comment.nvim",
        config = true,
    },

    -- Automatically pair parantheses etc.
    "jiangmiao/auto-pairs",

    -- Replace text object with register (gr)
    "vim-scripts/ReplaceWithRegister",

    -- Jump to locations by two characters (s/S)
    "ggandor/leap.nvim",

    -- Automatically configure indentation according to current file
    {
        "nmac427/guess-indent.nvim",
        config = true,
    },

    -- Add indentation guides
    "lukas-reineke/indent-blankline.nvim",
}
