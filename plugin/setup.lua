local capabilities = vim.lsp.protocol.make_client_capabilities();

-- 1. Initialize Mason to download the servers
require("mason").setup()

-- 2. IMPORTANT: Prepend Mason's binary directory to Neovim's PATH 
-- This makes 'ts_ls' instantly visible to Neovim's native vim.lsp.enable engine.
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- 3. Initialize Mason-LSPConfig
require("mason-lspconfig").setup({
  -- Ensure your servers are installed by Mason
  ensure_installed = { "lua_ls", "ts_ls" },
  
  -- Modern v0.12 way: let it translate names and call vim.lsp.enable() natively
  automatic_enable = true 
})

-- 4. Enable them natively (if you aren't using automatic_enable)
vim.lsp.enable("lua_ls")

vim.lsp.enable("ts_ls")
vim.lsp.config['ts_ls'] = {
	capabilities = capabilities,
}
