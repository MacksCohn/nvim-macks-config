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
    }
}
