-- Force l'affichage permanent et les couleurs vraies (RTX 4070)
vim.opt.showtabline = 2

local status, bufferline = pcall(require, "bufferline")
if not status then return end

bufferline.setup({
    options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
        separator_style = "slant", -- Style oblique très esthétique
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        -- Liaison avec ton cerveau LSP
        diagnostics = "nvim_lsp", 
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {\n                filetype = "NvimTree",
                text = "EXPLORATEUR",
                text_align = "left",
                separator = true
            }
        },
    }
})
