vim.api.nvim_create_user_command("ObsidianWorkspaces", function(opts)
  for i, x in pairs(require("lazy").plugins()) do
    if x[1] == "epwalsh/obsidian.nvim" then
      local search_dirs = {}
      for i, w in pairs(x._.cache.opts.workspaces) do
        table.insert(search_dirs, w)
      end
      local action_state = require("telescope.actions.state")
      local actions = require("telescope.actions")
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values

      pickers
        .new({}, {
          prompt_title = "Select Obsidian Workspace",
          finder = finders.new_table({
            results = search_dirs,
            entry_maker = function(entry)
              return {
                value = entry,
                display = entry.name .. ":\t" .. entry.path,
                ordinal = entry.path,
                name = entry.name,
              }
            end,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              -- Here you define what happens when you select an entry. Replace `echo` with your desired command.
              local cmd = "ObsidianWorkspace " .. selection.value.name
              print("Running command: " .. cmd)
              -- For example, to open a terminal in the selected directory:
              -- vim.cmd("terminal cd " .. selection.value)
              vim.cmd(cmd)
            end)
            return true
          end,
        })
        :find()
    end
    -- print(x[1])
    -- for j, y in pairs(x) do
    --  print(print(j))
    --end
  end
end, { nargs = "*", complete = "lua" })
