require("basic")
require("plugins")

-- 插件的配置
require('plugin-config.lualine')
require('plugin-config.bufferline')
require('plugin-config.nvim-tree')
require('plugin-config.aerial')
require('plugin-config.telescope')

-- 代码提示与补全
require('lsp.setup')
require('lsp.nvim-cmp')

