-- =============================================================================
-- 🚀 BREAD'S NEOVIM : FORTERESSE GRUVBOX (32-CORES OPTIMIZED)
-- =============================================================================

-- 1. BOOTSTRAP (Vim-Plug)
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
    vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    vim.o.runtimepath = vim.o.runtimepath
    vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local Plug = vim.fn['plug#']
vim.loader.enable() -- Turbo-boost au démarrage

-- 2. DÉCLARATION DES PLUGINS
vim.call('plug#begin')
    -- UI & Thème
    Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' })
    Plug('nvim-lualine/lualine.nvim')
    Plug('nvim-tree/nvim-web-devicons')
    Plug('akinsho/bufferline.nvim', { ['tag'] = 'v4.9.1' })
    Plug('goolord/alpha-nvim')
    Plug('norcalli/nvim-colorizer.lua')
    Plug('folke/which-key.nvim', { ['tag'] = 'v3.17.0' })

    -- Outils & Navigation
    Plug('nvim-treesitter/nvim-treesitter')
    Plug('mfussenegger/nvim-lint')
    Plug('nvim-tree/nvim-tree.lua', { ['tag'] = '1.15.0' })
    Plug('windwp/nvim-autopairs', { ['tag'] = '0.11.0' })
    Plug('lewis6991/gitsigns.nvim', { ['tag'] = '0.9.0' }) -- Changed
    Plug('numToStr/Comment.nvim')
    Plug('ibhagwan/fzf-lua')
    Plug('numToStr/FTerm.nvim')

    -- Syntaxe & Langages
    Plug('ron-rs/ron.vim')
    Plug('MeanderingProgrammer/render-markdown.nvim')
    Plug('emmanueltouzery/decisive.nvim')
    Plug('folke/twilight.nvim')

    -- Cerveau (LSP) & Complétion
    Plug('williamboman/mason.nvim')
    Plug('williamboman/mason-lspconfig.nvim')
    Plug('neovim/nvim-lspconfig')
    Plug('hrsh7th/nvim-cmp')
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('L3MON4D3/LuaSnip')
    Plug('hrsh7th/cmp-buffer')
    Plug('hrsh7th/cmp-path')
vim.call('plug#end')

-- 3. CHARGEMENT DES BASES
require("config.theme")
require("config.options")
require("config.autocmd")

-- 4. CHARGEMENT DES PLUGINS UI (Immédiat)
require("plugins.alpha")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lint")
require("plugins.render-markdown")

-- 5. CHARGEMENT DIFFÉRÉ (+200ms pour la réactivité Ghostty)
vim.defer_fn(function()
    require("plugins.autopairs")
    require("plugins.fterm")
    require("plugins.fzf-lua")
    require("plugins.nvim-tree")
    require("plugins.treesitter")
    require("plugins.twilight")
    require("plugins.which-key")
    require("plugins.bufferline")
    require("plugins.lsp")

    -- Mappings finaux
    pcall(require, "config.mappings")
end, 200)

-- 6. DÉMARRAGE DU THÈME
load_theme()

-- Test de synchro le 03 fevrier 2026
