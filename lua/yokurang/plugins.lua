require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "dracula/vim" },
  { "nvim-tree/nvim-tree.lua" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  { "nvim-tree/nvim-web-devicons" },
  { "ellisonleao/gruvbox.nvim" },
  { "tpope/vim-commentary" },
  { "mattn/emmet-vim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "vim-test/vim-test" },
  { "lewis6991/gitsigns.nvim" },
  { "preservim/vimux" },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "stevearc/oil.nvim" },

  -- completions

  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "github/copilot.vim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- swagger docs

  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  },


  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
  },

  -- dap
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },

  -- rust
  { "simrat39/rust-tools.nvim" },
  {
    'saecki/crates.nvim',
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" } }
      })
      crates.show()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- Cpp
  {
    "Civitasv/cmake-tools.nvim",
    ft = "cpp",
    dependencies = "nvim-lua/plenary.nvim",
    config = function(_, opts)
      require('cmake-tools').setup(opts)
    end
  },

  -- tCPA
  { "whonore/Coqtail" },

  -- bufferline
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

  -- toggle term
  { 'akinsho/toggleterm.nvim', version = "*", config = true },

  -- vim-slime
  {
    'jpalardy/vim-slime',
    version = "*",
  },

  -- comments
  {
    'numToStr/Comment.nvim',
    opts = {
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
    },
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom", -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      cycle_results = true, -- cycle item list when reaching beginning or end of list
      multiline = true, -- render multi-line messages
      indent_lines = true, -- add an indent guide below the fold icons
    },
  },
  {
    "nvimtools/none-ls.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  {
    "mfussenegger/nvim-lint",
    requires = { "neovim/nvim-lspconfig" },
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason-lspconfig.nvim",
    },
    -- event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  },
  {
    "tjdevries/ocaml.nvim",
    ft = "ocaml",
    requires = { "nvim-lua/plenary.nvim", },
  },
  {
    "nvim-neorg/neorg",
  },
  { 
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
     vim.o.timeout = true
     vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
})
