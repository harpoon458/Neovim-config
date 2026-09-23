--Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffers
vim.keymap.set('n', "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" } )
vim.keymap.set('n', "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous Buffer" } )
vim.keymap.set('n', "<leader>x", "<cmd>bdelete<cr>", { desc = "Close Current Buffer" } )

-- Clear Search Highlights 
vim.keymap.set('n', "<leader>ch", ":nohlsearch<CR>")

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting
vim.keymap.set('n', "<leader>sv", "<cmd>vsplit<CR>")
vim.keymap.set('n', "<leader>sh", "<cmd>split<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Change Working Directory
vim.keymap.set("n", "<C-k><C-O>", function()
    require("utils.cwd").change()
end, {
    desc = "Change working directory",
})
