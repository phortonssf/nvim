-- -- DEBUGGER

-- return {
--   -- { "mfussenegger/nvim-dap" }, -- use 'Pocco81/dap-buddy.nvim'
--   --   -- use 'theHamsta/nvim-dap-virtual-text'
--   --   -- https://github.com/NHKK/devsetup/blob/main/lua/user/DAP/languages/typescript.lua
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       "rcarriga/nvim-dap-ui",
--       "nvim-treesitter/nvim-treesitter",
--       "theHamsta/nvim-dap-virtual-text",
--       "mxsdev/nvim-dap-vscode-js",
--       {
--         "microsoft/vscode-js-debug",
--         build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
--         -- build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
--         lazy = true,
--       },
--       "nvim-telescope/telescope-dap.nvim",
--       -- {
--       --   "microsoft/vscode-js-debug",
--       --   tag = "v1.70.0",
--       --   lazy = true,
--       --   -- build = "npm install --legacy-peer-deps && npm run compile",
--       -- },
--     },
--     config = function()
--       require("digitaldive.dap")
--       -- require("digitaldive.dap.languages.typescript")
--     end,
--   },
-- }

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    -- build debugger from source
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
    },
    -- },
    -- keys = {
    --   -- normal mode is default
    --   {
    --     "<leader>d",
    --     function()
    --       require("dap").toggle_breakpoint()
    --     end,
    --   },
    --   {
    --     "<leader>c",
    --     function()
    --       require("dap").continue()
    --     end,
    --   },
    --   {
    --     "<C-'>",
    --     function()
    --       require("dap").step_over()
    --     end,
    --   },
    --   {
    --     "<C-;>",
    --     function()
    --       require("dap").step_into()
    --     end,
    --   },
    --   {
    --     "<C-:>",
    --     function()
    --       require("dap").step_out()
    --     end,
    --   },
  },
  config = function()
    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    })
    require("digitaldive.dap.keymaps-dap").setup()
    for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
      require("dap").configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
          -- use nvim-dap-vscode-js's pwa-node debug adapter
          type = "pwa-node",
          -- attach to an already running node process with --inspect flag

          --must match runninc node proess
          url = "ws://127.0.0.1:9229",
          port = 9229,
          request = "attach",
          -- allows us to pick the process using a picker
          processId = require("dap.utils").pick_process,
          -- name of the debug action you have to select for this config
          name = "Attach debugger to existing `node --inspect` process",
          -- for compiled languages like TypeScript or Svelte.js
          sourceMaps = true,
          -- resolve source maps in nested locations while ignoring node_modules
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
          -- path to src in vite based projects (and most other projects as well)
          cwd = "${workspaceFolder}/src",
          -- we don't want to debug code inside node_modules, so skip it!
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
          type = "pwa-chrome",
          name = "Launch Chrome to debug client",
          request = "launch",
          url = "http://localhost:5173",
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
        -- only if language is javascript, offer this debug action
        language == "javascript"
            and {
              -- use nvim-dap-vscode-js's pwa-node debug adapter
              type = "pwa-node",
              -- launch a new process to attach the debugger to
              request = "launch",
              -- name of the debug action you have to select for this config
              name = "Launch file in new node process",
              -- launch current file
              program = "${file}",
              cwd = "${workspaceFolder}",
            }
          or nil,
      }
    end

    require("dapui").setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
