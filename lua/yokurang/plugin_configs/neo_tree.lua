require("neo-tree").setup({
  source_selector = {
    winbar = false,
    statusline = false
  },
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
    }
  },
})

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {})
vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})

