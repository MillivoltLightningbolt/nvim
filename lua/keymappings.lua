-- HOWTO use:
--
-- vim.api.nvim_set_keymap(
--    {mode},       -- n: normal, i: interactive, v: visual, c: command-line, t: terminal, ...  => see https://github.com/nanotee/nvim-lua-guide#defining-mappings
--    {keymap},     -- which combination to press
--    {mapped to},  -- what the keypress will do
--    {options}     -- e.g. noremap, silent, expr, ...
--    )


local keymap = vim.api.nvim_set_keymap          -- shortcut
local opts = { noremap = true, silent = true }  -- commonly used options

-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
-- local g = vim.g      -- a table to access global variables
-- local opt = vim.opt  -- to set options



-- set leader-key to space
keymap('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- un-highlight search (will activate on next search)
keymap('n', '<C-l>', ':nohlsearch<Enter><C-l>', opts)

-- add new line below/above cursor in normal mode with Enter/Shift-Enter
keymap('n', '<ENTER>',   'o<ESC>', opts)	-- below
keymap('n', '<S-ENTER>', 'O<ESC>', opts)	-- above

-- add new line below cursor in insert mode with Ctrl+Enter
keymap('i', '<C-ENTER>', '<ESC>o', opts)	-- below
keymap('i', '<S-ENTER>', '<ESC>O', opts)	-- above

-- jump to end of line in insert mode (useful to skip autocompleted pairs {[("'``'")]})
keymap('i', '<C-l>', '<ESC>A', opts)

-- toggle file explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<Enter>', opts)

-- press F12 to enter neovims vimrc file
keymap('n', '<F12>', ':e $MYVIMRC<ENTER>', opts)

-- press F11 to enter neovims vimrc file
keymap('n', '<F11>', ':e ~/.config/nvim/lua/keymappings.lua<ENTER>', opts)

-- press Shift-F11 to enter plugins file
keymap('n', '<F23>', ':e ~/.config/nvim/lua/plugins.lua<ENTER>', opts)

-- source: https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
-- press F9 to source vimrc file after modifying it
keymap('n', '<F9>', ':source $MYVIMRC<Enter>', opts)

-- press Shift-F9 to source keymappings-file (a.k.a this file) after modifying it
keymap('n', '<F21>', ':source ~/.config/nvim/lua/keymappings.lua<Enter>', opts)

-- move between windows with Alt + movement-keys
keymap('n', '<M-h>', '<C-w>h', opts)
keymap('n', '<M-j>', '<C-w>j', opts)
keymap('n', '<M-k>', '<C-w>k', opts)
keymap('n', '<M-l>', '<C-w>l', opts)
-- Move current line up/down 1 in normal mode

keymap('n', '<C-j>', 'ddp', opts)   -- down
keymap('n', '<C-k>', 'ddkP', opts)  -- up

-- autocomplete (nvim-compe plugin) keymapping
keymap('i', '<C-Space>', 'compe#complete()', { expr = true, noremap = true, silent = true})
keymap('i', '<ENTER>', 'compe#confirm(\'<Enter>\')', { expr = true, noremap = true, silent = true})
keymap('i', '<C-e>', 'compe#close(\'<C-e>\')', { expr = true, noremap = true, silent = true})
keymap('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', { expr = true, noremap = true, silent = true})
keymap('i', '<C-b>', 'compe#scroll({ \'delta\': -4 })', { expr = true, noremap = true, silent = true}) -- NOTE <C-d> is already used for indenting in insert mode (<C-d> and <C-t>)



local function map(mode, lhs, rhs, overide_options)
  local options = {noremap = true}
  if overide_options then options = vim.tbl_extend('force', options, overide_options) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
--map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- telescope navigation
-- map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
-- map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
-- map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
-- map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')

-- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- highlight yanked text (disabled in visual mode

-- local wk = require("which-key")

-- wk.register({
--   f = {
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },
-- }, { prefix = "<leader>" })

