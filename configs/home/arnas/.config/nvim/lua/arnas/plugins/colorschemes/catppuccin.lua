return { 
	"catppuccin/nvim", 
	name = "catppuccin", 
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		term_colors = true,
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
			},
		},
		integrations = {
			treesitter = true,
			telescope = {
				enabled = true,
				-- style = "nvchad",
			},
		},
	},
	config = true,
}
