local M = { "andymass/vim-matchup" }

function M.config()
  vim.g.matchup_matchparen_offscreen = { method = "popup" }
end
return M
