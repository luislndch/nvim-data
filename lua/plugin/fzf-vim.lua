
vim.api.nvim_create_user_command('ConfigFiles', function(opts) 
    vim.fn['fzf#vim#files']('$localappdata\\nvim', opts.bang);
end,{})
