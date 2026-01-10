-- 1. SILENCE TOTAL (On étouffe les warnings de Neovim 0.11)
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
    if msg:find("lspconfig") or msg:find("deprecated") then return end
    original_notify(msg, level, opts)
end

-- 2. INITIALISATION MASON
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "clangd" }
})

-- 3. CONFIGURATION LSP EXPLICITE (Zéro boucle, Zéro erreur __index)
local lspconfig = require("lspconfig")
local caps = require('cmp_nvim_lsp').default_capabilities()

-- On configure chaque serveur manuellement pour éviter le crash
-- Si l'un échoue, le pcall empêche tout l'éditeur de planter
pcall(function() lspconfig.lua_ls.setup({ capabilities = caps }) end)
pcall(function() lspconfig.pyright.setup({ capabilities = caps }) end)
pcall(function() lspconfig.clangd.setup({ capabilities = caps }) end)

-- 4. CONFIGURATION DU MENU CMP (Autocomplétion)
local cmp = require('cmp')
cmp.setup({
    snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({ { name = 'nvim_lsp' } })
})
