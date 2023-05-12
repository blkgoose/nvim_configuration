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
opt.foldmethod = "indent"
opt.relativenumber = true

opt.laststatus = 0
opt.guicursor = "i:block"
opt.termguicolors = true
opt.pumheight = 12

opt.mouse = ""

cmd([[
    let s:pair_mode = 0
    function! PairMode()
        if s:pair_mode  == 1
            let s:pair_mode = 1
            set norelativenumber
        else
            let s:pair_mode = 0
            set relativenumber
        endif
    endfunction

    nnoremap <leader>P :call PairMode()<CR>
]])

nmap("cf", ":!touch <cfile><cr>")
nmap("*", '"syiw<Esc>: let @/ = @s<CR>:set hlsearch<CR>')
nmap("<F1>", ':let @/ = ""<CR>')

opt.clipboard = "unnamed,unnamedplus"

-- highlight what has been copied
cmd([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
]])

cmd([[
autocmd BufWinEnter * normal zR
]])

cmd([[
nnoremap <C-c> [{V%
xnoremap <C-c> "_y[{V%
]])

require("plugins")
