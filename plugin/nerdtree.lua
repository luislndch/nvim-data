vim.keymap.set('n','<leader>n',':NERDTreeFocus<CR>',{silent=true});
vim.keymap.set('n','<C-n>',':NERDTree<CR>',{silent=true});
vim.keymap.set('n','<C-t>',':NERDTreeToggle<CR>',{silent=true});
vim.keymap.set('n','<C-f>',':NERDTreeFind<CR>',{silent=true});

--open NERDTree at startup
vim.api.nvim_create_autocmd('VimEnter',{
	pattern = {"*"},
	callback = function()
		if vim.fn.argc() == 0 then
		  vim.cmd("NERDTree | wincmd p")
		end
	end
})

