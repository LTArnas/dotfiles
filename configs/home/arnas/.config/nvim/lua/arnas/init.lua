-- We keep our shiz modular as possible, so this init.lua mainly just includes other lua settings.
-- Also, we aim to be... what do you call it? "Startup friendly"? Easy restore on fresh install!

-- Note:
-- Unless I changed over time since I wrote this (lol, sorry if so)
-- then note that we install and configure packages in one place,
-- by leveraging how our package manger (lazy) works.
-- ...This includes key mappings. Everything possible, so shit isn't scattered around.

-- Need to set our leader before loading up lazy.
vim.g.mapleader = " "

-- The package manager:
require("arnas.lazy")

-- Vim settings:
require("arnas.vimsettings")

-- Key mappings (for all mappings not specific to a plugin.):
require("arnas.remap")

