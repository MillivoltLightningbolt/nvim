--[[
NOTE: there are 3 types of configuration options:
1. global options (vim.o)
2. local to window (vim.wo)
3. local to buffer (vim.bo)
--]]

-- NOTE: pretty cool settings to steal/copy from here: https://github.com/brainfucksec/neovim-lua

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('plugins')                  -- all installed plugins
require('keymappings')              -- custom keybindings
require('nvim-compe')               -- autocomplete
require('nvim-autopairs').setup{}   -- automatically close '"`{[(
require('settings')                 -- all settings/configurations
require('nvim-lspconfig/main')      -- language server configurations

-- local luadev = require("lua-dev").setup({
--   -- add any options here, or leave empty to use the default settings
--   lspconfig = {
--     cmd = {"lua-language-server"}
--   },
-- })
-- local lspconfig = require('lspconfig')
-- lspconfig.sumneko_lua.setup(luadev)

-- NOTE: colorschemes *might* have to be instantiated before any require lspconfig.<server>.setup{}

