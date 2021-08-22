--[[
NOTE: there are 3 types of configuration options:
1. global options (vim.o)
2. local to window (vim.wo)
3. local to buffer (vim.bo)
--]]

local cmd = vim.cmd  -- to execute Vim commands ':'
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- some basic settings
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = false                    -- Disable line wrap
opt.clipboard = 'unnamedplus'       -- copy/paste to system clipboard

-- NOTE: colorschemes *might* have to be instantiated before any require lspconfig.<server>.setup{}
-- COLORSCHEME:
--cmd[[colorscheme melange]]
cmd[[colorscheme neon]]
opt.termguicolors = true            -- enable 24-bit RGB colors
opt.timeoutlen = 500                -- time in milliseconds to wait for a mapped sequence to complete (sets which-key timing)

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- highlight yanked text (disabled in visual mode
