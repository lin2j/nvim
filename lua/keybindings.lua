-- leader 为 ' '
vim.g.mapleader = ' '

local opt = {
  noremap = true,
  silent = true,
}
local pluginKeys = {}
local map = vim.api.nvim_set_keymap

-- markdown 生成目录
map('n', '<leader>toc', ':GenTocGFM<CR>', opt)
map('n', '<leader>mpv', ':MarkdownPreview<CR>', opt)

-- 代码注释
map('n', '<C-/>', ':Commentary<CR>', opt)
map('v', '<C-/>', ':Commentary<CR>', opt)
map('n', '<D-/>', ':Commentary<CR>', opt)
map('v', '<D-/>', ':Commentary<CR>', opt)

-- Telescope
-- map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<leader>fm", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers <CR>", opt)
map("n", "<leader>ff", ":Telescope find_files <CR>", opt)
map("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>", opt)
map("n", "<leader>cm", ":Telescope git_commits <CR>", opt)
map("n", "<leader>gt", ":Telescope git_status <CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags <CR>", opt)
map("n", "<leader>fw", ":Telescope live_grep <CR>", opt)
map("n", "<leader>fo", ":Telescope oldfiles <CR>", opt)
map("n", "<leader>fp", ":Telescope projects<CR>", opt)
map("n", "<leader>th", ":Telescope themes <CR>", opt)
map("n", "<leader>3", "<cmd>Vista!!<CR>", opt)

-- nvim-tree 快捷键
map('n', '<leader>1', ':NvimTreeToggle <CR>', opt)
map('n', '<leader>2', ':NvimTreeFocus <CR>', opt)
map('n', '<leader>mr', ':NvimTreeRefresh <CR>', opt)
map('n', '<leader>mf', ':NvimTreeFindFile <CR>', opt)
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
  -- v分屏打开文件
  { key = 'v', action = 'vsplit' },
  -- h分屏打开文件
  { key = 'h', action = 'split' },
  -- Ignore (node_modules)
  { key = 'i', action = 'toggle_ignored' },
  -- Hide (dotfiles)
  { key = '.', action = 'toggle_dotfiles' },
  { key = 'R', action = 'refresh' },
  -- 文件操作
  { key = 'a', action = 'create' },
  { key = 'd', action = 'remove' },
  { key = 'r', action = 'rename' },
  { key = 'x', action = 'cut' },
  { key = 'c', action = 'copy' },
  { key = 'p', action = 'paste' },
  { key = 'y', action = 'copy_name' },
  { key = 'Y', action = 'copy_path' },
  { key = 'gy', action = 'copy_absolute_path' },
  { key = 'I', action = 'toggle_file_info' },
  { key = 'n', action = 'tabnew' },
  -- 进入下一级
  { key = { ']' }, action = 'cd' },
  -- 进入上一级
  { key = { '[' }, action = 'dir_up' },
  { key = 's', action = 'system_open' }
}

-- aerial 函数/类列表快捷键
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>')
vim.keymap.set('n', '}', '<cmd>AerialNext<CR>')
vim.keymap.set('n', '[[', '<cmd>AerialPrevUp<CR>')
vim.keymap.set('n', ']]', '<cmd>AerialNextUp<CR>')

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', '<C-b>', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', '<D-b>', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)

  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
end


-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end



return pluginKeys
