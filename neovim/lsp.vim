lua <<EOF
-- LANGUAGE SERVER BINDINGS
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup and enable LSP servers
require("lspconfig").gopls.setup(
    {
	on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"gopls", "serve"},
        settings = {
            gopls = {
		gofumpt = true,
                analyses = {
			unreachable = true,
			unusedparams = true
                },
		codelenses = {
			gc_details = true,
			tidy = true
		},
                staticcheck = true
            }
        }
    }
)

require("lspconfig").rust_analyzer.setup(
    {
	on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self"
                }
            }
        }
    }
)

require("lspconfig").tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require'lspconfig'.html.setup {
	capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			end
      		}
	}
}
EOF

" goimports hack
lua << EOF
function org_imports(wait_ms)
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit)
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
  end

EOF

" Run formatting on every write
autocmd BufWritePre *.go :silent! lua vim.lsp.buf.formatting()
" Run `org_import` func to do the `organizeImports` thing
autocmd BufWritePre *.go :silent! lua org_imports(3000)
