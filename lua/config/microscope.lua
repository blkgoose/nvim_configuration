local microscope = require("microscope")

local actions = require("microscope.builtin.actions")
local files = require("microscope-files")
local buffers = require("microscope-buffers")
local code = require("microscope-code")

local layouts = require("microscope.builtin.layouts")
local display = require("microscope.api.display")

local mode = 0
local layout_list = {
  function(opts)
    return display
      .vertical({
        display.input(1),
        display.preview(),
        display.space("50%"),
      })
      :build(opts.ui_rectangle)
  end,
  function(opts)
    return display
      .vertical({
        display.space("25%"),
        display.horizontal({
          display.results(),
          display.space("25%"),
          display.preview(),
        }),
        display.space("25%"),
      })
      :build(opts.ui_rectangle)
  end,
  layouts.default,
}
local function rotate_layout(instance)
  instance:set_layout(layout_list[mode + 1])
  mode = (mode + 1) % #layout_list
end

microscope.setup({
  size = {
    width = 70,
    height = 40,
  },
  bindings = {
    ["<c-j>"] = actions.next,
    ["<c-k>"] = actions.previous,
    ["<c-n>"] = actions.scroll_down,
    ["<c-p>"] = actions.scroll_up,
    ["<c-m>"] = actions.toggle_full_screen,
    ["<c-a>"] = rotate_layout,
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
