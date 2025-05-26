-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/macks/.cache/nvim/packer_hererocks/2.1.1744317938/share/lua/5.1/?.lua;/home/macks/.cache/nvim/packer_hererocks/2.1.1744317938/share/lua/5.1/?/init.lua;/home/macks/.cache/nvim/packer_hererocks/2.1.1744317938/lib/luarocks/rocks-5.1/?.lua;/home/macks/.cache/nvim/packer_hererocks/2.1.1744317938/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/macks/.cache/nvim/packer_hererocks/2.1.1744317938/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["blink.cmp"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14blink.cmp\frequire\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/blink.cmp",
    url = "https://github.com/saghen/blink.cmp"
  },
  everblush = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme everblush\bcmd\bvim\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/everblush",
    url = "https://github.com/Everblush/nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["mason-lspconfig"] = {
    config = { "\27LJ\2\nO\0\1\5\2\3\0\b-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3B\1\2\1K\0\1\0\1À\2À\17capabilities\1\0\1\17capabilities\0\nsetupÍ\1\1\0\b\0\t\0\0206\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0029\3\5\0005\5\6\0004\6\3\0003\a\a\0>\a\1\6=\6\b\5B\3\2\0012\0\0€K\0\1\0\rhandlers\0\1\0\2\27automatic_installation\2\rhandlers\0\nsetup\25get_lsp_capabilities\14blink.cmp\14lspconfig\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/mason-lspconfig",
    url = "https://github.com/williamboman/mason-lspconfig"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n¦\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\aui\1\0\1\aui\0\nicons\1\0\1\nicons\0\1\0\3\22package_installed\bâœ“\24package_uninstalled\bâœ—\20package_pending\bâžœ\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17virtual_text\2\vconfig\15diagnostic\bvim\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nä\1\0\0\b\0\n\1\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\0054\a\0\0B\5\2\0?\5\0\0=\4\6\3=\3\b\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\t\0'\2\6\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\1\15extensions\0\14ui-select\1\0\1\14ui-select\0\17get_dropdown\21telescope.themes\nsetup\14telescope\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/macks/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope-ui-select.nvim
time([[Config for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\nä\1\0\0\b\0\n\1\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\0054\a\0\0B\5\2\0?\5\0\0=\4\6\3=\3\b\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\t\0'\2\6\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\1\15extensions\0\14ui-select\1\0\1\14ui-select\0\17get_dropdown\21telescope.themes\nsetup\14telescope\frequire\3€€À™\4\0", "config", "telescope-ui-select.nvim")
time([[Config for telescope-ui-select.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n¦\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\aui\1\0\1\aui\0\nicons\1\0\1\nicons\0\1\0\3\22package_installed\bâœ“\24package_uninstalled\bâœ—\20package_pending\bâžœ\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: blink.cmp
time([[Config for blink.cmp]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14blink.cmp\frequire\0", "config", "blink.cmp")
time([[Config for blink.cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17virtual_text\2\vconfig\15diagnostic\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: mason-lspconfig
time([[Config for mason-lspconfig]], true)
try_loadstring("\27LJ\2\nO\0\1\5\2\3\0\b-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3B\1\2\1K\0\1\0\1À\2À\17capabilities\1\0\1\17capabilities\0\nsetupÍ\1\1\0\b\0\t\0\0206\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0029\3\5\0005\5\6\0004\6\3\0003\a\a\0>\a\1\6=\6\b\5B\3\2\0012\0\0€K\0\1\0\rhandlers\0\1\0\2\27automatic_installation\2\rhandlers\0\nsetup\25get_lsp_capabilities\14blink.cmp\14lspconfig\20mason-lspconfig\frequire\0", "config", "mason-lspconfig")
time([[Config for mason-lspconfig]], false)
-- Config for: everblush
time([[Config for everblush]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme everblush\bcmd\bvim\0", "config", "everblush")
time([[Config for everblush]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
