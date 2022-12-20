-- disable unused plugins
require'impatient'.enable_profile()
require('digitaldive.disable-builtins')
require("digitaldive.packer")

local lua_config_dir = vim.fn.stdpath('config') .. '/lua'
local config_dirs = {'lsp', 'core'}

local function source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end
for _, dir in pairs(config_dirs) do
  source_files_from_dir(lua_config_dir .. '/digitaldive/' .. dir)
end
