-- 1. SILENCE TOTAL (On étouffe les warnings de Neovim 0.11)
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
    if msg:find("lspconfig") or msg:find("deprecated") then return end
    original_notify(msg, level, opts)
end

-- 2. RÉPARATION DU PATH (Pour éviter l'erreur "Spawning language server failed")
-- Cela force Neovim à regarder dans le dossier de Mason pour trouver les binaires
-- local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
-- vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

-- 3. INITIALISATION MASON & LSPCONFIG
require("mason").setup()
local lspconfig = require("lspconfig")
local caps = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "clangd" },
    handlers = {
        -- Configuration par défaut pour tous les serveurs
        function (server_name)
            lspconfig[server_name].setup({ capabilities = caps })
        end,

        -- Surcharge spécifique pour Lua (Élimine les 28 erreurs)
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                capabilities = caps,
                settings = {\n                    Lua = {\n                        diagnostics = {\n                            -- Définit 'vim' comme global pour éviter les erreurs de syntaxe\n                            globals = { 'vim', 'Plug' },\n                        },\n                        workspace = {\n                            -- Fait connaître l'API de Neovim au serveur\n                            library = vim.api.nvim_get_runtime_file("", true),\n                            checkThirdParty = false,\n                        },\n                        telemetry = { enable = false },\n                    },\n                },\n            })\n        end,\n    }\n})\n\n-- 4. CONFIGURATION DU MENU CMP (Autocomplétion)\nlocal cmp = require('cmp')\ncmp.setup({\n    snippet = { \n        expand = function(args) require('luasnip').lsp_expand(args.body) end \n    },\n    mapping = cmp.mapping.preset.insert({\n        ['<C-Space>'] = cmp.mapping.complete(),\n        ['<CR>'] = cmp.mapping.confirm({ select = true }),\n        ['<Tab>'] = cmp.mapping.select_next_item(),\n        ['<S-Tab>'] = cmp.mapping.select_prev_item(),\n    }),\n    sources = cmp.config.sources({ \n        { name = 'nvim_lsp' },\n        { name = 'luasnip' },\n    })\n})\n