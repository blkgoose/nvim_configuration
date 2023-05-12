local microscope = require("microscope")

local actions = require("microscope.builtin.actions")
local files = require("microscope-files")
local buffers = require("microscope-buffers")
local code = require("microscope-code")

microscope.setup({
  size = {
    width = 125,
    height = 40,
  },
  bindings = {
    ["<c-j>"] = actions.next,
    ["<c-k>"] = actions.previous,
    ["<c-n>"] = actions.scroll_down,
    ["<c-p>"] = actions.scroll_up,
    ["<c-m>"] = actions.toggle_full_screen,
    ["<CR>"] = actions.open,
    ["<ESC>"] = actions.close,
    ["<TAB>"] = actions.select,
  },
})

microscope.register(files.finders)
microscope.register(buffers.finders)
microscope.register(code.finders)

keymap("<leader>fw", ":Microscope workspace_grep<CR>")
keymap("<leader>fW", ":Microscope workspace_fuzzy<CR>")
keymap("<leader>of", ":Microscope file<CR>")
keymap("<leader>ob", ":Microscope buffer<CR>")
keymap("gi", ":Microscope code_implementations<CR>")
keymap("gd", ":Microscope code_definitions<CR>")
keymap("gr", ":Microscope code_references<CR>")
keymap("gt", ":Microscope code_type_definition<CR>")

for finder, _ in pairs(files.finders) do
  microscope.finders[finder]:override({
    bindings = { ["<c-q>"] = files.actions.quickfix },
  })
end
