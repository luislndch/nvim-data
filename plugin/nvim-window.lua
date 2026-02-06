require('nvim-window').setup({
  -- The characters available for hinting windows.
  chars = {
		'u','i','o','h','j','k','l'
  },

  -- A group to use for overwriting the Normal highlight group in the floating
  -- window. This can be used to change the background color.
  normal_hl = 'Normal',

  -- The border style to use for the floating window.
  border = 'single',

  -- How the hints should be rendered. The possible values are:
  --
  -- - "float" (default): renders the hints using floating windows
  -- - "status": renders the hints to a string and calls `redrawstatus`,
  --   allowing you to show the hints in a status or winbar line
  render = 'float',
})
