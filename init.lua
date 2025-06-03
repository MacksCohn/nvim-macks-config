-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`

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

require("lazy").setup({
    -- Packer can manage itself
    {
        "wbthomason/packer.nvim"
    },

    {
        "nvim-telescope/telescope.nvim", tag = '0.1.8',
        -- or                            , branch = "0.1.x",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {
                "nvim-telescope/telescope-ui-select.nvim",
                config = function()
                    require('telescope').setup({
                        extensions = {
                            ['ui-select'] = {
                                require('telescope.themes').get_dropdown {}
                            }
                        }
                    })
                    require('telescope').load_extension('ui-select')
                end,
            },
        }
    },

    {
        'vague2k/vague.nvim',
        config = function()
            require('vague').setup({})
        end,
    },

    { "mbbill/undotree" },
    { "ThePrimeagen/harpoon"},
    {"nvim-treesitter/nvim-treesitter"},

    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
            end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv'} },
                },
            },
        },
        config = function()
            vim.diagnostic.config({
                virtual_text = true
            })
        end,
    },

    {
        'williamboman/mason-lspconfig',
        dependencies = {
            { 'mason.nvim', opts = {} },
            'nvim-lspconfig',
            'blink.cmp',
        },
        config = function()
            local mason = require('mason-lspconfig')
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            ---@diagnostic disable-next-line: missing-fields
            mason.setup({
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                    ['omnisharp'] = function()
                        lspconfig.omnisharp.setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })
        end,
    },

    {
        'folke/lazydev.nvim',
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('lazydev').setup({})
        end,
    },

    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        opts = {
            keymap = {
                preset = 'default',
            },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = { documentation = { auto_show = false } },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" },
        config = function()
            require('blink.cmp').setup({})
        end,
    },
})


require("macks.remap")

vim.lsp.set_log_level("debug")


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

