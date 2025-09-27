require('gabby.remaps')

--autocmds

vim.api.nvim_create_autocmd('StdinReadPre',{
    pattern = {"*"},
    command = "let s:std_in=1"
})

vim.api.nvim_create_autocmd('VimEnter',{
    pattern = {"*"},
    callback = function()
	vim.cmd[[if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif]]
    end
})

print('gabby initialized!')

