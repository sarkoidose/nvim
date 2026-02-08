-- 2. RÉPARATION DU PATH (Pour éviter l'erreur "Spawning language server failed")
-- Cela force Neovim à regarder dans le dossier de Mason pour trouver les binaires
-- local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
-- vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

-- 3. INITIALISATION MASON & LSPCONFIG
require("mason").setup()
local caps = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "clangd" },
    handlers = {
        -- Configuration par défaut pour tous les serveurs
        function (server_name)
            vim.lsp.config[server_name] = { capabilities = caps }
            vim.lsp.enable(server_name)
        end,

        -- Surcharge spécifique pour Lua (Élimine les 28 erreurs)
        ["lua_ls"] = function()
            vim.lsp.config.lua_ls = {
                capabilities = caps,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Définit 'vim' comme global pour éviter les erreurs de syntaxe
                            globals = { 'vim', 'Plug' },
                        },
                        workspace = {
                            -- Fait connaître l'API de Neovim au serveur
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }
            vim.lsp.enable('lua_ls')
        end,
    }
})

-- 4. CONFIGURATION DU MENU CMP (Autocomplétion)
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    })
})
