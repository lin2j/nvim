-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl 移动时光标周围保留 8 行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 空格替代 tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 缩进4个空格等于一个 tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- << >> 时移动的长度
-- vim.o.shiftwidth = 2
-- vim.bo.shiftwidth = 2
-- 新行对齐当前行 vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 边输入边搜索
vim.o.hlsearch = false
vim.o.incsearch = true
-- 命令行高为 2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- split window 从下边和右边出现
vim.o.splitebelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 是否显示不可见字符
vim.o.list = false
-- 不可见字符的显示
vim.o.listchars = "space:."
-- 补全增强
vim.o.wildmenu = true
-- Dont't pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
-- vim.o.showtabline = 2
-- 使用增强状态栏后不需要 vim 的模式提示
vim.o.showmode = false
