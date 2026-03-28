return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"biome",
				"stylua",
				"black",
				"pylint",
				"eslint_d",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"prismals",
				"pyright",
				"eslint",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
