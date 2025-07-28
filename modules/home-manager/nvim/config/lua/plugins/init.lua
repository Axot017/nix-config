local M = {}

local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Error loading " .. module .. ": " .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

local function load_plugins()
  local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local scan_dir = vim.fn.readdir(plugins_dir)

  for _, file in ipairs(scan_dir) do
    if file ~= "init.lua" and file:match("%.lua$") then
      local plugin_name = file:gsub("%.lua$", "")
      safe_require("plugins." .. plugin_name)
    end
  end
end

load_plugins()

return M
