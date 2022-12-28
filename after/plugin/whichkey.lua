local settings = {
  leader = " ",
  plugins = {
    marks = false,
    registers = false,
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = {
    d = "Delete",
    c = "Change",
    y = "Yank (copy)",
    ["g~"] = "Toggle case",
    ["gu"] = "Lowercase",
    ["gU"] = "Uppercase",
    [">"] = "Indent right",
    ["<lt>"] = "Indent left",
    ["zf"] = "Create fold",
    ["!"] = "Filter though external program",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  window = {
    padding = { 0, 0, 0, 0 },
    border = 'single',
  },
  layout = {
    height = { min = 1, max = 10 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = {
    "<silent>",
    "<Cmd>",
    "<cmd>",
    "<Plug>",
    "call",
    "lua",
    "^:",
    "^ ",
  },
  show_help = true,
  triggers = "auto",
}

local wk = require("which-key")
wk.setup({
 plugins = {
    marks = false,
    registers = false,
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },

  operators = {
    d = "Delete",
    c = "Change",
    y = "Yank (copy)",
    ["g~"] = "Toggle case",
    ["gu"] = "Lowercase",
    ["gU"] = "Uppercase",
    [">"] = "Indent right",
    ["<lt>"] = "Indent left",
    ["zf"] = "Create fold",
    ["!"] = "Filter though external program",
  },

  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  window = {
    padding = { 0, 0, 0, 0 },
    border = 'single',
  },
  layout = {
    height = { min = 1, max = 10 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = {
    "<silent>",
    "<Cmd>",
    "<cmd>",
    "<Plug>",
    "call",
    "lua",
    "^:",
    "^ ",
  },
  show_help = true,
  triggers = "auto",
triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = {
      "gitcommit",
      "TelescopePrompt" },
  },
})
wk.register({
 --  f = {
 --    name = "+file", -- optional group name
 --    f = { "<cmd>telescope find_files<cr>", "find file" }, -- create a binding with label
 --    n = { "new file" }, -- just a label. don't create any mapping
 --    e = "edit file", -- same as above
 --    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
 --    b = { function() print("bar") end, "foobar" }
 --  },-- you can also pass functions! },
 -- { prefix = "<leader>" }}
  ["<leader>f"] = {
    name = '+find',
    f = { "<cmd>Telescope find_files<cr>", "find file" }
  }
})


wk.register({
  ["<leader>x"] = {
    name = '+xx',
    x = { "<cmd>Telescope find_files<cr>", "find file" }
  }
})

-- TODO: Not happy with how messy the integrations are.  Refactor!
-- whichkey.configs = {}
-- whichkey.configs["which-key.nvim"] = function()
--   vim.g.mapleader = doom.features.whichkey.settings.leader
--
--   local wk = require("which-key")
--
--   wk.setup(doom.features.whichkey.settings)
--
--   local get_whichkey_integration = function()
--     --- @type NestIntegration
--     local module = {}
--     module.name = "whichkey"
--
--     local keymaps = {}
--
--     --- Handles each node of the nest keymap config (except the top level)
--     --- @param node NestIntegrationNode
--     --- @param node_settings NestSettings
--     module.handler = function(node, node_settings)
--       -- Only handle <leader> keys, which key needs a 'Name' field
--       if node.lhs:find("<leader>") == nil or node.name == nil then
--         return
--       end
--
--       for _, v in ipairs(vim.split(node_settings.mode or "n", "")) do
--         if keymaps[v] == nil then
--           keymaps[v] = {}
--         end
--         -- If this is a keymap group
--         local rhs_type = type(node.rhs)
--         if rhs_type == "table" then
--           keymaps[v][node.lhs] = { name = node.name }
--           -- If this is an actual keymap
--         elseif rhs_type == "string" or rhs_type == "function" then
--           keymaps[v][node.lhs] = { node.name }
--         end
--       end
--     end
--
--     module.on_complete = function()
--       for k, v in pairs(keymaps) do
--         require("which-key").register(v, { mode = k })
--       end
--       keymaps = {}
--     end
--
--     return module
--   end
--
--   local keymaps_service = require("doom.services.keymaps")
--   local whichkey_integration = get_whichkey_integration()
--   local count = 0
--   for section_name, _ in pairs(doom.modules) do
--     for _, module in pairs(doom[section_name]) do
--       if module and module.binds then
--         count = count + 1
--         vim.defer_fn(function()
--           -- table.insert(all_keymaps, type(module.binds) == "function" and module.binds() or module.binds)
--           keymaps_service.applyKeymaps(
--             type(module.binds) == "function" and module.binds() or module.binds,
--             nil,
--             { whichkey_integration }
--           )
--         end, count)
--       end
--     end
--   end
--
--   -- Add user keymaps to whichkey user keymaps
--   if doom.binds and #doom.binds >= 1 then
--     keymaps_service.applyKeymaps(doom.binds, nil, { whichkey_integration })
--   end
-- end
--
-- return whichkey
