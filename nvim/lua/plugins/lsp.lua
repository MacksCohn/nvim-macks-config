return {
    {
       'williamboman/mason.nvim',
        config = function()
            ---@diagnostic disable-next-line: missing-fields
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
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lspconfig.gdscript.setup({
                cmd = {
                    'node',
                    '/home/macks/custom_lsps/godot-wsl-lsp-1.3.1/bin/godot-wsl-lsp',
                    '--host',
                    '192.168.1.177',
                },
            })
            lspconfig.pylsp.setup({
                capabilities=capabilities,
                settings = {
                    pylsp = {
                        plugins={
                            pyflakes={enabled=true},
                            pylint={enabled=false},
                        }
                    }
                }
            })
        end,
    },

    {
        'williamboman/mason-lspconfig',
        lazy = false,
        dependencies = {
            { 'mason.nvim', opts = {} },
            'nvim-lspconfig',
            'blink.cmp',
        },
        config = function()
            local mason = require('mason-lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            ---@diagnostic disable-next-line: missing-fields
            mason.setup({
                automatic_installation = true,
            })
            vim.lsp.config['omnisharp'] = {
                capabilities = capabilities,
                root_markers = {'.git', 'Assets', '*.sln', '*.csproj'},
            }
        end,
    },
    {
        -- for loading progress for lsps
        'j-hui/fidget.nvim',
        opts = {}
    },
}
