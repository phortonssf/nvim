local dap = require("dap")
dap.adapters.node2 = function(cb, config)
  if config.preLaunchTask then
    vim.fn.system(config.preLaunchTask)
  end
  local adapter = {
    type = "executable",
    command = "ts-node",
    args = { "/home/digitaldive/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
  }
  cb(adapter)
end
require("dap-vscode-js").setup({
  -- node_path = "/home/linuxbrew/.linuxbrew/opt/node@18/bin/node",
  debugger_path = "/home/digitaldive/.local/share/nvim/lazy/vscode-js-debug",
  type = "executable",
  command = "ts-node",
  args = "/home/digitaldive/.local/share/nvim/lazy/vscode-js-debug",
  -- args = { "/home/digitaldive/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

-- custom adapter for running tasks before starting debug
local custom_adapter = "pwa-node-custom"
dap.adapters[custom_adapter] = function(cb, config)
  if config.preLaunchTask then
    local async = require("plenary.async")
    local notify = require("notify").async

    async.run(function()
      ---@diagnostic disable-next-line: missing-parameter
      notify("Running [" .. config.preLaunchTask .. "]").events.close()
    end, function()
      vim.fn.system(config.preLaunchTask)
      config.type = "pwa-node"
      dap.run(config)
    end)
  end
end

-- language config
for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    -- OKAY WTF
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug TS",
      program = "${file}",
      cwd = "${workspaceFolder}",
      protocol = "inspector",
      console = "integratedTerminal",
      runtimeExecutable = "/home/linuxbrew/.linuxbrew/opt/node@20/bin/ts-node",
      resolveSourceMapLocations = { "${workspaceFolder}/out/**/*.js", "${workspaceFolder}/**", "!**/node_modules/**" },
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      port = 9229,
      sourceMaps = true,
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Jest TS Debug",
      -- program = "${file}",
      cwd = "${workspaceFolder}",
      protocol = "inspector",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      runtimeExecutable = "/home/linuxbrew/.linuxbrew/opt/node@20/bin/node",
      runtimeArgs = { "--inspect-brk", "node_modules/.bin/jest", "--runInBand" },
      resolveSourceMapLocations = { "${workspaceFolder}/out/**/*.js", "${workspaceFolder}/**", "!**/node_modules/**" },
      -- skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      port = 9229,
      sourceMaps = true,
    },
    -- workts with js/node
    {
      name = "Launch",
      type = "pwa-node",
      request = "launch",
      program = "${workspaceFolder}/out/index.js",
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      name = "Attach to node process",
      type = "pwa-node",
      request = "attach",
      rootPath = "${workspaceFolder}",
      processId = require("dap.utils").pick_process,
      port = 9229,
      skipFiles = { "<node_internals>/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node with ts-node)",
      cwd = vim.fn.getcwd(),
      -- runtimeArgs = { "--loader", "ts-node/esm" },
      runtimeExecutable = "ts-node",
      args = { "${file}" },
      sourceMaps = true,
      smartSetp = false,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      name = "TS",
      type = "pwa-node",
      request = "launch",
      -- preLaunchTask = "tsc",
      runtimeExecutable = "node",
      skipFiles = false,
      args = {
        "${workspaceFolder}/dist/index.js",
      },
      outFiles = {
        "${workspaceFolder}/dist/*.js",
      },
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/dist/*.js",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      protocol = "inspector",
      console = "integratedTerminal",
    },
    -- working !!
    {
      type = "node2",
      request = "launch",
      name = "Leader ⚡ NODE2",
      program = "${workspaceFolder}/out/index.js",
      cwd = vim.fn.getcwd(),
      preLaunchTask = "tsc",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },

    {
      name = "Build TSC",
      type = custom_adapter,
      runtimeExecutable = "ts-node",
      request = "launch",
      preLaunchTask = "tsc",
      program = "${workspaceFolder}/out/index.js",
      -- program = "${workspaceFolder}/node_modules/.bin/electron",
      args = {
        "${workspaceFolder}/dist/index.js",
      },
      outFiles = {
        "${workspaceFolder}/dist/*.js",
      },
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/dist/*.js",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      protocol = "inspector",
      console = "integratedTerminal",
    },
    -- {
    --   type = "pwa-node-test",
    --   request = "launch",
    --   name = "Launch Test Current File (pwa-node with jest)",
    --   cwd = vim.fn.getcwd(),
    --   runtimeArgs = { "${workspaceFolder}/node_modules/jest/bin" },
    --   runtimeExecutable = "node",
    --   args = { "${file}", "--coverage", "false" },
    --   rootPath = "${workspaceFolder}",
    --   sourceMaps = true,
    --   console = "integratedTerminal",
    --   internalConsoleOptions = "neverOpen",
    --   skipFiles = { "<node_internals>/**", "node_modules/**" },
    -- },
  }
end
