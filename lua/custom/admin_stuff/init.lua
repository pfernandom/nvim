local debug = require("custom.admin_stuff.debug_utils")
require("custom.admin_stuff.obisdian")
local M = {}

M.debug = debug.debug

vim.api.nvim_create_user_command("DebugPrint", function(opts)
  local code = opts.args -- The Lua code as a string
  local func, err = load("return " .. code)

  if not func then
    print("Error loading code:", err)
    return
  end

  local success, result = pcall(func)
  if success then
    -- If the result is a table, use the enhanced printing function
    if type(result) == "table" then
      M.debug(result)
    else
      print(result)
    end
  else
    print("Error executing code:", result)
  end
end, { nargs = "*", complete = "lua" })

-- require("custom.admin_stuff.obisdian")
return M
