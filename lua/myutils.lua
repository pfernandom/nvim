local M = {}

local insert_to = function(lines, content)
  print("IS")
  if type(content) == "table" then
    -- table.insert(lines, tostring(vim.inspect(item)))
    for _, item in ipairs(content) do
      insert_to(lines, item)
      -- table.insert(lines, tostring(vim.inspect(item)))
    end
  else
    table.insert(lines, tostring(content))
  end
end

function M.debug_table(table_content)
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true) -- The arguments are: listed, scratch
  local lines = ""
  if type(table_content) == "table" then
    lines = vim.split(vim.inspect(table_content), "\n", true)
  else
    lines = tostring(table_content)
  end

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Open the buffer in a new window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = math.floor(vim.o.columns * 0.7),
    height = math.floor(vim.o.lines * 0.7),
    row = math.floor(vim.o.lines * 0.15),
    col = math.floor(vim.o.columns * 0.15),
    style = "minimal",
    border = "rounded",
  })
end

return M
