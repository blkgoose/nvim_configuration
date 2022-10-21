-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alessio/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/alessio/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/alessio/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/alessio/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alessio/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    config = { "\27LJ\2\nø\3\0\0\4\0\22\0(6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\6\0B\0\3\0016\0\0\0'\2\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0'\3\n\0B\0\3\0016\0\0\0'\2\v\0'\3\f\0B\0\3\0016\0\0\0'\2\r\0'\3\14\0B\0\3\0016\0\0\0'\2\15\0'\3\16\0B\0\3\0016\0\0\0'\2\17\0'\3\18\0B\0\3\0016\0\19\0'\1\21\0=\1\20\0K\0\1\0\15CocTagFunc\ftagfunc\bopt\27<Plug>(coc-definition)\agd\27<Plug>(coc-references)\agr\31<Plug>(coc-implementation)\agi <Plug>(coc-type-definition)\agy\23:CocListResume<cr>\14<leader>L\17:CocList<cr>\14<leader>l(<Plug>(coc-codeaction-selected)<cr>\14<leader>c.:call CocAction(\"diagnosticPrevious\")<CR>\r<space>k*:call CocAction(\"diagnosticNext\")<CR>\r<space>j\tnmap\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\5\0\t6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\16:FzfLua<CR>\n<C-h>\22:FzfLua files<CR>\n<C-p>\tnmap\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n:\0\0\4\0\3\0\0056\0\0\0'\2\1\0'\3\2\0B\0\3\1K\0\1\0\24:Neotree toggle<CR>\n<C-f>\tnmap\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["themer.lua"] = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16colorscheme\27github_dark_colorblind\nsetup\vthemer\frequire\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/themer.lua",
    url = "https://github.com/themercorp/themer.lua"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14jump_next\18todo-comments\frequire(\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\t<F3>\vkeymap\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/vim-fish",
    url = "https://github.com/dag/vim-fish"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0056\0\0\0'\2\1\0'\3\2\0B\0\3\1K\0\1\0\f:Gblame\14<leader>b\tnmap\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/vim-graphql",
    url = "https://github.com/jparise/vim-graphql"
  },
  ["vim-mix-format"] = {
    config = { "\27LJ\2\n,\0\0\2\0\2\0\0046\0\0\0)\1\1\0=\1\1\0K\0\1\0\23mix_format_on_save\6g\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/vim-mix-format",
    url = "https://github.com/mhinz/vim-mix-format"
  },
  ["whitespace.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\ttrim\20whitespace-nvim\frequire¤\1\1\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0003\3\b\0B\0\3\1K\0\1\0\0\t<F2>\vkeymap\22ignored_filetypes\1\2\0\0\20TelescopePrompt\1\0\1\14highlight\15DiffDelete\nsetup\20whitespace-nvim\frequire\0" },
    loaded = true,
    path = "/home/alessio/.local/share/nvim/site/pack/packer/start/whitespace.nvim",
    url = "https://github.com/johnfrankmorgan/whitespace.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: themer.lua
time([[Config for themer.lua]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16colorscheme\27github_dark_colorblind\nsetup\vthemer\frequire\0", "config", "themer.lua")
time([[Config for themer.lua]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nø\3\0\0\4\0\22\0(6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\6\0B\0\3\0016\0\0\0'\2\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0'\3\n\0B\0\3\0016\0\0\0'\2\v\0'\3\f\0B\0\3\0016\0\0\0'\2\r\0'\3\14\0B\0\3\0016\0\0\0'\2\15\0'\3\16\0B\0\3\0016\0\0\0'\2\17\0'\3\18\0B\0\3\0016\0\19\0'\1\21\0=\1\20\0K\0\1\0\15CocTagFunc\ftagfunc\bopt\27<Plug>(coc-definition)\agd\27<Plug>(coc-references)\agr\31<Plug>(coc-implementation)\agi <Plug>(coc-type-definition)\agy\23:CocListResume<cr>\14<leader>L\17:CocList<cr>\14<leader>l(<Plug>(coc-codeaction-selected)<cr>\14<leader>c.:call CocAction(\"diagnosticPrevious\")<CR>\r<space>k*:call CocAction(\"diagnosticNext\")<CR>\r<space>j\tnmap\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: vim-mix-format
time([[Config for vim-mix-format]], true)
try_loadstring("\27LJ\2\n,\0\0\2\0\2\0\0046\0\0\0)\1\1\0=\1\1\0K\0\1\0\23mix_format_on_save\6g\0", "config", "vim-mix-format")
time([[Config for vim-mix-format]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\4\0\3\0\0056\0\0\0'\2\1\0'\3\2\0B\0\3\1K\0\1\0\24:Neotree toggle<CR>\n<C-f>\tnmap\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14jump_next\18todo-comments\frequire(\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\t<F3>\vkeymap\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\5\0\t6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\16:FzfLua<CR>\n<C-h>\22:FzfLua files<CR>\n<C-p>\tnmap\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0056\0\0\0'\2\1\0'\3\2\0B\0\3\1K\0\1\0\f:Gblame\14<leader>b\tnmap\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: whitespace.nvim
time([[Config for whitespace.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\ttrim\20whitespace-nvim\frequire¤\1\1\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0003\3\b\0B\0\3\1K\0\1\0\0\t<F2>\vkeymap\22ignored_filetypes\1\2\0\0\20TelescopePrompt\1\0\1\14highlight\15DiffDelete\nsetup\20whitespace-nvim\frequire\0", "config", "whitespace.nvim")
time([[Config for whitespace.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
