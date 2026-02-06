local builtin = require('telescope.builtin');
local actions = require('telescope.actions');
local telescopeConfig = require('telescope.config');
local vimgrep_arguments = {unpack(telescopeConfig.values.vimgrep_arguments)};

-- remaps
vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-p>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- inital setup
require('telescope').setup{
    defaults = {
	file_ignore_patterns = {"node_modules"},
	vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {

	buffers = {
	    mappings = {
		i = {
		    ["<c-d>"] = actions.delete_buffer,
		}
	    }
	},
    }
}

print("telescope.lua initialized!");
