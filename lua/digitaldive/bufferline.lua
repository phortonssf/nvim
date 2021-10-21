require("bufferline").setup{
  options = {
      numbers = "ordinal",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    }
}



