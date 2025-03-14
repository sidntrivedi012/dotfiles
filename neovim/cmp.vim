" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

lua <<EOF
-- No idea what these 8 lines do. Just blindly copying from the docs.
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Fetch nvim-cmp
local cmp = require "cmp"
local lspkind = require("lspkind")

-- Actually setup nvim-cmp
local c = {
    autocomplete = false,
    preselect = true,
    sources = {},
    completion = {completeopt = "menu,menuone,noinsert,noselect"}
}

c.mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping(
        {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }
    ),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<Tab>"] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end,
        {"i", "s"}
    ),
    ["<S-Tab>"] = cmp.mapping(
        function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end,
        {"i", "s"}
    )
}

c.sources =
    cmp.config.sources(
    {
        {name = "nvim_lsp"},
        {name = "vsnip"}
    },
    {
        {name = "buffer"}
    }
)

c.snippet = {
    -- Snippet engine
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end
}

cmp.setup(c)

cmp.setup.cmdline(
    "/",
    {
        completion = {
            -- Might allow this later, but I don't like it right now really.
            -- Although, perhaps if it just triggers w/ @ then we could.
            --
            -- I will have to come back to this.
            autocomplete = false
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp_document_symbol"}
            },
            {}
        )
    }
)

cmp.setup.cmdline(
    ":",
    {
        completion = {
            autocomplete = false
        },
        sources = cmp.config.sources(
            {
                {
                    name = "path"
                }
            },
            {
                {
                    name = "cmdline",
                    max_item_count = 20,
                    keyword_length = 4
                }
            }
        )
    }
)

cmp.setup {
    formatting = {
        format = lspkind.cmp_format(
            {
                with_text = true,
                menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[api]",
                    path = "[path]",
                    luasnip = "[snip]",
                    gh_issues = "[issues]",
                    tn = "[TabNine]"
                }
            }
        )
    }
}

local kind_icons = {
    Text = "?",
    Method = "?",
    Function = "?",
    Constructor = "?",
    Field = "?",
    Variable = "?",
    Class = "?",
    Interface = "?",
    Module = "?",
    Property = "?",
    Unit = "?",
    Value = "?",
    Enum = "?",
    Keyword = "?",
    Snippet = "?",
    Color = "?",
    File = "?",
    Reference = "?",
    Folder = "?",
    EnumMember = "?",
    Constant = "?",
    Struct = "?",
    Event = "?",
    Operator = "?",
    TypeParameter = "?"
}
EOF

