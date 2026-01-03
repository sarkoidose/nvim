-- bread's neovim config - GRUVBOX ULTIMATE
-- auto install vim-plug and plugins
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
    vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    vim.o.runtimepath = vim.o.runtimepath
    vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.loader.enable() -- Cache de performance

vim.call('plug#begin')
-- Thèmes
Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) 
-- Plugins UI
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('folke/which-key.nvim')
Plug('romgrk/barbar.nvim')
Plug('goolord/alpha-nvim')
Plug('norcalli/nvim-colorizer.lua')
-- Outils
Plug('nvim-treesitter/nvim-treesitter')
Plug('mfussenegger/nvim-lint')
Plug('nvim-tree/nvim-tree.lua')
Plug('windwp/nvim-autopairs')
Plug('lewis6991/gitsigns.nvim')
Plug('numToStr/Comment.nvim')
Plug('ibhagwan/fzf-lua')
Plug('numToStr/FTerm.nvim')
-- Syntaxe
Plug('ron-rs/ron.vim')
Plug('MeanderingProgrammer/render-markdown.nvim')
Plug('emmanueltouzery/decisive.nvim')
Plug('folke/twilight.nvim')
vim.call('plug#end')

-- 1. Bases (Indépendantes des plugins)
require("config.theme")
require("config.options")
require("config.autocmd")

-- 2. Plugins UI essentiels (Chargement immédiat)
require("plugins.alpha")
require("plugins.barbar")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lint")
require("plugins.render-markdown")

-- 3. Chargement différé (+200ms pour la stabilité)
vim.defer_fn(function() 
    -- Chargement des plugins lourds
    require("plugins.autopairs")
    require("plugins.fterm")
    require("plugins.fzf-lua")
    require("plugins.nvim-tree")
    require("plugins.treesitter")
    require("plugins.twilight")
    require("plugins.which-key")

    -- Tentative sécurisée de chargement des mappings
    local ok, err = pcall(require, "config.mappings")
    if not ok then
        print("Erreur dans mappings.lua: " .. err)
    end
end, 200)

-- 4. Initialisation Gruvbox
load_theme()
