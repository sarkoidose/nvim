# 🚀 Gnosis Neovim

> A minimalist, high-performance Neovim configuration optimized for **Arch Linux** and a power-user workflow.

![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Stars](https://img.shields.io/github/stars/sarkoidose/nvim?style=flat-square)
![Language](https://img.shields.io/github/languages/top/sarkoidose/nvim?style=flat-square)
![Neovim](https://img.shields.io/badge/Neovim-0.11+-57A143?style=flat-square&logo=neovim)

---

## 👁️ Philosophy "Gnosis"

*   **Performance:** Optimized loading using `vim-plug` and deferred initialization.
*   **Stability:** Rock-solid buffer management with `bufferline`.
*   **Intelligence:** Full LSP support, smart completion, and specialized data tools.
*   **Aesthetics:** High-contrast **Gruvbox** theme with transparency support.

## ✨ Features

- 🎨 **Gruvbox High-Contrast**: Beautiful, eye-friendly colors.
- 📂 **File Management**: `Nvim-Tree` and `fzf-lua` for blazing fast navigation.
- 🧠 **LSP & Autocomplete**: Powered by `lspconfig`, `mason`, and `nvim-cmp`.
- 📊 **Data Science Ready**: CSV alignment with `decisive.nvim` and Markdown rendering.
- 🛠️ **Developer Tools**: Integrated terminal (`FTerm`), Git signs, and quick `make` automation.
- ⚡ **Turbo-Boost**: Lua-based configuration with pre-compiled speed improvements.

## ⌨️ Keybindings (Leader is `<Space>`)

| Key | Action |
| :--- | :--- |
| `Space + f` | Find Files (`fzf-lua`) |
| `Space + g` | Live Grep search |
| `Space + t` | Toggle File Explorer (`Nvim-Tree`) |
| `Space + z` | Toggle Floating Terminal (`FTerm`) |
| `Shift + h/l` | Navigate buffers (left/right) |
| `Space + q` | Close current buffer |
| `Space + w` | Save file |
| `Space + l` | Toggle Focus Mode (`Twilight`) |
| `gd` | Go to definition |
| `K` | Hover documentation |

## 🛠️ Installation

### Prerequisites
- Neovim 0.11+
- A Nerd Font (e.g., JetBrainsMono Nerd Font)
- Build tools: `gcc`, `make`, `git`, `curl`

### Steps
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone Gnosis
git clone https://github.com/sarkoidose/nvim.git ~/.config/nvim

# Launch Neovim (it will auto-install plugins)
nvim
```

---
*Created by [sarkoidose](https://github.com/sarkoidose) with ❤️ for the Arch Linux community.*