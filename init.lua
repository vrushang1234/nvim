-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core config
require("core.options")
require("core.keymaps")

-- Load plugins from lua/plugins/*.lua
local plugins = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
  if file:match(".*%.lua$") then
    table.insert(plugins, require("plugins." .. file:gsub("%.lua$", "")))
  end
end

require("lazy").setup(plugins)

