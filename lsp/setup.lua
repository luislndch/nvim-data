-- completion setup
local cmp = require('cmp');
cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body);
			end
		},

		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({select = true}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif 
					vim.fn["vsnip#available"](1) == 1 then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "");
				else
					fallback()
				end
			end, {"i", "s"}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif vim.fn["vsnip#jumpable"] then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "");
				else 
					fallback();
				end
			end, {"i", "s"}),
	}),

	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "vsnip"},
	},{
		{name = "buffer"},
		{name = "path"},
	})
});

local capabilities = require("cmp_nvim_lsp").default_capabilities();


vim.lsp.config['eslint'] = {
	capabilities = capabilities,
}

vim.lsp.config['ts_ls'] = {
	capabilities = capabilities,
	init_options = {
		preferences = {
			includeCompletionsForImportStatements = true,
			includeCompletionsWithSnippetText = true,

			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhereArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
		},
	},
	settings = {
		typescript = {
			suggest = {
				autoImports = true,
			},
		},
		javascript = {
			suggest = {
				autoImports = true,
			},
		},
	},
}

-- setup mason-lspconfig
require("mason-lspconfig").setup({
	automatic_enable = true,
});
