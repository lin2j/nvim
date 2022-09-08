local utils = require('utils')

vim.cmd([[
  let g:im_select_get_im_cmd = ['im-select']
  let g:ImSelectSetImCmd = {key -> ['im-select', key]}
  function! GetImCallback(exit_code, stdout, stderr) abort
    return a:stdout
  endfunction
  let g:ImSelectGetImCallback = function('GetImCallback')
]])

if utils.is_mac() then
  vim.cmd([[
    let g:im_select_default='com.apple.keylayout.ABC'
    let g:im_select_command='/opt/homebrew/bin/im-select'
  ]])
elseif vim.g.is_win() then
  vim.cmd([[
    " 分别切换你的输入法(中文 和英文) , 然后运行\path\to\im-select.exe，
    " 理论上你应该得到两个不同的数字，比如英文是1033, 中文（搜狗输入法）是2052
    " let g:im_select_default='1033'
    " let g:im_select_command='/path/to/your/im-select.exe'
  ]])
end
