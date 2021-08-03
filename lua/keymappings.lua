-- set leader-key to space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- deactivate highlight-search
vim.api.nvim_set_keymap('n', '<C-L>', ':nohlsearch<Enter><C-L>', { noremap = true, silent = true})

-- add new line below/above cursor in normal mode with Enter/Shift-Enter
vim.api.nvim_set_keymap('n', '<ENTER>', 'o<ESC>', { noremap = true, silent = true})	-- below
vim.api.nvim_set_keymap('n', '<S-ENTER>', 'O<ESC>', { noremap = true, silent = true})	-- above

-- toggle file explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<Enter>', { noremap = true, silent = true})

-- press F12 to enter neovims vimrc file
vim.api.nvim_set_keymap('n', '<F12>', ':e $MYVIMRC<ENTER>', { noremap = true, silent = true})

-- press F11 to enter neovims vimrc file
vim.api.nvim_set_keymap('n', '<F11>', ':e ~/.config/nvim/lua/keymappings.lua<ENTER>', { noremap = true, silent = true})

-- source: https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
-- press F9 to source vimrc file after modifying it
vim.api.nvim_set_keymap('n', '<F9>', ':source $MYVIMRC<Enter>', { noremap = true, silent = true})

-- press Shift-F9 to source keymappings-file (a.k.a this file) after modifying it
vim.api.nvim_set_keymap('n', '<F21>', ':source ~/.config/nvim/lua/keymappings.lua<Enter>', { noremap = true, silent = true})

-- move between windows with Alt + movement-keys
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', { noremap = true, silent = true})

