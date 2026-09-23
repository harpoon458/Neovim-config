-- TreeSitter
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		-- Required for the new nvim-treesitter main API
		ts.setup({})
		-- Parsers you want available
		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"dockerfile",
			"fish",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"rust",
			"svelte",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
		}

		-- Install missing parsers asynchronously
		ts.install(ensure_installed, {
			max_jobs = 8,
		})
		-- Buffers where Tree-sitter should not be started
		local ignore_filetypes = {
			"checkhealth",
			"lazy",
			"mason",
			"snacks_dashboard",
			"snacks_notif",
			"snacks_win",
		}
		local group = vim.api.nvim_create_augroup("TreesitterSetup", {
			clear = true,
		})
		-- Start Tree-sitter automatically for supported filetypes
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Start Tree-sitter",
			callback = function(args)
				local filetype = args.match
				if vim.tbl_contains(ignore_filetypes, filetype) then
					return
				end
				local lang = vim.treesitter.language.get_lang(filetype)
				if not lang then
					return
				end
				-- Don't throw errors if parser isn't available yet
				local ok = pcall(vim.treesitter.start, args.buf, lang)
				if ok then
					-- Tree-sitter indentation
					vim.bo[args.buf].indentexpr =
						"v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
