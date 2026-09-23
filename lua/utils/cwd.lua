local M = {}

function M.change()
    local cwd = vim.fn.getcwd()

    local directories = {
        "..",
    }

    local result = vim.fn.systemlist({
        "find",
        cwd,
        "-mindepth",
        "1",
        "-type",
        "d",
    })

    vim.list_extend(directories, result)

    require("fzf-lua").fzf_exec(directories, {
        prompt = "Directory > ",

        actions = {
            ["default"] = function(selected)
                if not selected or not selected[1] then
                    return
                end

                local target = selected[1]

                if target == ".." then
                    target = vim.fn.fnamemodify(cwd, ":h")
                end

                vim.cmd("cd " .. vim.fn.fnameescape(target))

                vim.notify("CWD: " .. vim.fn.getcwd())
            end,

            ["ctrl-g"] = function()
                vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.expand("~")))

                vim.notify("CWD: " .. vim.fn.getcwd())
            end,
        },
    })
end

return M
