vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.dap_virtual_text = true
vim.g.slime_target = "tmux"

-- lazy package manager
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

require "yokurang.options"
require "yokurang.mappings"
require "yokurang.plugins"
require "yokurang.plugin_configs"