cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- self update
    use 'wbthomason/packer.nvim'

    -- fuzzy search
    -- use 'ctrlpvim/ctrlp.vim'
    use { "ibhagwan/fzf-lua",
        config = function()
            nmap('<C-p>', ':FzfLua files<CR>')
            nmap('<C-h>', ':FzfLua<CR>')
        end }
    -- reload nvim conf
    use { "famiu/nvim-reload", requires = { "nvim-lua/plenary.nvim" } }

    -- themes
    use({
        "themercorp/themer.lua",
        config = function()
            require("themer").setup({
                colorscheme = "github_dark_colorblind",
            })
        end
    })

    -- tree file view
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        config = function()
            nmap('<C-f>', ':Neotree toggle<CR>')
        end
    }

    -- conqueror of completion
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            nmap('<space>j', ':call CocAction("diagnosticNext")<CR>')
            nmap('<space>k', ':call CocAction("diagnosticPrevious")<CR>')
            nmap('<leader>c', '<Plug>(coc-codeaction-selected)<CR>')
            nmap('<leader>l', ':CocList<CR>')
            nmap('<leader>L', ':CocListResume<CR>')
            nmap('gy', '<Plug>(coc-type-definition)')
            nmap('gi', '<Plug>(coc-implementation)')
            nmap('gr', '<Plug>(coc-references)')
            nmap('gd', '<Plug>(coc-definition)')
            opt.tagfunc = 'CocTagFunc'
        end
    }

    -- todo's highlight
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            -- skip to next comment
            keymap('<F3>', function()
                require('todo-comments').jump_next()
            end)
        end
    }

    use {
        'johnfrankmorgan/whitespace.nvim',
        config = function()
            require('whitespace-nvim').setup {
                highlight = 'DiffDelete',
                ignored_filetypes = { 'TelescopePrompt' },
            }

            -- removes trailing whitespace
            keymap('<F2>', function()
                require('whitespace-nvim').trim()
            end)
        end
    }

    -- auto comments commands
    use 'tpope/vim-commentary'

    -- blame
    use {
        'tpope/vim-fugitive',
        config = function()
            nmap('<leader>b', ':Gblame')
        end
    }

    -- syntax highlight and formatters
    use 'dag/vim-fish'
    use 'jparise/vim-graphql'
    use 'elixir-editors/vim-elixir'
    use {
        'mhinz/vim-mix-format',
        config = function()
            g.mix_format_on_save = 1
        end
    }
end)
