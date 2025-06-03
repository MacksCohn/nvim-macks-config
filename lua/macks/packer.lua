-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
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
    }

    use ({
        'vague2k/vague.nvim',
        config = function()
            require('vague').setup({})
        end,
    })

    use("mbbill/undotree")
    use("ThePrimeagen/harpoon")
    use("nvim-treesitter/nvim-treesitter")

    use({
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
    })
    use({
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
    })
    use({
        'williamboman/mason-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'saghen/blink.cmp',
        },
        config = function()
            local mason = require('mason-lspconfig')
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            ---@diagnostic disable-next-line: missing-fields
            mason.setup({
                automatic_installation = true,
                handlers = {
                    ['omnisharp-mono'] = function()
                        lspconfig.omnisharp_mono.setup({
                            cmd = {
                                '~/.local/share/nvim/mason/packages/omnisharp-mono/run',
                                '--languageserver',
                                '--hostPID',
                                tostring(vim.fn.getpid()),
                            },
                            capabilities = capabilities,
                            settings = {
                                useModernNet = false,
                            },
                            filetypes = { 'cs' },
                        })
                    end,
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                }
            })
        end,
    })

    use ({
        'folke/lazydev.nvim',
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('lazydev').setup({})
        end,
    })

    use ({
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
    })
end)
