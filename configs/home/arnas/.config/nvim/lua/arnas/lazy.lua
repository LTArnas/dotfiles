local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{
		{ import = "arnas.plugins" },
		{ import = "arnas.plugins.colorschemes" },
	},
	{
		install = {
			colorscheme = { "catppuccin" },
		},
		checker = {
			enabled = true,
			notify = true, -- change to false when we have status line that will show us this?
			frequency = 3600*6, -- 3600 is 1 hour.
		},
	}
)
