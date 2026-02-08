local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

configs.setup {
    ensure_installed = { "bash", "c", "css", "cpp", "go", "html", "java", "javascript", "lua", "python", "rust", "typescript", "vim", "markdown", "markdown_inline" },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = { enable = true },
}
