# 🌌 Gnosis Neovim Config 

(based on Bread on Penguins > https://github.com/BreadOnPenguins/nvim)

Une configuration Neovim minimaliste, rapide et robuste, optimisée pour **Arch Linux** sur un laptop ROG. Ce setup privilégie la clarté visuelle et l'efficacité du workflow (KISS).

---

## 🧠 Philosophie "Gnosis"
* **Performance :** Chargement optimisé avec les plugins essentiels.
* **Stabilité :** Migration de `barbar` vers `bufferline` pour une gestion des onglets plus moderne.
* **Intelligence :** Autocomplétion riche (LSP) avec support natif des snippets LuaSnip.
* **Esthétique :** Transparence gérée via Picom (95% d'opacité) pour un look "verre dépoli".

---

## 🛠️ Stack Technique

| Catégorie | Outils |
| :--- | :--- |
| **Gestionnaire** | Lazy.nvim / Packer |
| **Interface** | Bufferline, Lualine, Nvim-tree |
| **LSP** | Mason, Nvim-lspconfig |
| **Completion** | Nvim-cmp, LuaSnip |
| **Parsing** | Treesitter |
| **Thème** | Gruvbox (High Contrast) |

---

## 🚀 Installation

Pour cloner cette configuration sur un nouveau système Arch :

```zsh
# Aller dans le dossier config
cd ~/.config

# Cloner le dépôt
git clone [https://github.com/sarkoidose/nvim.git](https://github.com/sarkoidose/nvim.git)
