return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },

        opts = {
            snippets = {
                preset = "luasnip",
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },

            keymap = {
                preset = "default",

                ["<C-j>"] = {
                    "select_next",
                    "snippet_forward",
                    "fallback",
                },

                ["<C-k>"] = {
                    "select_prev",
                    "snippet_backward",
                    "fallback",
                },

                ["<CR>"] = {
                    "accept",
                    "fallback",
                },
            },

            completion = {
                documentation = {
                    auto_show = true,
                },

            },
        },
    },
}
