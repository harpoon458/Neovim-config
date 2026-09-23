return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatter = null_ls.builtins.formatting
		local lint = null_ls.builtins.diagnostics
		null_ls.setup({
			sources = {
				formatter.stylua,

				formatter.clang_format.with({
					extra_args = {
						"--style={BasedOnStyle: LLVM, IndentWidth: 4, ContinuationIndentWidth: 4, TabWidth: 4}",
					},
				}),

				formatter.google_java_format,

				formatter.black,
				formatter.isort,

				formatter.shfmt,
				-- lint.shellcheck,

				formatter.prettier,

				formatter.gofmt,
				formatter.goimports,
				lint.golangci_lint,

				lint.markdownlint,

				formatter.rubocop,
				lint.rubocop,

				formatter.fish_indent,
				lint.fish,

				lint.yamllint,

				-- formatter.taplo,

				lint.hadolint,

				formatter.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),
				lint.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),

				formatter.cmake_format,
				lint.cmake_lint,
			},
		})
	end,
}
