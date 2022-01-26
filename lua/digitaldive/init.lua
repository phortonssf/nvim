-- Install packer
require("digitaldive.packer")
-- disable unused plugins
require('digitaldive.disable-builtins')
local lua_config_dir = vim.fn.stdpath('config') .. '/lua'
local config_dirs = {'core','lsp', 'plugins'}

local function source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end
