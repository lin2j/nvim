require('whitespace-nvim').setup({
  -- `highlight` configures which highlight is used to display
  -- trailing whitespace
  highlight = 'DiffDelete',

  -- `ignored_filetypes` configures which filetypes to ignore when
  -- displaying trailing whitespace
  ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
})
