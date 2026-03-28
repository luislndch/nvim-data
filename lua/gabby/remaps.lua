
-- check OS
local current_os = vim.loop.os_uname()['sysname'];

-- options
vim.g.mapleader=",";
vim.o.shiftwidth=4;
vim.o.tabstop=4;
vim.o.splitright=true;
vim.o.splitbelow=true;
vim.o.wrap=true;
vim.o.shiftwidth=4;
vim.o.relativenumber=true;
vim.o.number=true;
vim.o.scrolloff=0
vim.g.choosewin_active=1;

-- autocommands
vim.api.nvim_create_augroup('mine', {clear=true})
vim.api.nvim_create_augroup('comments', {clear=true});

vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'},{
    pattern={"*.tsx","*.ts","*.jsx","*.js","*.java","*.css"},
    group="comments",
    callback = function(args)
	vim.keymap.set('i','<C-g>','/**/<Left><Left>  <Left>')
    end,
});

vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'},{
    pattern={"*.html"},
    group="comments",
    callback = function(args)
	vim.keymap.set('i','<C-g>','<!----><Left><Left><Left>')
    end,
});

function change_indent_mode()
	if vim.opt.indentexpr:get() == "nvim_treesitter#indent()" then 
		vim.opt.indentexpr="none"
		print "changing to default indents"
	else
		vim.opt.indentexpr="nvim_treesitter#indent()"
		print "returning to treesitter indent"
	end
end

vim.keymap.set('n','<leader>i', change_indent_mode);
vim.keymap.set('i', '<A-i>', change_indent_mode);



vim.api.nvim_create_autocmd({"FocusGained", "BufEnter","CursorHold"}, {
    pattern={"*"},
    group="mine",
    callback=function() vim.cmd('checktime') end,
});

-- remaps
vim.keymap.set('n', 'dl', [[^"*dg_]]);
vim.keymap.set('v', '<A-k>', [[dkPV]])
vim.keymap.set('v', '<A-j>', [[djPV]])
vim.keymap.set('n','<C-w>t',[[:split<CR><C-w>T]]);
vim.keymap.set('n','<C-w>C',[[:tabclose<CR>]]);
vim.keymap.set('n','<leader>gc',[[:%bd<CR>:b#<CR>:bd!#<CR>]]);
vim.keymap.set('n','<leader>gd',[[:b#<CR>:bd!#<CR>]]);
vim.keymap.set('n','gn',[[:bn<CR>]]);
vim.keymap.set('n','gp',[[:bp<CR>]]);
vim.keymap.set('i','jk','<Escape>');
vim.keymap.set('n', '<C-n>', vim.cmd.NERDTree);
-- vim.keymap.set('n','<leader>kv', function() vim.cmd[[e $localappdata\nvim\lua\gabby\remaps.lua]] end, {desc = "opens remaps.lua"});
vim.keymap.set('n','<leader>ki', function() vim.cmd[[e $MYVIMRC]] end, {desc = 'opesn init.lua'});
vim.keymap.set('n','<leader>w', function() vim.opt.wrap=not vim.opt.wrap:get() end);

-- windows
-- vim.keymap.set('n','<leader><C-s>', [[:mksession! $localappdata\nvim-data\sessions\]]);

--linux
if current_os == "Linux" then
	vim.keymap.set('n','<leader><C-s>', [[:mksession! =stdpath("data")<CR>/sessions/]]);
	vim.keymap.set('n','<leader><C-l>', [[:source =stdpath("data")<CR>/sessions/]]);	
elseif current_os == "Windows_NT" then
	vim.keymap.set('n','<leader><C-s>', [[:mksession! =stdpath("data")<CR>\sessions\]]);
	vim.keymap.set('n','<leader><C-l>', [[:source =stdpath("data")<CR>\sessions\]]);
end

vim.keymap.set('n','<leader><C-d>', [[:!del $localappdata\nvim-data\sessions\]]);
vim.keymap.set('n','<A-e>', vim.cmd.Ex);
vim.keymap.set('n','<C-s>', vim.cmd.write);
vim.keymap.set('n','<A-n>', vim.cmd.noh);
vim.keymap.set('n','<A-Down>', function() vim.cmd([[res -3]]) end);
vim.keymap.set('n','<A-Up>', function() vim.cmd([[res +3]]) end);
vim.keymap.set('n','<A-Right>', function() vim.cmd([[vertical-resize -3]]) end);
vim.keymap.set('n','<A-Left>', function() vim.cmd([[vertical-resize +3]]) end);
vim.keymap.set('n', '<C-k>', function() vim.cmd([[wincmd k]]) end);
vim.keymap.set('n', '<C-j>', function() vim.cmd([[wincmd j]]) end);
vim.keymap.set('n', '<C-h>', function() vim.cmd([[wincmd h]]) end);
vim.keymap.set('n', '<C-l>', function() vim.cmd([[wincmd l]]) end);
vim.keymap.set('n', '<S-l>', "gt");
vim.keymap.set('n', '<S-h>', "gT");
vim.keymap.set('n','<leader><C-w>v',[[:ToggleTerm direction=vertical size=50<CR>]]);
vim.keymap.set('n','<leader><C-w>s',[[:ToggleTerm direction=horizontal size=20<CR>]]);
vim.keymap.set("n", "<A-h>",[[H]]);
vim.keymap.set("n", "<A-l>",[[L]]);
vim.keymap.set("n", "<A-m>",[[M]]);
vim.keymap.set("n", "<C-PageDown>", [[:tabmove +1<CR>]]);
vim.keymap.set("n", "<C-PageUp>", [[:tabmove -1<CR>]]);
vim.keymap.set("n", ";", "@");
vim.keymap.set("n", "<A-u>", vim.cmd.UndotreeToggle);
vim.keymap.set("n","<A-o>", function() 
	require('nvim-window').pick()
end, {desc="switches between active windows"})

vim.keymap.set('t','<C-k>',function() vim.cmd([[wincmd k]]) end);
vim.keymap.set('t','<C-j>',function() vim.cmd([[wincmd j]]) end);
vim.keymap.set('t','<c-h>',function() vim.cmd([[wincmd h]]) end);
vim.keymap.set('t','<C-l>',function() vim.cmd([[wincmd l]]) end);
vim.keymap.set('t', '<C-[>', [[<Escape>]]);
vim.keymap.set('t','<C-w>',[[]]);
vim.keymap.set('t','<C-c>',[[]]);
vim.keymap.set('t','<C-q>',[[exit<CR>]]);

vim.keymap.set('n','<A-i>',[[]]);
vim.keymap.set('n','<A-s>',[[]]);
vim.keymap.set('n', '<C-q>', [[q]]);
vim.keymap.set('n', '<A-j>',[[:bn<CR>]],{desc="buffer next"});
vim.keymap.set('n', '<A-k>',[[:bp<CR>]],{desc="buffer previous"});
vim.keymap.set('n', '<A-d>',[[:bn<CR>:bd!#<CR>]],{desc="buffer delete"});
vim.keymap.set('n', '<leader>s',[[:CocCommand snippets.editSnippets<CR>]],{desc="Edit the snippet associated to the current file"});
vim.keymap.set('n', '<C-w>N', [[:vsp<CR>]], {desc="Splits the current window vertically"});
vim.keymap.set("n","<Leader>q", function() 
    print(list["a"]);
end)
vim.keymap.set("n", "<Leader>e", function()
	vim.cmd("Ex");
end);

-- commands
vim.api.nvim_create_user_command('Config',function() vim.cmd([[e C:\Users\gg\AppData\local\nvim\]]) end, {});

vim.api.nvim_create_user_command('Plugcfg',function() vim.cmd([[e C:\Users\gg\AppData\Local\nvim\plugin]]) end, {});

vim.api.nvim_create_user_command('Flush', function() 
    vim.cmd([[%bd]]);
end, {});

print('remaps initialized!')
