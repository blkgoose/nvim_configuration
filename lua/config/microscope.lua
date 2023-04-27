local microscope = require("microscope")

local actions = require("microscope.actions")
local files = require("microscope-files")
local buffers = require("microscope-buffers")

microscope.setup({
  size = {
    width = 125,
    height = 40,
  },
  bindings = {
    ["<c-n>"] = actions.next,
    ["<c-p>"] = actions.previous,
    ["<c-j>"] = actions.scroll_down,
    ["<c-k>"] = actions.scroll_up,
    ["<c-m>"] = actions.toggle_full_screen,
    ["<CR>"] = actions.open,
    ["<ESC>"] = actions.close,
    ["<TAB>"] = actions.select,
  },
})

microscope.register(files.finders)
microscope.register(buffers.finders)

keymap("<leader>fw", microscope.finders.workspace_grep:bind())
keymap("<leader>fW", microscope.finders.workspace_fuzzy:bind())
keymap("<leader>of", microscope.finders.file:bind())
keymap("<leader>ob", microscope.finders.buffer:bind())

for finder, _ in pairs(files.finders) do
  microscope.finders[finder]:override({
    bindings = { ["<c-q>"] = files.actions.quickfix },
  })
end
