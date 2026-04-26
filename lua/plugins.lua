-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy
require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            vim.keymap.set('n', '?', "<cmd>NvimTreeToggle<cr>")

            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 60,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })

        end
    },
    {
        "vim-test/vim-test",
        config = function()
            vim.keymap.set('n', 'rc', '<cmd>TestFile<CR>', {noremap=true})
            vim.keymap.set('n', 'rl', '<cmd>TestLast<CR>', {noremap=true})
            vim.keymap.set('n', 'rn', '<cmd>TestNearest<CR>', {noremap=true})

            vim.g['test#python#runner'] = 'pytest'
            vim.g['test#python#nose#options'] ='-s -d'
            vim.g['test#python#runner'] = 'pytest'
            vim.g['test#javascript#mocha#options'] = '-r esm'
            vim.g['test#javascript#jest#runner'] = 'TZ=UTC jest'
            vim.g['test#kotlin#gradletest#options'] = '--info'
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").setup()
            vim.keymap.set('n', '<Leader>ff', require('telescope.builtin').find_files, { noremap=true })
            vim.keymap.set('n', '<Leader>fg', require('telescope.builtin').live_grep, { noremap=true })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "lua", "python", "kotlin", "dart", "javascript", "typescript", "sql", "xml", "json" },
                auto_install = true,
                highlight = {
                    enable = true
                },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap=true })
            vim.keymap.set('n', 'su', vim.lsp.buf.references, { noremap=true })

            vim.lsp.enable('kotlin_lsp')
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 'mason.nvim' },
        config = function()
            require('mason-lspconfig').setup {
                ensure_installed = {}
            }
        end
    },
    {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = { 'rafamadriz/friendly-snippets' },

      -- use a release tag to download pre-built binaries
      version = '1.*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'super-tab' },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    {
        'vimwiki/vimwiki'
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    {
        'opensearchplugin',
        dir = '~/projects/neovim-plugins/opensearchplugin',
        dev = true,
        config = function()
            require("opensearchplugin").setup()
        end
    },
    {
        'aichat',
        dir = '~/projects/neovim-plugins/aichat',
        dev = true,
        config = function()
            require("aichat").setup()
        end
    },
    {
        'jira',
        dir = '~/projects/neovim-plugins/jiraplugin',
        dev = true,
        config = function()
            require("jiraplugin").setup({
                jira_config_file = '/Users/mlackman/projects/neovim-plugins/.jira.toml'
            })
        end
    },

})
