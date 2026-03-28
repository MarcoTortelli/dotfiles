return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		disable_filetype = { "TelescopePrompt" },
		ts_config = {
			lua = { "string" },
			java = false,
			javascript = { "template_string" },
		},
	},
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)
	end,
}
