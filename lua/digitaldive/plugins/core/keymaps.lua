local M = {
  "LionC/nest.nvim",
  lazy = false,
}

function M.config()
  local nest = require("nest")
  local l = "<leader>"
  local c = "<CMD>"
  -- keymaps for better default experience
  -- see `:help vim.keymap.set()`
  -- vim.keymap.set("n", "J", "<cmd>TSJToggle<cr>")
  -- vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
  -- vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle)
  -- restore the session for the current directory
  vim.api.nvim_set_keymap("n", "[k", [[<cmd> lua require("treesitter-context").go_to_context()<cr> ]], {})
  vim.api.nvim_set_keymap("v", "[k", [[<cmd> lua require("treesitter-context").go_to_context()<cr> ]], {})
  -- restore the last session
  vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

  -- stop Persistence => session won't be saved on exit
  vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

  vim.keymap.set({ "n", "v" }, "<space>", "<nop>", { silent = true })
  -- remap for dealing with word wrap
  -- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  -- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  nest.applyKeymaps({
    -- COMMANdkey
    --
    -- o
    {
      mode = "t",
      {
        { "<esc>", "<c-\\><c-n" },
      },
    },
    {
      mode = "c",
      options = {
        noremap = true,
        silent = false,
      },
      { "<C-Q>", "<C-e><C-u><Esc>" },
    },
    -- ESPRESSIONS!!!!
    {
      mode = "n",
      {
        options = {
          noremap = true,
          silent = true,
          expr = true,
        },
        -- open fold if on fold only
        -- {"<space>",function()  local x = vim.v.foldlevel if (x == 0) then return "<CMD><Space><CR>" else return "<CMD>norm!za<CR>" end end },

        -- adds marsk so larg j and k movements are in jumplist
        {
          "k",
          function()
            return (vim.v.count == 5) and "m'" .. vim.v.count .. "k" or "k"
          end,
        },
        {
          "j",
          function()
            if vim.v.count > 5 then
              return "m'" .. vim.v.count .. "j"
            else
              return "j"
            end
          end,
        },
        -- {'k', function() if (v.count > 5) then return "m'" .. v.count .. 'k' else return "k" end }
      },
    },
    -- { mode = "c",
    --   options = {
    --
    --      expr = true
    --   },
    --   {"<C-p>", function() return vim.fn.pumvisible() == 1 and "<Left>" or "<C-p>" end},
    --   {"<C-n>", function() return vim.fn.pumvisible() == 1 and "<Right>" or "<C-n>" end},
    -- },
    --ALL MODES
    {
      mode = "nv",
      {
        options = {
          noremap = true,
          silent = true,
        },
        -- black hole register
        { l .. "d", '"+d' },
        { "d", '"_d' },
        { "D", '"_D' },
        { "c", '"_c' },
        { "C", '"_C' },
        { "x", '"_x' },
        -- { "<C-_>",":CommentToggle<cr>" },
        { "<C-_>", ":CommentToggle<cr>" },
      },
    },
    -- VISUAL
    {
      mode = "v",
      options = {
        noremap = true,
        silent = true,
      },
      { "u", "<Nop>" },
      { "u", "<Esc>" },
      { l .. "p", '"_dP' },
      { ">", ">gv" },
      { "<", "<gv" },
    },
    -- INSERT MODE
    {
      mode = "i",
      options = {
        noremap = true,
        silent = true,
      },
      { "<C-t>", "<Ctrl-x><Ctrl-]" },
      --more undo markers
      { "jk", "<esc>" },
      { "jj", "<esc>" },
      { "kj", "<esc>" },
      -- { ",", "<c-g>u" },
      { "`", "`<c-g>u" },
      { "{", "{<c-g>u" },
      { ")", ")<c-g>u" },
      { "]", "]<c-g>u" },
      { ".", ".<c-g>u" },
      { "!", "!<c-g>u" },
      { "&", "&<c-g>u" },
      { "+", "+<c-g>u" },
      { "-", "-<c-g>u" },
      { "?", "?<c-g>u" },
      { "}", "}<c-g>u" },
      { ":", ":<c-g>u" },
      { ";", ";<c-g>u" },
      { "=", "=<c-g>u" },
      { "<bslash>", "<bslash><c-g>u" },
      { "<fslash>", "<fslash><c-g>u" },
      -- { "<space>", "<space><c-g>u" },
      -- { " <c-v>", "<c-r>+" },
    },
    -- NORMAL MODE
    {
      mode = "n",
      options = {
        silent = true,
        noremap = true,
      },
      { "H", "^" },
      { "L", "$" },
      { "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>" },
      -- { "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>" },
      { "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>" },
      { "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>" },
      { "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>" },
      { "<F13>", ":lua require('harpoon.ui').nav_file(5)<CR>" }, --f13 is <Ctrl-;>
      { "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>" },
      { "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>" },
      { "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>" },
      { "<leader>m", ":lua require('harpoon.mark').add_file()<CR>" },
      { "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
      { "s", "<Nop>" },
      -- { l .. "d%", "<cmd> norm! %x`'x<CR>" },
      --close buffer but go back to prev
      { "<C-x>", ":bp<Bar>bd #<Cr>" },
      -- { "<C-s>", ":w<cr>" },
      -- { "<C-j>", ":bnext<cr>" },
      -- Leader + o to add space normal mode
      { "<leader>o", "<S-i><CR><esc>k" },

      -- Prime binds center on scroll"
      { "n", "nzzzv", name = "Better center" },
      { "N", "Nzzzv", name = "Better center" },
      { "J", "mzJ`z" },

      -- undo last write
      { "U", ":ea 1f<CR>  | :echo 'Undo until last write'<CR>", name = "Undo to Last Write" },
      -- quit all
      { "<C-Q>", "<Esc>:quitall<CR>" },
      -- close current buffer
      -- { "<leader>x", ":bd!<CR>", name = " Close !!!" },
      -- -help word under cursor
      { "<leader>hw", ":help <C-r><C-w><CR>", name = "Help Word Under Current" },
      --u
      { "<leader><space>", "i<space><esc>", name = "Name add space" },
      { "<leader>vpi", '".p', name = "Paste Last Insert" },
      { "vp", "`[v`]", name = "Highlight last paste" },
      { "Q", "@q", name = "Play q macro" },
      { l .. "<CR>", "$o<esc>" },
      { "<leader>p", "o<Esc>p", name = "Paste over visual" },
      { "<leader>P", "ko<Esc>p", name = "Paste over visual" },
      { "vv", "V", name = "Visual Line Mode" },
      { "V", "vg_", name = "Visual to end of line" },
      -- { "<C-p>", c .. "Telescope git_files<cr>", name = "find git files" },
      -- { "<c-j>", ":bnext<cr>" , name = "Next Buffer"},
      -- { "<c-k>", ":bprev<cr>" , name = "Prev Buffer"},
      { l .. "x", c .. "bd<cr>", name = "Close buffer" },
      { l .. "X", c .. "bd!<cr>" },
    },
    {
      "<leader>g",
      name = "+git",
      {
        { "s", "<cmd>G<cr>" },
        { "c", "<cmd>G commit<cr>" },
      },
    },
    {
      "<leader>h",
      name = "+help",
      {
        { "w", "<cmd>help <C-r><C-w><CR>" },
      },
    },
  })
end

return M
