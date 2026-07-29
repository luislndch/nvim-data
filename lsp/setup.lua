-- setup lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities();
vim.lsp.config['ts_ls'] = {
	capabilities = capabilities,
	init_options = {
		prefernces = {
			-- 1. Disable global package seraching to stop the lag
			includeCompletionsForImportsStatments = false,
			includeCompletionsWithSnippetText = false,

			-- 2. FORCE the engine to treat node_modules as a complete black box
			autoIMportFileExcludePatterns = {
				"**/node_modules/**",
				"node_modules",
				"**/node_modules/*"
			},
		},
	},
	settings = {
		typescript = {
			suggest = {
				autoImports = true, --Stays true, but now only works with
			},
		},
		javascript = {
			suggest = true,
		}
	}
}



-- setup mason-lspconfig
require("mason-lspconfig").setup({
	automatic_enable = true,
});


-- completion setup
local cmp = require('cmp')

cmp.setup({

	autocomplete = {cmp.TriggerEvent.TextChanged},

  -- 1. Tell nvim-cmp to use vsnip for snippet rendering
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) 
    end,
  },

  -- 2. VS Code Keymaps: Enter to accept, Tab to cycle down, Shift+Tab to cycle up
  mapping = cmp.mapping.preset.insert(
	  {
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(), -- Force open menu manually if needed
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
	  ['<Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
		  cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
		  luasnip.expand_or_jump()
		else
		  fallback()
		end
	  end, { 'i', 's' }),
	  ['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
		  cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
		  luasnip.jump(-1)
		else
		  fallback()
		end
	  end, { 'i', 's' }),
	}
  ),

  -- 3. Include 'vsnip' in your active sources list
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Data from ts_ls, eslint, etc.
    { name = 'vsnip' },    -- Your VS Code style snippets
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})
