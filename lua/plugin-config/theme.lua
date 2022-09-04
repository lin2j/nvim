-- ayu、balance、onenord or none
-- and builtin
local theme = 'onenord'

if theme == 'balance' then
  require('balance').setup()

elseif theme == 'ayu' then
  local ayu = require('ayu')

  ayu.setup({
    mirage = true,
    overrides = {},
  })

  ayu.colorscheme()
elseif theme == 'onenord' then
  require('onenord').setup({
    theme = 'light',
    -- Style that is applied to various groups: see `highlight-args` for options
    styles = {
      comments = "italic",
      strings = "NONE",
      keywords = "NONE",
      functions = "NONE",
      variables = "NONE",
      diagnostics = "underline",
    },
  })
elseif theme == 'none' then
end

return theme