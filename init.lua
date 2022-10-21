require('utils')

opt.number = true
opt.wrap = false
opt.showmatch = true
opt.hidden = true

opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.completeopt = 'menu'

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.foldmethod='indent'

opt.relativenumber = true

opt.guicursor='i:block'

opt.viminfo="'100,<10000,s100,h"

nmap('cf', ':!touch <cfile><cr>')
nmap('Y', 'yy')
nmap('*', '"syiw<Esc>: let @/ = @s<CR>:set hlsearch<CR>')
nmap('m', ':let @/ = @s<CR>:set hlsearch<CR>')
nmap('<F1>', ':let @/ = ""<CR>')

opt.clipboard = 'unnamed,unnamedplus'

-- reload plugins conf automatically
cmd([[
augroup plugins_update
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- reload init
cmd([[
augroup init_update
  autocmd!
  autocmd BufWritePost init.lua source <afile>
augroup end
]])

require('plugins')
