return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()

            vim.api.nvim_set_hl(0, "LualineBuffersActive", {
                bg = "#3b4252",
                fg = "#ffffff",
                bold = true,
            })

            vim.api.nvim_set_hl(0, "LualineBuffersInactive", {
                bg = "NONE",
                fg = "#888888",
            })

            require("lualine").setup({
                options = {
                    theme = "auto",
                    globalstatus = true,
                },

                sections = {
                    lualine_a = { "mode" },

                    lualine_b = {
                        "branch",
                        "diff",
                    },

                    lualine_c = {
                        {
                            "buffers",

                            show_filename_only = true,
                            hide_filename_extension = false,
                            show_modified_status = false,
                            mode = 0,

                            max_length = vim.o.columns * 2 / 3,

                            show_close_icon = false,

                            fmt = function(name, context)
                                local bufnr = context.bufnr

                                local is_modified =
                                vim.api.nvim_get_option_value(
                                    "modified",
                                    { buf = bufnr }
                                )

                                if is_modified then
                                    return name .. " ●"
                                else
                                    return name .. " 󰖭"
                                end
                            end,

                            symbols = {
                                modified = "",
                                alternate_file = "",
                                directory = "",
                            },
                            use_mode_colors = true,
                        },
                    },

                    lualine_x = {
                        "encoding",
                        "fileformat",
                        "filetype",
                    },

                    lualine_y = {
                        "progress",
                    },

                    lualine_z = {
                        "location",
                    },
                },
            })
        end,
    },
}
