vim.g.VM_highlight_matches = 'NONE'

local keymappings = {}
-- 光标竖直向下/向上选择
keymappings['Add Cursor Down'] = '<C-j>'
keymappings['Add Cursor Up'] = '<C-k>'

vim.g.VM_maps = keymappings

