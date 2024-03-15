vim.g.mapleader = " "
local keymap = vim.keymap


keymap.set('i','jk','<ESC>') 
keymap.set('n','x','_x') 

-- tabs
keymap.set('n','<leader>to',':tabnew<CR>') 
keymap.set('n','<leader>tx',':tabclose<CR>') 
keymap.set('n','<leader>sn',':tabn<CR>') 
keymap.set('n','<leader>sp',':tabp<CR>') 

-- panes
keymap.set('n','<leader>sv','<C-w>v') -- split vertical 
keymap.set('n','<leader>sh','<C-w>s') -- split horizontal
keymap.set('n','<leader>se','<C-w>=') -- equal width
keymap.set('n','<leader>sx',':close<CR>') -- close split

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- leap
require('leap').add_default_mappings()
