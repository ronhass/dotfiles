require("sessions").setup({
    events = { "BufEnter", "VimPreLeave" }
})

require("workspaces").setup({
    hooks = {
        add = function(name)
            require("sessions").save("~/.nvim-sessions/" .. name, {});
        end,
        open = function(name)
            require("sessions").load("~/.nvim-sessions/" .. name, {});
        end,
    }
})
