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
