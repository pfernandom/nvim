local M = {}

local function split_lines(str)
  local t = {}
  for line in str:gmatch("([^\n]+)") do
    table.insert(t, line)
  end
  return t
end

local function table_to_string(tbl)
  local s = vim.inspect(tbl)

  return split_lines(s)
end

M.debug = function(arg)
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true) -- nofile, scratch buffer
  -- Open a new window with the buffer
  vim.api.nvim_open_win(buf, true, { relative = "editor", width = 80, height = 20, col = 10, row = 10, anchor = "NW" })

  if type(arg) == "table" then
    local message = table_to_string(arg)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, message)
  else
    local message = tostring(arg)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Debug Message:", message })
  end
  -- Set the buffer's content to the argument passed
end

return M
