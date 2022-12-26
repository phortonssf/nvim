local nvim_surround = {}
nvim_surround.settings = {
  keymaps = {
        insert = "<C-_>s",
        insert_line = "<C-_>S",
        normal = "s",
        normal_cur = "sll",
        normal_line = "sa",
        normal_cur_line = "sal",
        visual = "s",
        visual_line = "sa",
        delete = "sd",
        change = "sc",
    },
  move_cursor = true,
  aliases = {
    ["a"] = ">",
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" },
    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
  },
}
nvim_surround.packages = {
    ["nvim-surround"] = {'kylechui/nvim-surround'}
}
nvim_surround.configs = {
  ['nvim-surround'] = function()
        require('nvim-surround').setup(doom.features.nvim_surround.settings)
    end
}
return nvim_surround
