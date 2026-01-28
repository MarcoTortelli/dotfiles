return {

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
			explorer = {
				enabled = true,
				layout = {
					cycle = false,
				},
			},
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},
			picker = {
				enabled = true,
				matchers = {
					frecency = true,
					cwd_bonus = true,
				},
				formatters = {
					file = {
						filename_first = true,
						filename_only = false,
						icon_width = 2,
					},
				},
				layout = {
					preset = "telescope",
					cycle = false,
				},
				layouts = {
					select = {
						preview = false,
						layout = {
							backdrop = false,
							width = 0.6,
							min_width = 80,
							height = 0.4,
							min_height = 10,
							box = "vertical",
							border = "rounded",
							title = "{title}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
						},
					},
					telescope = {
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.8,
							height = 0.9,
							border = "none",
							{
								box = "vertical",
								{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
								{
									win = "input",
									height = 1,
									border = "rounded",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.50,
								border = "rounded",
								title_pos = "center",
							},
						},
					},
					ivy = {
						layout = {
							box = "vertical",
							backdrop = false,
							width = 0,
							position = "bottom",
							border = "top",
							title = "{title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
							},
						},
					},
				},
			},
		},
		keys = {
			{
				"<leader><space>",
				function()
					Snacks.picker.files()
				end,
				desc = "Smart Find (Files/Buffers/Recent)",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent Files",
			},

			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep (Project Search)",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Search Current Word",
				mode = { "n", "x" },
			},
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Search Buffer Lines",
			},
			{
				"<leader>pk",
				function()
					Snacks.picker.keymaps({ layout = "ivy" })
				end,
				desc = "Search Keymaps (Snacks Picker)",
			},

			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "Open Explorer",
			},

			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gb",
				function()
					Snacks.git.blame_line()
				end,
				desc = "Git Blame Line",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Open in Browser",
			},

			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},
			{
				"<leader>rn",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>pt",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>pT",
				function()
					Snacks.picker.todo_comments({ keyword = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
	-- lazy.nvim
	{
		"folke/snacks.nvim",
		opts = {},
		keys = {
			{
				"<C-t>",
				function()
					Snacks.terminal.toggle()
				end,
				mode = { "n", "t" },
				desc = "Toggle Terminal",
			},
			{
				"<leader>cpp",
				function()
					vim.cmd("write")

					-- Pega os nomes dos arquivos
					local dir = vim.fn.expand("%:p:h") -- Pasta do arquivo
					local file = vim.fn.expand("%:t") -- Nome do arquivo (ex: main.cpp)
					local output = vim.fn.expand("%:t:r") -- Nome sem extensão (ex: main)

					-- O comando agora faz:
					-- 1. Entra na pasta (cd)
					-- 2. Compila
					-- 3. Roda o executável localmente (./)
					local cmd = string.format("cd '%s' && g++ '%s' -o '%s' && ./'%s'", dir, file, output, output)

					-- Usando a função específica do Snacks para rodar comandos
					Snacks.terminal.open(cmd, {
						win = {
							style = "float",
							border = "rounded",
						},
					})
				end,
			},
		},
	},
}
