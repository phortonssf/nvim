local M = {
  "lewis6991/gitsigns.nvim",
  -- event = "BufReadPje",
}

function M.config()
  if not package.loaded.trouble then
    package.preload.trouble = function()
      return true
    end
  end
  require("gitsigns").setup({
    diff_opts = {
      -- vertical = false,
    },
    signs = {
      add = { hl = "gitsignsadd", text = "▍", numhl = "gitsignsaddnr", linehl = "gitsignsaddln" },
      change = {
        hl = "gitsignschange",
        text = "▍",
        numhl = "gitsignschangenr",
        linehl = "gitsignschangeln",
      },
      delete = {
        hl = "gitsignsdelete",
        text = "▸",
        numhl = "gitsignsdeletenr",
        linehl = "gitsignsdeleteln",
      },
      topdelete = {
        hl = "gitsignsdelete",
        text = "▾",
        numhl = "gitsignsdeletenr",
        linehl = "gitsignsdeleteln",
      },
      changedelete = {
        hl = "gitsignschange",
        text = "▍",
        numhl = "gitsignschangenr",
        linehl = "gitsignschangeln",
      },
      untracked = { hl = "gitsignsadd", text = "▍", numhl = "gitsignsaddnr", linehl = "gitsignsaddln" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        if type(opts) == "string" then
          opts = { desc = opts }
        end
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- navigation
      map("n", "]h", function()
        if vim.wo.diff then
          return "]h"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<ignore>"
      end, { expr = true, desc = "next hunk" })

      map("n", "[h", function()
        if vim.wo.diff then
          return "[h"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<ignore>"
      end, { expr = true, desc = "prev hunk" })

      -- actions
      map({ "n", "v" }, "<leader>ghs", ":gitsigns stage_hunk<cr>", "stage hunk")
      map({ "n", "v" }, "<leader>ghr", ":gitsigns reset_hunk<cr>", "reset hunk")

      map("n", "<leader>ghu", gs.undo_stage_hunk, "undo stage hunk")
      map("n", "<leader>ghp", gs.preview_hunk, "preview hunk")
      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, "blame line")

      -- map("n", "<leader>gd", gs.diffthis, "diff this")
      -- map("n", "<leader>gd", function()
      --   gs.diffthis("~")
      -- end, "diff this ~")

      -- map("n", "<leader>gr", gs.reset_buffer, "reset buffer")
      -- map("n", "<leader>gs", gs.stage_buffer, "stage buffer")
      -- text object
      map({ "o", "x" }, "ih", ":<c-u>gitsigns select_hunk<cr>", "gitsigns select hunk")
    end,
  })
  package.loaded.trouble = nil
  package.preload.trouble = nil
end

return M
