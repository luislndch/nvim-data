local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin');

Plug('preservim/nerdtree')
Plug('https://codeberg.org/andyg/leap.nvim')
Plug('folke/tokyonight.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('williamboman/mason.nvim')
Plug('nvim-treesitter/nvim-treesitter',{['do'] = ':TSUpdate'})
Plug('windwp/nvim-ts-autotag')
Plug('windwp/nvim-autopairs')
Plug('nvim-lua/plenary.nvim')
Plug('numToStr/Comment.nvim')
Plug('neoclide/coc.nvim',{['branch'] = 'release'})
Plug('akinsho/toggleterm.nvim',{['tag'] = '*'})
Plug('t9md/vim-choosewin');
Plug('mfussenegger/nvim-dap');
Plug('tpope/vim-repeat');
Plug('pangloss/vim-javascript')
Plug('prettier/vim-prettier', {['do'] = 'yarn install --frozen-lockfile --production'})
Plug('AndrewRadev/undoquit.vim')
Plug('yorickpeterse/nvim-window');
Plug('NeogitOrg/neogit');
Plug('sindrets/diffview.nvim');
Plug('mbbill/undotree');
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install'});

vim.call('plug#end');

require("mason").setup();
require("nvim-autopairs").setup{};
require('Comment').setup();

require("toggleterm").setup{
    size = function(term)
	if term.direction == "horizontal" then
	    return 15
	elseif term.direction == "vertical" then
	    return vim.o.columns * 0.4
	end
    end,
    open_mapping = [[<c-\>]],
}

--exceptions
vim.cmd[[let g:prettier#config#use_tabs = 'false']]
vim.cmd[[colorscheme tokyonight-night]]
vim.diagnostic.config({virtual_text = true});


require('gabby');

print("init.lua initialized!")
