-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.syntax = "on"
vim.cmd("filetype plugin indent on")

-- plugins
local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "javascript", "typescript", "json", "bash", "lua" },
      highlight = { enable = true },
      indent = { enable = false },
    },
  },
  {
      "ellisonleao/gruvbox.nvim", 
      priority = 1000,
  }
}

require("lazy").setup(plugins, {})

require("gruvbox").setup()
vim.cmd.colorscheme "gruvbox"
