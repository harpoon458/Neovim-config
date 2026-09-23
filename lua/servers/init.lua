local M = {}

local capabilities = require("blink.cmp").get_lsp_capabilities()

M.filetype_servers = {
    c = "clangd",
    cpp = "clangd",

    java = "jdtls",

    python = "pyright",

    lua = "lua_ls",

    javascript = "ts_ls",
    javascriptreact = "ts_ls",
    typescript = "ts_ls",
    typescriptreact = "ts_ls",

    go = "gopls",

    json = "jsonls",
    jsonc = "jsonls",

    bash = "bashls",
    sh = "bashls",

    dockerfile = "dockerls",

    yaml = "yamlls",

    html = "html",
    css = "cssls",

    markdown = "marksman",

    cmake = "neocmake",

    sql = "sqlls",

    toml = "taplo",
}

function M.setup()
    local configured = {}

    for _, server in pairs(M.filetype_servers) do
        if not configured[server] then
            local ok, config = pcall(require, "servers." .. server)

            if not ok then
                config = {}
            end

            config.capabilities = capabilities

            vim.lsp.config(server, config)
            vim.lsp.enable(server)

            configured[server] = true
        end
    end
end

-- ==========================
-- LSP Keymaps
-- ==========================

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = {
            buffer = args.buf,
            silent = true,
        }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.keymap.set(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            opts
        )

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format()
        end, opts)
    end,
})

-- ==========================
-- Diagnostics
-- ==========================

local virtual_enabled = true

local function apply_diagnostics()
    vim.diagnostic.config({
        virtual_text = virtual_enabled and {
            spacing = 4,
            prefix = "●",
            source = "if_many",
            severity = {
                min = vim.diagnostic.severity.WARN,
            },
        } or false,

        signs = true,
        underline = true,
        severity_sort = true,
        update_in_insert = false,
    })
end

apply_diagnostics()

-- Show diagnostic popup
vim.keymap.set("n", "<leader>gl", function()
    vim.diagnostic.open_float(nil, {
        focusable = false,
        border = "rounded",
        source = "if_many",
    })
end, {
    desc = "Show diagnostics",
})

-- Toggle virtual diagnostics
vim.keymap.set("n", "<leader>tv", function()
    virtual_enabled = not virtual_enabled

    apply_diagnostics()

    vim.notify(
        "Virtual diagnostics "
            .. (virtual_enabled and "enabled" or "disabled"),
        vim.log.levels.INFO
    )
end, {
    desc = "Toggle virtual diagnostics",
})

-- Previous / Next diagnostic

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

return M 
