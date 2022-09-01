-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packger/
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify('正在安装Packer.nvim，请稍后...')
    packer_bootstrap = fn.system(
        {
            'git',
            'clone',
            '--depth', '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        }
    )

    vim.notify(install_path)
    vim.cmd [[packadd packer.nvim]]
    vim.notify('Packer.nvim 安装完毕')
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok  then
    vim.notify('没有安装 packer.vim')
    return
end

packer.startup(
    {
        function(use)
            -- 安装插件的位置
            use('wbthomason/packer.nvim')
            -- 状态栏
            use {
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true }
            }
            use 'kyazdani42/nvim-web-devicons'
            -- use 'lambdalisue/nerdfont.vim'

            -- tab 文件列表
            use {
                'akinsho/bufferline.nvim',
                tag = "v2.*",
                requires = 'kyazdani42/nvim-web-devicons'
            }
            -- 彩虹括号
            -- use 'p00f/nvim-ts-rainbow'
            -- 注释代码
            use 'tpope/vim-commentary'
            -- 代码提示与补全
            use 'neovim/nvim-lspconfig'
            use 'williamboman/nvim-lsp-installer'
            -- nvim-cmp
            use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
            use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
            use 'hrsh7th/cmp-path'     -- { name = 'path' }
            use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
            use 'hrsh7th/nvim-cmp'
            -- vsnip
            use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
            use 'hrsh7th/vim-vsnip'
            use 'rafamadriz/friendly-snippets'
            -- lspkind
            use 'onsails/lspkind-nvim'

            -- 目录树
            use({'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'}
)

            if packer_bootstrap then
                packer.sync()
            end
        end,
        config = {
            -- 最大并发数
            max_jobs = 16,
            -- 自定义源
            git = {
                default_url_format = 'https://github.com/%s'
            },
            display = {
                open_fn = function()
                    return require('packer.util').float({border = 'single'})
                end,
            }
        }
    }
)
