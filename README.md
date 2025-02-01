# Hawttstrokes Neovim Config

This is my personal one-file Windows Neovim configuration that uses packer-nvim. It includes support for LSP, Treesitter, fuzzy finding, Git integration, autocompletion, theming, and configurations for TidalCycles and SuperCollider. 

### Core Enhancements
- **File Explorer**: [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- **Fuzzy Finder**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- **Status Line**: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- **Git Integration**: [vim-fugitive](https://github.com/tpope/vim-fugitive), [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- **Syntax Highlighting**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### LSP & Autocompletion
- **LSP Support**: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- **Autocompletion**: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with sources for LSP, snippets, and buffers
- **Snippets**: [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

### Other Utilities
- **Autopairs**: [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- **Commenting**: [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- **Indentation Guides**: [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- **Color Scheme**: [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

### Live Coding Support
- **TidalCycles**: [vim-tidal](https://github.com/tidalcycles/vim-tidal)
- **SuperCollider**: [scnvim](https://github.com/davidgranstrom/scnvim)

## Custom Keybindings

### General
- `<leader> + space`: Leader key
- `<leader> + ts`: Send TidalCycles line
- `<leader> + th`: Hush TidalCycles audio
- `<leader> + st`: Start SuperCollider
- `<leader> + sk`: Recompile SuperCollider
- `<F1>`: Boot SuperCollider server
- `<F2>`: Open SuperCollider meter
- `<F12>`: Stop SuperCollider hard

## Custom Settings
### Indentation Rules
- **JavaScript, TypeScript, TidalCycles**: 2 spaces
- **Python**: 4 spaces
- **Default**: 4 spaces

### TidalCycles
- Interpreter: `ghci`
- Boot Script: `C:/Users/xenomorph/AppData/Local/nvim-data/site/pack/packer/start/vim-tidal/Tidal.ghci`

### SuperCollider
- Uses `C:/Program Files/SuperCollider-3.12.1/sclang.exe`
- Floating post window enabled


## License
This configuration is provided as-is. Feel free to use and modify it!


