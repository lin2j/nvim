local lsp_config = require('lspconfig')

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  sumneko_lua = require('lsp.config.lua'), -- /lua/lsp/lua.lua
  clangd = require('lsp.config.c'),
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- 绑定快捷键
  require('keybindings').maplsp(buf_set_keymap)
  require('aerial').on_attach(client, bufnr)
end

local lsp_flags = {
      debounce_text_changes = 150,
}

-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
  lsp_config[name].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }
end

