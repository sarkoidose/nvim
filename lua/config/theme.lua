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

    -- Fix contraste texte sur fond transparent
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#ebdbb2', bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = '#d5c4a1', bg = 'none' })

    -- Fix contraste markdown (doit être APRÈS colorscheme gruvbox)
    local fg = '#ebdbb2'
    local orange = '#fe8019'
    local yellow = '#fabd2f'
    local aqua = '#8ec07c'
    local blue = '#83a598'
    local purple = '#d3869b'
    local grey = '#928374'

    local md_highlights = {
        -- Treesitter markdown body text
        ['@text']                           = { fg = fg },
        ['@text.literal']                   = { fg = orange },
        ['@text.reference']                 = { fg = blue },
        ['@text.uri']                       = { fg = aqua, underline = true },
        ['@text.emphasis']                  = { fg = purple, italic = true },
        ['@text.strong']                    = { fg = yellow, bold = true },
        ['@markup']                         = { fg = fg },
        ['@markup.raw']                     = { fg = orange },
        ['@markup.raw.markdown_inline']     = { fg = orange, bold = true },
        ['@markup.link']                    = { fg = blue, underline = true },
        ['@markup.link.markdown_inline']    = { fg = blue, underline = true },
        ['@markup.link.url']               = { fg = aqua, underline = true },
        ['@markup.link.label']             = { fg = blue },
        ['@markup.strong']                 = { fg = yellow, bold = true },
        ['@markup.italic']                 = { fg = purple, italic = true },
        ['@markup.list']                   = { fg = orange },
        ['@markup.list.unchecked']         = { fg = grey },
        ['@markup.list.checked']           = { fg = aqua },
        ['@markup.heading']                = { fg = yellow, bold = true },
        ['@markup.heading.1']              = { fg = yellow, bold = true },
        ['@markup.heading.2']              = { fg = orange, bold = true },
        ['@markup.heading.3']              = { fg = aqua, bold = true },
        ['@punctuation.special.markdown']  = { fg = orange },
        -- render-markdown tables
        ['RenderMarkdownTableHead']        = { fg = yellow, bold = true },
        ['RenderMarkdownTableRow']         = { fg = fg },
        ['RenderMarkdownTableFill']        = { fg = grey },
        ['RenderMarkdownBorder']           = { fg = grey },
        -- Code blocks — fond semi-visible + texte clair
        ['RenderMarkdownCode']             = { bg = '#1d2021', fg = fg },
        ['markdownCodeBlock']              = { fg = aqua },
        ['markdownCode']                   = { fg = orange },
        ['GruvboxBg1']                     = { bg = '#1d2021', fg = fg },
    }

    for group, opts in pairs(md_highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end
