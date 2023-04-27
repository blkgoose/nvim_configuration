local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local palette = require("palette")
local colors = palette.colors
local syntax = palette.syntax

require("lazy").setup({
  -- fuzzy search
  {
    "danielefongo/microscope",
    dependencies = {
      "danielefongo/microscope-files",
      "danielefongo/microscope-buffers",
    },
    config = function()
      require("config.microscope")
    end,
  },

  -- themes
  -- {
  --   "themercorp/themer.lua",
  --   -- event = "VeryLazy",
  --   opts = {
  --     colorscheme = {
  --       red = colors.dark_red,
  --       yellow = colors.yellow,
  --       orange = colors.dark_yellow,
  --       magenta = colors.magenta,
  --       blue = colors.blue,
  --       green = colors.green,
  --       cyan = colors.cyan,

  --       directory = colors.blue,
  --       fg = colors.white,
  --       diff = {
  --         add = colors.dark_green,
  --         remove = colors.dark_red,
  --         text = colors.dark_blue,
  --         change = colors.dark_yellow,
  --       },
  --       accent = colors.cyan,
  --       search_result = { fg = colors.dark_black, bg = colors.blue, telescope = colors.blue },
  --       match = colors.grey9,
  --       dimmed = { bg = colors.grey4, fg = colors.grey4 },
  --       bg = {
  --         base = colors.black,
  --         alt = colors.light_black,
  --         selected = colors.grey2,
  --       },
  --       border = colors.white,
  --       syntax = syntax,
  --       built_in = syntax,
  --       diagnostic = {
  --         error = colors.strong_red,
  --         warn = colors.strong_yellow,
  --         info = colors.strong_green,
  --         hint = colors.magenta,
  --       },
  --       inc_search = { fg = colors.dark_black, bg = colors.blue },
  --       uri = colors.dark_yellow,
  --       pum = {
  --         fg = colors.grey9,
  --         bg = colors.dark_black,
  --         sbar = colors.light_black,
  --         thumb = colors.blue,
  --         sel = { bg = colors.grey2, fg = colors.white },
  --       },
  --       heading = {
  --         h1 = colors.blue,
  --         h2 = colors.blue,
  --       },
  --       remaps = {
  --         base = {
  --           winseparator = { fg = colors.grey2, bg = colors.black },
  --           diffadd = { fg = colors.dark_green, bg = colors.black },
  --           diffchange = { fg = colors.dark_yellow, bg = colors.black },
  --           diffdelete = { fg = colors.dark_red, bg = colors.black },
  --         },
  --         plugins = {
  --           nvim_tree = {
  --             nvimtreenormal = { fg = colors.white, bg = colors.dark_black },
  --             nvimtreegitdeleted = { fg = colors.red },
  --             nvimtreegitdirty = { fg = colors.yellow },
  --             nvimtreegitstaged = { fg = colors.green },
  --             nvimtreegitmerge = { fg = colors.yellow },
  --             nvimtreegitnew = { fg = colors.red },
  --             nvimtreegitrenamed = { fg = colors.white },
  --             nvimtreespecialfile = { fg = colors.white },
  --             nvimtreeimagefile = { fg = colors.white },
  --             nvimtreeopenedfile = { fg = colors.white },
  --             nvimtreemodifiedfile = { fg = colors.white },
  --             nvimtreeindentmarker = { fg = colors.white },
  --             nvimtreesymlink = { fg = colors.white },
  --             nvimtreeexecfile = { fg = colors.white },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "css",
          "dockerfile",
          "elixir",
          "elm",
          "html",
          "javascript",
          "json",
          "markdown",
          "python",
          "rust",
          "lua",
          "toml",
          "typescript",
          "vim",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },

  -- tree file view
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            visible = true,
          },
        },
        buffer = {
          follow_current_file = true,
        },
      })

      nmap("<C-f>", ":Neotree toggle<CR>")
    end,
  },

  {
    "johnfrankmorgan/whitespace.nvim",
    config = function()
      require("whitespace-nvim").setup({
        highlight = "DiffDelete",
        ignored_filetypes = { "TelescopePrompt" },
      })

      keymap("<F2>", function()
        require("whitespace-nvim").trim()
      end)
    end,
  },

  -- auto comments commands
  { "tpope/vim-commentary" },

  -- git commands
  {
    "tpope/vim-fugitive",
    config = function()
      nmap("<leader>b", ":Git blame<CR>")
      nmap("<leader>gm", "/<<<<<<<\\|=======\\|>>>>>>><CR>")
    end,
  },

  -- git status side-bar
  {
    "airblade/vim-gitgutter",
    config = function()
      g.gitgutter_map_keys = 0
    end,
  },

  -- syntax highlight and formatters
  { "mechatroner/rainbow_csv" },
  { "dag/vim-fish" },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "ray-x/lsp_signature.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    keys = {
      { "<leader>c", ":lua vim.lsp.buf.code_action()<cr>" },
      { "<leader>h", ":lua vim.lsp.buf.signature_help()<cr>" },
      { "<leader>R", ":lua vim.lsp.buf.rename()<cr>" },
      { "gd", ":lua vim.lsp.buf.definition()<cr>" },
      { "gr", ":lua vim.lsp.buf.references()<cr>" },
      { "gi", ":lua vim.lsp.buf.implementations()<cr>" },
      { "<space>j", ":lua vim.diagnostic.goto_prev({ wrap = false })<cr>" },
      { "<space>k", ":lua vim.diagnostic.goto_next({ wrap = false })<cr>" },
    },
    event = "VeryLazy",
    config = function()
      local lsp = require("lspconfig")
      local cmp = require("cmp_nvim_lsp")
      local signature = require("lsp_signature")
      local inlay = require("lsp-inlayhints")

      local mason = require("mason")
      local mason_lsp_config = require("mason-lspconfig")

      local flags = { debounce_text_changes = 150 }
      local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function cmd_path(server)
        return fn.glob(fn.stdpath("data") .. "/lsp/bin/" .. server)
      end

      local function on_attach(client, bufnr)
        signature.on_attach({ bind = true }, bufnr)
        inlay.on_attach(client, bufnr)
      end

      local lsps = {
        bashls = {},
        cssls = {},
        dockerls = {},
        elixirls = {
          cmd = { cmd_path("elixir-ls") },
          settings = {
            elixirLS = {
              fetchDeps = false,
              mixEnv = "dev",
            },
          },
        },
        elmls = {},
        html = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              format = { enable = false },
            },
          },
        },
        marksman = {},
        pylsp = {},
        taplo = {},
        tsserver = {
          settings = {
            javascript = { format = { enable = false } },
            typescript = { format = { enable = false } },
          },
        },
        rust_analyzer = {},
      }

      mason.setup({ install_root_dir = fn.stdpath("data") .. "/lsp/" })

      mason_lsp_config.setup({
        ensure_installed = vim.tbl_keys(lsps),
        automatic_installation = true,
      })

      for lsp_name, config in pairs(lsps) do
        lsp[lsp_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          flags = flags,
          cmd = config.cmd,
          settings = config.settings or {},
        })
      end
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      local mason = require("mason")
      local null_ls = require("null-ls")
      local mason_null_ls = require("mason-null-ls")

      local null_sources = {
        shfmt = null_ls.builtins.formatting.shfmt, -- bash / sh
        mix = null_ls.builtins.formatting.mix, -- elixir
        elm_format = null_ls.builtins.formatting.elm_format, -- elm
        prettier = null_ls.builtins.formatting.prettier, -- html stuff
        stylua = null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        }), -- lua
        markdownlint = null_ls.builtins.formatting.markdownlint, -- markdown
        black = null_ls.builtins.formatting.black, -- python
        rustfmt = null_ls.builtins.formatting.rustfmt, -- rust
        taplo = null_ls.builtins.formatting.taplo, -- toml
        eslint = null_ls.builtins.formatting.eslint, -- ts (js)
      }

      mason.setup({ install_root_dir = fn.stdpath("data") .. "/lsp/" })

      null_ls.setup({
        sources = vim.tbl_values(null_sources),
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  filter = function()
                    return client.name == "null-ls"
                  end,
                })
              end,
            })
          end
        end,
      })

      mason_null_ls.setup({
        ensure_installed = vim.tbl_keys(null_sources),
        automatic_installation = true,
      })
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    opts = { window = { relative = "editor" } },
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "BufReadPost",
    opts = { inlay_hints = { highlight = colors.light_grey } },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "BufReadPost",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<cr>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "path" },
          { name = "buffer", keyword_length = 2, max_item_count = 8 },
        },
        formatting = {
          fields = { "abbr", "kind" },
          max_width = 0,
          format = function(_, vim_item)
            local function trim(text)
              local max = 40
              if text and #text > max then
                text = text:sub(1, max) .. "..."
              end
              return text
            end

            vim_item.menu = ""
            vim_item.abbr = trim(vim_item.abbr)
            return vim_item
          end,
        },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    event = "BufReadPost",
    opts = { position = "bottom", height = 10 },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>d", ":lua require('trouble').toggle('workspace_diagnostics')<cr>" },
    },
  },

  -- distraction free
  {
    "arnamak/stay-centered.nvim",
    config = function()
      require("stay-centered")
    end,
  },
})
