-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packger/
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
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
if not status_ok then
  vim.notify('没有安装 packer.vim')
  return
end

packer.startup(
  {
    function(use)
      -- 图标
      use 'kyazdani42/nvim-web-devicons'
      -- 安装插件的位置
      use('wbthomason/packer.nvim')
      -- 状态栏
      use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
      }

      -- tab 文件列表
      use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
      }
      -- 彩虹括号
      use 'Raimondi/delimitMate'
      -- 注释代码
      use 'tpope/vim-commentary'
      -- 代码提示与补全
      use {
        -- For Unix systems: git(1), curl(1) or wget(1), unzip(1), tar(1), gzip(1)
        -- For Windows systems: powershell, git, tar, and 7zip or peazip or archiver or winzip or WinRAR
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
      }
      -- nvim-cmp
      use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
      use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
      use 'hrsh7th/cmp-path' -- { name = 'path' }
      use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
      use 'hrsh7th/nvim-cmp'
      -- vsnip
      use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
      use 'hrsh7th/vim-vsnip'
      use 'rafamadriz/friendly-snippets'
      -- lspkind
      use 'onsails/lspkind-nvim'
      -- 代码格式化
      use 'mhartington/formatter.nvim'
      -- lsp 查找优化
      use {
        'ojroques/nvim-lspfuzzy',
        requires = {
          {'junegunn/fzf'},
          {'junegunn/fzf.vim'},  -- to enable preview (optional)
        },
      }

      -- 目录树
      use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
      }

      -- code outline 函数列表
      use 'stevearc/aerial.nvim'

      -- fuzzy search file
      use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
      }
      use 'nvim-treesitter/nvim-treesitter'

      -- startup screen
      use 'goolord/alpha-nvim'

      -- themes
      use {
        'rmehri01/onenord.nvim',
        'folke/tokyonight.nvim',
      }

      -- markdown
      use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = { 'markdown' },
        cmd = { "MarkdownPreview" },
        requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
      }
      -- markdown 目录生成
      use 'mzlogin/vim-markdown-toc'

      -- multi cursor
      use 'mg979/vim-visual-multi'

      -- auto save
      use 'Pocco81/auto-save.nvim'

      -- 浮动窗口
      use 'voldikss/vim-floaterm'

      -- ui 增强
      use 'stevearc/dressing.nvim'
      use({
        'folke/noice.nvim',
        requires = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          -- OPTIONAL:
          --   `nvim-notify` is only needed, if you want to use the notification view.
          --   If not available, we use `mini` as the fallback
          "rcarriga/nvim-notify",
          }
      })

      -- git 增强
      use 'lewis6991/gitsigns.nvim'

-- plugin region end

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
          return require('packer.util').float({ border = 'single' })
        end,
      }
    }
  }
)
