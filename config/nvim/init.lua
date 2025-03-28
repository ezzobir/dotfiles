vim.o.background = "dark" -- or "light" for light mode
vim.cmd("set number relativenumber")
vim.opt.clipboard:append("unnamed")
vim.opt.clipboard:append("unnamedplus")
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- Set the number of spaces a <Tab> counts for
vim.opt.tabstop = 4
-- Set the number of spaces used for each indentation level
vim.opt.shiftwidth = 4
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- BEGEIN: LAZY.NVIM
---------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
-- { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true}
}

local opts= {}

require("lazy").setup(plugins, opts)
---------------------------------------------------------
-- END: LAZY.NVIM

-- BEGEIN: COLORSCHEME
---------------------------------------------------------
-- vim.cmd([[colorscheme gruvbox]])
-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
---------------------------------------------------------
-- END: COLORSCHEME
