-- This one is set in the init.lua file, (that sources this file.)
--vim.g.mapleader = " "

vim.cmd.colorscheme "catppuccin"

-- Not sure this does what I want but I'd prefer unix as default, but for existing files to detect.
vim.opt.fileformats = {"unix", "dos"}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.autowriteall = false
vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.backupdir:append { ".", "$XDG_STATE_HOME/nvim/backup//" }
vim.opt.backupext = "~"
--vim.opt.backupskip -- we not changing the default, since it's different on different platforms.
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.directory:append { "$XDG_STATE_HOME/nvim/swap//" }
vim.opt.fixendofline = false
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.showbreak = "|>"
--vim.opt.showmatch = true
--vim.opt.matchtime
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.list = true
--vim.opt.listchars = {  }
vim.opt.splitbelow = false
vim.opt.splitright = false
vim.opt.fileencoding = "utf-8"
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 1000
vim.opt.colorcolumn = "99" -- 99 columns and then the b*tch is highlighted one (...hl. on 100)
