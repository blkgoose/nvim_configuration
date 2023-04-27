require("utils")

opt.number = true
opt.wrap = false
opt.showmatch = true
opt.hidden = true

opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.completeopt = "menu"
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.foldmethod = "indent"
opt.relativenumber = true

opt.laststatus = 3
opt.guicursor = "i:block"
opt.termguicolors = true
opt.pumheight = 12

opt.mouse = ""

nmap("cf", ":!touch <cfile><cr>")
nmap("Y", "yy")
nmap("*", '"syiw<Esc>: let @/ = @s<CR>:set hlsearch<CR>')
nmap("<F1>", ':let @/ = ""<CR>')

cmd([[ inoremap <C-c> USA ESC... ]])

opt.clipboard = "unnamed,unnamedplus"

-- reload conf automatically
-- cmd([[
-- augroup conf_update
--   autocmd!
--   autocmd BufWritePost $HOME/.config/nvim/* lua reload_conf()
-- augroup end
-- ]])

-- highlight what has been copied
cmd([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
]])

cmd([[
autocmd BufRead * normal zR
]])

require("plugins")
