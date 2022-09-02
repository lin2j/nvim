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
    theme = 'light'
  })
elseif theme == 'none' then
end

return theme
