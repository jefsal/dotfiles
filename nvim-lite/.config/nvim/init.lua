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

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
local ts_langs = { "javascript", "typescript", "json", "bash", "lua" }
-- vim filetype names differ from tree-sitter parser names for some langs
-- (bash scripts are filetype "sh", not "bash")
local ts_filetypes = { "javascript", "typescript", "json", "sh", "lua" }

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(ts_langs)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = ts_filetypes,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
  {
      "ellisonleao/gruvbox.nvim", 
      priority = 1000,
  }
}

require("lazy").setup(plugins, {})

require("gruvbox").setup()
vim.cmd.colorscheme "gruvbox"

-- keymaps
vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { desc = "Toggle file explorer" })
