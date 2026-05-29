--autocmds

vim.api.nvim_create_autocmd('StdinReadPre',{
    pattern = {"*"},
    command = "let s:std_in=1"
})


require('gabby.remaps')

print('gabby initialized!')

