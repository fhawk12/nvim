-- Toggle boolean
function ToggleBoolean()
  -- Save the current cursor position
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Get the word under the cursor
  local word = vim.fn.expand("<cword>")

  -- Define the replacements
  local replacements = {
    ["true"] = "false",
    ["false"] = "true",
  }

  -- Perform the replacement
  if replacements[word] then
    -- Use the :normal command to change the word without moving the cursor
    vim.api.nvim_command("normal! ciw" .. replacements[word])
  end

  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, { row, col })
end

-- Create a key mapping for the toggle function
vim.api.nvim_set_keymap("n", "<leader>i", ":lua ToggleBoolean()<CR>", { noremap = true, silent = true })
