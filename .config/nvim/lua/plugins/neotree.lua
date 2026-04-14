return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		opts = {
			filesystem = {
				hijack_netrw_behavior = "disabled", -- don't open neo-tree on start up
				window = {
					mappings = {
						["Z"] = "expand_all_nodes",
					},
				},
			},
		},
		lazy = false, -- neo-tree will lazily load itself
	},
}
