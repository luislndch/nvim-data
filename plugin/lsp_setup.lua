-- 1. Initialize Mason (Server Installer)
require("mason").setup()
require("mason-lspconfig").setup({
  -- Automatically install servers for Python & JS/TS
  ensure_installed = { "ts_ls", "pyright" },
})

-- 2. Setup LSP Config with Completion Capabilities
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Keybindings helper function (Runs only when LSP connects)
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end

-- Configure Python and JS/TS servers
lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })

-- 3. Autocompletion Setup (nvim-cmp)
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})
