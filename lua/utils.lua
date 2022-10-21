opt = vim.opt
cmd = vim.cmd
g = vim.g

function _G.nmap(shortcut, command)
    vim.api.nvim_set_keymap('n', shortcut, command, { noremap = true, silent = true })
end

function _G.keymap(key, fun)
    vim.keymap.set('n', key, fun, {})
end
