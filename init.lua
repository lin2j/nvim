require("basic")
require("plugins")

local utils = require('utils')
vim.g.is_mac = utils.is_mac()
vim.g.is_win = utils.is_win()
vim.g.is_unix = utils.is_unix()

-- 插件的配置
require('plugin-config.nvim-web-devicons')
require('plugin-config.alpha')
require('plugin-config.theme')
require('plugin-config.lualine')
require('plugin-config.bufferline')
require('plugin-config.nvim-tree')
require('plugin-config.aerial')
require('plugin-config.telescope')
require('plugin-config.mason')
require('plugin-config.markdown')
require('plugin-config.visual-multi')
require('plugin-config.auto-save')
require('plugin-config.delimit-mate')

-- lsp 功能强化
require('lsp.setup')
require('lsp.nvim-cmp')
require('lsp.lspfuzzy')
