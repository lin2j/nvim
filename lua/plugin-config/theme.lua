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
    custom_colors = {
      -- 背景颜色
      bg = '#FAFBFC',
      -- 选中文本的背景色
      highlight = '#C0D8F0',
      -- 光标所在行在高亮
      active = '#F2F3F5',
    },
    -- 高亮变量及其所在位置 
    custom_highlights = {
      -- used for highlighting "text" references
      LspReferenceText = { style = "NONE", bg = '#E4E4FF'},
      -- used for highlighting "read" references
      LspReferenceRead = { style = "NONE", bg = '#E4E4FF'},
      -- used for highlighting "write" references
      LspReferenceWrite = { style = "NONE", bg = '#E4E4FF'},
    }
  })
elseif theme == 'none' then
end

return theme
