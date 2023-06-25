local lsp_config = require('lspconfig')

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  sumneko_lua = require('lsp.config.lua'), -- /lua/lsp/lua.lua
  clangd = require('lsp.config.c'),
  pyright = require('lsp.config.python'),
  tsserver = require('lsp.config.typescript')
}

-- 高亮某个变量及其分布位置
local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]],
      false)
  end
end

local on_attach = function(client, bufnr)
  lsp_highlight_document(client)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- 绑定快捷键
  require('keybindings').maplsp(buf_set_keymap)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- 自动安装 LanguageServers
for name, opts in pairs(servers) do
  lsp_config[name].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = opts.settings,
    init_options = opts.init_options,
  }
end
