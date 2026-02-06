-- ==============================================================================
-- ⌨️  MAPPINGS : CONFIGURATION INTÉGRALE (NVIM 0.11 & BUFFERLINE)
-- ==============================================================================

local function map(m, k, v, desc)
    vim.keymap.set(m, k, v, { noremap = true, silent = true, desc = desc })
end

-- 1. INITIALISATION LEADER
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. GESTION DES BUFFERS (Bufferline.nvim - Stable 0.11)
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", "Onglet suivant")
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", "Onglet précédent")
map("n", "<leader>q", "<cmd>bdelete<CR>", "Fermer l'onglet")
map("n", "<leader>Q", "<cmd>bdelete!<CR>", "Forcer fermeture")
map("n", "<leader>U", "<cmd>bufdo bd<CR>", "Fermer TOUS les onglets") 
map('n', '<leader>vs', '<cmd>vsplit<CR><cmd>BufferLineCycleNext<CR>', "Split & Suivant")

-- Position & Réorganisation (Alt + Chiffres)
map('n', '<A-S-h>', '<cmd>BufferLineMovePrev<CR>', "Déplacer onglet gauche")
map('n', '<A-S-l>', '<cmd>BufferLineMoveNext<CR>', "Déplacer onglet droite")

for i = 1, 9 do
    map('n', string.format('<A-%d>', i), string.format('<cmd>BufferLineGoToBuffer %d<CR>', i), "Aller à l'onglet " .. i)
end
map('n', '<A-p>', '<cmd>BufferLineTogglePin<CR>', "Épingler l'onglet")

-- 3. WINDOWS (Navigation & Redimensionnement)
map("n", "<C-h>", "<C-w>h", "Focus gauche")
map("n", "<C-j>", "<C-w>j", "Focus bas")
map("n", "<C-k>", "<C-w>k", "Focus haut")
map("n", "<C-l>", "<C-w>l", "Focus droite")
map("n", "<F5>\", \":resize +2<CR>\")
map("n", "<F6>", \":resize -2<CR>\")
map("n", "<F7>", \":vertical resize +2<CR>\")
map("n", "<F8>", \":vertical resize -2<CR>\")

-- 4. RECHERCHE (Fzf-lua optimisé pour RTX 4070)
map("n", "<leader>f", \":lua require('fzf-lua').files()<CR>\", \"Chercher Fichiers\")
map("n", "<leader>Fh", \":lua require('fzf-lua').files({ cwd = '~/' })<CR>\")
map("n", "<leader>Fc", \":lua require('fzf-lua').files({ cwd = '~/.config' })<CR>\")
map("n", "<leader>g", \":lua require('fzf-lua').grep()<CR>\", \"Chercher texte (Grep)\")
map("n", "<leader>G", \":lua require('fzf-lua').grep_cword()<CR>\", \"Grep mot sous curseur\")
-- <leader>F refers to fzf-lua options/pickers (handled by which-key.nvim descriptions)

-- 5. UTILITAIRES SYSTÈME & FICHIERS
map("n", "<leader>s", \":%s//g<Left><Left>\", \"Substitution globale\") 
map("n", "<leader>w", \":w<CR>\", \"Sauvegarder\")
map("n", "<leader>x", \"<cmd>!chmod +x %<CR>\", \"Rendre exécutable\")
map("n", "<leader>u", ':silent !xdg-open \"<cWORD>\" &<CR>', \"Ouvrir lien/URL\")
map("n", "<leader>R", \":so %<CR>\", \"Recharger fichier actuel\")
map("n", "<leader>W", \":set wrap!<CR>\", \"Toggle Wrap\")

-- 6. INTERFACE & PLUGINS
map("n", "<leader>t", \":NvimTreeToggle<CR>\", \"Explorateur fichiers\")
map("n", "<leader>p", function() load_theme() end, \"Recharger Gruvbox\")
map("n", "<leader>P", \":PlugInstall<CR>\")
map("n", "<leader>l", \":Twilight<CR>\", \"Mode Focus\")

-- 7. TERMINAL & MONITORING
map('n', '<leader>z', \":lua require('FTerm').toggle()<CR>\", \"Terminal flottant\")
map('t', '<Esc>', '<C-\\\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>')
-- <leader>H refers to the dedicated htop floating terminal instance (FTerm.nvim)

-- 8. CSV & DATA (Decisive)
map("n", "<leader>csa", \":lua require('decisive').align_csv({})<cr>\")
map("n", "[c", \":lua require('decisive').align_csv_prev_col()<cr>\")
map("n", \"]c", \":lua require('decisive').align_csv_next_col()<cr>\")

-- 9. AUTOMATISATION (Make sur 32 cœurs)
map("n", "<leader>ma", function()\n    local bufdir = vim.fn.expand(\"%:p:h\")
    vim.cmd(\"lcd \" .. bufdir)
    print(\"🚀 Build en cours sur 32 cœurs...\")
    vim.cmd(\"!sudo make uninstall && sudo make clean install\")
end, \"Compilation Makefile\")

-- 10. INTELLIGENCE LSP (Le Cerveau)
map("n", "gd", vim.lsp.buf.definition, \"Aller à la Définition\")
map("n", "K", vim.lsp.buf.hover, \"Documentation (Hover)\")
map("n", "<leader>rn", vim.lsp.buf.rename, \"Renommer partout\")
map("n", "<leader>ca", vim.lsp.buf.code_action, \"Actions correctives\")
-- <leader>T refers to Git status functionalities (likely from gitsigns.nvim or specific commands)
