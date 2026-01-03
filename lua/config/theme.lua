-- lua/config/theme.lua
function _G.load_theme()
  vim.opt.termguicolors = true
  vim.opt.background = "dark"

  require("gruvbox").setup({
    contrast = "hard", -- Hard est indispensable pour le fond de ton terminal #282828
    palette_overrides = {
        dark0_hard = "#1d2021", -- Un fond encore plus profond pour Neovim
    },
    italic = {
      strings = true,
      comments = true,
      operators = false,
    },
  })

  vim.cmd("colorscheme gruvbox")
end
