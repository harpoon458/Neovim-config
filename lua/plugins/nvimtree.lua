return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,

    config = function()
        require("nvim-tree").setup({
            sync_root_with_cwd = true,

            view = {
                side = "right",
                width = 30,
            },

            filters = {
                dotfiles = false,
            },
        })
    end,

    keys = {
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<CR>",
            desc = "Toggle NvimTree",
        },
    },
}
