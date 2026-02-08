local status, render = pcall(require, "render-markdown")
if not status then return end

render.setup({
    heading = {
        enabled = true,
        border = false,
        position = 'overlay',
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        -- Utilisation des couleurs standards Gruvbox pour garantir la compatibilité
        backgrounds = {
            'GruvboxRed',
            'GruvboxOrange',
            'GruvboxYellow',
            'GruvboxGreen',
            'GruvboxAqua',
            'GruvboxBlue',
        },
        foregrounds = {
            'GruvboxBg0', -- Texte sombre sur fond coloré (plus lisible)
            'GruvboxBg0',
            'GruvboxBg0',
            'GruvboxBg0',
            'GruvboxBg0',
            'GruvboxBg0',
        },
    },
    code = {
        enabled = true,
        sign = false,
        style = 'full',
        position = 'left',
        width = 'block',
        border = 'thick',
        highlight = 'GruvboxBg1', -- Fond subtil pour les blocs de code
    },
    link = {
        enabled = true,
        footnote = { enabled = true },
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        wiki = { icon = '󱗖 ' },
        custom = {
            web = { pattern = '^http', icon = '󰖟 ' },
            github = { pattern = 'github%.com', icon = '󰊤 ' },
            youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
        },
    },
    callout = {
        note      = { raw = '[!NOTE]',      rendered = '󰋽 Note',      highlight = 'GruvboxBlue'},
        tip       = { raw = '[!TIP]',       rendered = '󰌶 Tip',       highlight = 'GruvboxGreen'},
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'GruvboxPurple'},
        warning   = { raw = '[!WARNING]',   rendered = '󰀪 Warning',   highlight = 'GruvboxYellow'},
        caution   = { raw = '[!CAUTION]',   rendered = '󰳦 Caution',   highlight = 'GruvboxRed'},
    },
    checkbox = {
        enabled = true,
        unchecked = { icon = '󰄱 ', highlight = 'GruvboxGray' },
        checked = { icon = '󰱒 ', highlight = 'GruvboxGreen' },
    },
    bullet = {
        enabled = true,
        icons = { '●', '○', '◆', '◇' },
    },
    latex = { enabled = false }, -- Désactivé pour éviter les erreurs si pas installé
})
