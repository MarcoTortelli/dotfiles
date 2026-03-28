return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
		enabled = function()
			return true
		end,
	},
}
