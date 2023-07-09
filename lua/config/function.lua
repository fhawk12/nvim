function ToggleBoolean()
  local word = vim.fn.expand('<cword>') -- 获取光标下的单词
  if is_bool(word) then
    local res = not to_bool(word)
    vim.cmd('normal! ciw' .. tostring(res))
  end
end

function is_bool(str)
  return str == 'true' or str == 'false'
end

function to_bool(str)
  return str == 'true'
end
