function load_theme()
    -- 1. Configuration du plugin Gruvbox
    require("gruvbox").setup({
        transparent_mode = true, -- Active la base de la transparence
        terminal_colors = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
        },
    })

    -- 2. Chargement effectif du thème
    vim.cmd("colorscheme gruvbox")

    -- 3. FORÇAGE CHIRURGICAL (Le secret du Mode Glass)
    -- On efface manuellement les fonds restants pour Picom
    local hl_groups = {
        "Normal", "NormalNC", "SignColumn", "LineNr", "CursorLineNr",
        "EndOfBuffer", "MsgArea", "Pmenu", "NormalFloat", "FloatBorder",
        "NvimTreeNormal", "NvimTreeNormalNC" -- Si tu utilises nvim-tree
    }

    for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
end
