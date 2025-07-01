local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-o>', function()
    ui.nav_next()
    vim.cmd('normal! zz')
end)
vim.keymap.set('n', '<C-i>', function()
    ui.nav_prev()
    vim.cmd('normal! zz')
end)
