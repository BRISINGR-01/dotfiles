local M = {}

local is_transparent = 1;
function M.toggle_transparent_background()
  if is_transparent == 0 then
    vim.cmd [[hi Normal guibg=#111111 ctermbg=black]]
    is_transparent = 1
  else
    vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
    is_transparent = 0
  end
end


function M.suspend_suhutdown()
  vim.ui.select({ 'sleep', 'shutdown', 'logout' }, {
    prompt = " ",
  }, function(input)
    if input == "sleep" then
      os.execute('systemctl suspend')
    elseif input == "shutdown" then
      os.execute('shutdown now')
    elseif input == 'logout' then
      os.execute('pkill -u (whoami)')
    end
  end)
end

return M
