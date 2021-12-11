" =============================================
" TREE-SITTER
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go","javascript","toml","python","json","yaml","dockerfile"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
