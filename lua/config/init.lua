local M = {}

local config_dir = vim.fn.stdpath("config") .. "/lua/config"

local function module_name_from_path(filename)
  filename = filename:gsub("\\", "/")
  filename = filename:gsub("%.lua$", "")
  filename = filename:gsub("/", ".")

  return "config." .. filename
end

local function load_config(filename, notify)
  if not filename or filename == "" then
    return
  end

  filename = filename:gsub("\\", "/")

  -- Ignore init.lua and non-Lua files
  if filename == "init.lua" or not filename:match("%.lua$") then
    return
  end

  local full_path = config_dir .. "/" .. filename

  -- Ignore deleted files
  if not vim.uv.fs_stat(full_path) then
    return
  end

  local module = module_name_from_path(filename)

  -- Force the module to execute again
  package.loaded[module] = nil

  local ok, err = pcall(require, module)

  if not ok then
    vim.notify(
      "Failed to load " .. module .. "\n\n" .. err,
      vim.log.levels.ERROR
    )
    return
  end

  if notify then
    vim.notify(
      "Reloaded: " .. module,
      vim.log.levels.INFO
    )
  end
end

local function scan_directory(directory, relative_path)
  local handle = vim.uv.fs_scandir(directory)

  if not handle then
    return
  end

  while true do
    local name, file_type = vim.uv.fs_scandir_next(handle)

    if not name then
      break
    end

    local full_path = directory .. "/" .. name
    local relative_file = relative_path ~= ""
      and relative_path .. "/" .. name
      or name

    if file_type == "file" then
      if name:match("%.lua$") then
        load_config(relative_file, false)
      end

    elseif file_type == "directory" then
      scan_directory(full_path, relative_file)
    end
  end
end

local function load_all_configs()
  scan_directory(config_dir, "")
end

function M.start()
  if M.watcher then
    return
  end

  -- Load every config file on startup.
  load_all_configs()

  M.watcher = vim.uv.new_fs_event()

  if not M.watcher then
    vim.notify(
      "Failed to create config watcher",
      vim.log.levels.ERROR
    )
    return
  end

  local ok, err = M.watcher:start(
    config_dir,
    {
      recursive = true,
    },
    vim.schedule_wrap(function(err, filename, events)
      if err then
        vim.notify(
          "Config watcher error: " .. err,
          vim.log.levels.ERROR
        )
        return
      end

      if not filename then
        return
      end

      if events.change or events.rename then
        load_config(filename, true)
      end
    end)
  )

  if not ok then
    vim.notify(
      "Failed to start config watcher: " .. tostring(err),
      vim.log.levels.ERROR
    )

    M.watcher:stop()
    M.watcher:close()
    M.watcher = nil
  end
end

function M.stop()
  if not M.watcher then
    return
  end

  M.watcher:stop()
  M.watcher:close()
  M.watcher = nil
end

return M
