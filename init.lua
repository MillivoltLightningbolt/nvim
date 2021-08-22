-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('plugins')                  -- all installed plugins
require('keymappings')              -- custom keybindings
require('nvim-compe')               -- autocomplete
require('nvim-autopairs').setup{}   -- automatically close '"`{[(
require('settings')                 -- all settings/configurations

-- NOTE: colorschemes *might* have to be instantiated before any require lspconfig.<server>.setup{}
require('theme')                    -- theme/colorscheme

require('nvim-lspconfig/main')      -- language server configurations
require('treesitter')               -- syntax highlighting (language parser)
require('whichkey')                 -- shows options on key press

