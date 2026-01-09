return {
	-- Using Lazy
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanso")
		end,
	},

	-- Using Packer
}
