
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup {
  extensions = {
    file_browser = {
        mappings = {
        ["i"] = {
          -- remap to going to home directory
          ["<C-u>"] = fb_actions.change_cwd,
          ["<C-x>"] = function(prompt_bufnr)
            -- your custom function
          end
        },
        ["n"] = {
          -- unmap toggling `fb_actions.toggle_browser`
          f = false,
        },
      }
    }
  }
}
