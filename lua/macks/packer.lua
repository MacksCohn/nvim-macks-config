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

    use {
        "Everblush/nvim",
        as = "everblush",
        config = function()
            vim.cmd("colorscheme everblush")
        end
    }

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
        },
        config = function()
            local mason = require('mason-lspconfig')
            local lspconfig = require('lspconfig')
            mason.setup({
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({})
                    end,
                }
            })
        end,
    })

    use ({
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup({})
        end,
    })

end)
