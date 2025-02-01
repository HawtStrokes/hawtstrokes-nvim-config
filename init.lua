-- Set the leader key to space
vim.g.mapleader = " " 

-- Ensure Packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
  end
end

ensure_packer()

-- Use Packer to manage plugins
require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {}
    end
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup { options = { theme = 'tokyonight' } }
    end
  }

  -- Git Integration
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Treesitter (Better Syntax Highlighting)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true, additional_vim_regex_highlighting = false },
      }
    end
  }

  -- LSP Support
  use {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.ts_ls.setup({})
      lspconfig.pyright.setup {}   -- Python
    end
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, { { name = 'buffer' } })
      })
    end
  }

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Commenting Utility
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Indentation Guides
  use 'lukas-reineke/indent-blankline.nvim'
  -- Color Scheme
  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd[[colorscheme tokyonight]]
    end
  }

  -- TidalCycles
  use 'tidalcycles/vim-tidal'

  -- SuperCollider Plugin
  use 'davidgranstrom/scnvim'
end)

-- Better Indentation Handling
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    if ft == 'tidal' or ft == 'javascript' or ft == 'typescript' then
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
    elseif ft == 'python' then
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
    else
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
    end
  end,
})

-- Tidal Interpreter and Boot script
vim.g.tidal_interpreter = "ghci"
vim.g.tidal_boot = "C:/Users/xenomorph/AppData/Local/nvim-data/site/pack/packer/start/vim-tidal/Tidal.ghci"

-- Custom Tidal Keybindings
vim.api.nvim_set_keymap('n', '<leader>ts', ':TidalSend<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>th', ':TidalHush<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ts', ':TidalSend<CR>', { noremap = true, silent = true })

-- SuperCollider (scnvim) Configuration
local scnvim = require 'scnvim'
scnvim.setup({
  keymaps = {
    ['<M-e>'] = scnvim.map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = { scnvim.map('editor.send_block', {'i', 'n'}), scnvim.map('editor.send_selection', 'x') },
    ['<CR>'] = scnvim.map('postwin.toggle'),
    ['<M-CR>'] = scnvim.map('postwin.toggle', 'i'),
    ['<M-L>'] = scnvim.map('postwin.clear', {'n', 'i'}),
    ['<C-k>'] = scnvim.map('signature.show', {'n', 'i'}),
    ['<F12>'] = scnvim.map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<leader>st'] = scnvim.map('sclang.start'),
    ['<leader>sk'] = scnvim.map('sclang.recompile'),
    ['<F1>'] = scnvim.map_expr('s.boot'),
    ['<F2>'] = scnvim.map_expr('s.meter'),
  },
  postwin = { float = { enabled = true } },
  sclang = { cmd = 'C:/Program Files/SuperCollider-3.12.1/sclang.exe' }
})

