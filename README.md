# 🚀 Gnosis Neovim

> A minimalist, high-performance Neovim configuration optimized for **Arch Linux**.

![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Stars](https://img.shields.io/github/stars/sarkoidose/nvim?style=flat-square)
![Language](https://img.shields.io/github/languages/top/sarkoidose/nvim?style=flat-square)
![Neovim](https://img.shields.io/badge/Neovim-0.11+-57A143?style=flat-square&logo=neovim)

---

## Philosophy

*   **Origin:** Based on the configuration by [BreadOnPenguins](https://github.com/BreadOnPenguins/nvim).
*   **Performance:** Optimized loading using `vim-plug` and deferred initialization.
*   **Stability:** Rock-solid buffer management with `bufferline`.
*   **Intelligence:** Full LSP support, smart completion, and specialized data tools.
*   **Aesthetics:** High-contrast **Gruvbox** theme with transparency support.

## Features

- **Gruvbox High-Contrast**: Refined, eye-friendly colors.
- **File Management**: `Nvim-Tree` and `fzf-lua` for fast navigation.
- **LSP & Autocomplete**: Powered by `lspconfig`, `mason`, and `nvim-cmp`.
- **Data Science Support**: CSV alignment with `decisive.nvim` and Markdown rendering.
- **Developer Tools**: Integrated terminal (`FTerm`), Git signs, and `make` automation.
- **Turbo-Boost**: Lua-based configuration with performance improvements.

## Keybindings (Leader: `<Space>`)

| Key | Action |
| :--- | :--- |
| `Leader + f` | Find Files (`fzf-lua`) |
| `Leader + g` | Live Grep search |
| `Leader + t` | Toggle File Explorer (`Nvim-Tree`) |
| `Leader + z` | Toggle Floating Terminal (`FTerm`) |
| `Shift + h/l` | Navigate buffers (left/right) |
| `Leader + q` | Close current buffer |
| `Leader + w` | Save file |
| `Leader + l` | Toggle Focus Mode (`Twilight`) |
| `gd` | Go to definition |
| `K` | Hover documentation |

## Installation

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

# Launch Neovim
nvim
```

---
*Maintained by sarkoidose.*
