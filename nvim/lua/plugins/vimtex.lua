return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = {
        aux_dir = 'build',
        build_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        hooks = {},
        options = {
            '-pdf',
            '-verbose',
            '-file-line-error',
            '-synctex=1',
            '-interaction=nonstopmode',
            '-view=none', -- Ensures no automatic viewer opening
        },
    }
    vim.g.vimtex_quickfix_ignore_filters = {
        'Overfull \\\\hbox',
        'Underfull \\\\hbox',
    }
  end
}
