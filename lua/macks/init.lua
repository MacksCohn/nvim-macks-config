require("macks.remap")

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

-- Terminal Switching Logic
-- note - <C-g> is the same as Ctrl-'

local custom_terminal_bufnr = nil
local custom_terminal_winid = nil

local function openCustomTerminal()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd('J')
    local totalLines = vim.o.lines
    vim.api.nvim_win_set_height(0, math.floor(totalLines * .30))
    custom_terminal_bufnr = vim.api.nvim_get_current_buf()
    custom_terminal_winid = vim.api.nvim_get_current_win()
    vim.cmd('normal i')
end

local function smartTerminalToggle()
    local current_win = vim.api.nvim_get_current_win()

    local is_custom_terminal_valid = false
    if custom_terminal_winid and vim.api.nvim_win_is_valid(custom_terminal_winid) then
        local buf_of_tracked_win = vim.api.nvim_win_get_buf(custom_terminal_winid)
        local tracked_buftype = vim.api.nvim_get_option_value('buftype', { buf = buf_of_tracked_win })
        if buf_of_tracked_win == custom_terminal_bufnr and tracked_buftype == 'terminal' then
            is_custom_terminal_valid = true
        else
            custom_terminal_bufnr = nil
            custom_terminal_winid = nil
        end
    end

    if is_custom_terminal_valid then
        if current_win == custom_terminal_winid then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), 't', false)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, true, true), 'n', false)
        else
            vim.api.nvim_set_current_win(custom_terminal_winid)
            vim.cmd('startinsert')
        end
    else
        openCustomTerminal()
    end
end

vim.keymap.set({'n', 'v', 's', 'x', 'i'}, '<C-g>', smartTerminalToggle, {})
vim.keymap.set('t', '<C-g>', function()
    smartTerminalToggle()
end)
