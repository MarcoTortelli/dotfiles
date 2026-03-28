return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			json = { "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
		formatters = {
			prettier = {
				options = {
					ft_parsers = {
						html = "html",
						css = "css",
						javascript = "babel",
						typescript = "typescript",
						json = "json",
						markdown = "markdown",
					},
				},
				prepend_args = {
					"--print-width",
					"120",
					"--bracket-same-line",
					"--html-whitespace-sensitivity",
					"css",
				},
			},
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
