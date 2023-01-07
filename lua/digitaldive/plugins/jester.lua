local M = { "David-Kunz/jester" }

function M.config()
  require("jester").setup({
    cmd = "./node_modules/.bin/jest -t '$result' -- $file", -- run command
    identifiers = { "test", "it" }, -- used to identify tests
    prepend = { "describe" }, -- prepend describe blocks
    expressions = { "call_expression" }, -- tree-sitter object used to scan for tests/describe blocks
    path_to_jest_run = "./node_modules/jest/jest.js", -- used to run tests
    path_to_jest_debug = "./node_modules/jest/bin/jest.js", -- used for debugging
    terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
    dap = { -- debug adapter configuration
      type = "node2",
      request = "launch",
      cwd = vim.fn.getcwd(),
      runtimeArgs = {
        "--inspect-brk",
        "./node_modules/.bin/jest",
        "--no-coverage",
        "${result}",
        "--",
        "${file}",
      },
      args = { "--no-cache" },
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**/*.js" },
      console = "integratedTerminal",
      port = 9229,
      disableOptimisticBPs = true,
      runtimeExecutable = "/home/linuxbrew/.linuxbrew/opt/node@18/bin/node",
      resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**", "!**/node_modules/**" },
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    },
  })
end

return M
