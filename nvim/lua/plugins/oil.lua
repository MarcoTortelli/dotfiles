return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		default_file_explorer = true,
		columns = {},
		keymaps = {
			["<C-h>"] = false,
			["<C-c>"] = false,
			["<M-h>"] = "actions.select_split",
			["q"] = "actions.close",
		},
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
	},

	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		{
			"<leader>-",
			function()
				require("oil").toggle_float()
			end,
		},
	},

	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})
	end,
}
