-- helper function for keymap
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- free space for leader
map('n', '<Space>', '<NOP>')

-- no highlight
map('n', '<Leader>h', ':set hlsearch!<CR>')
map('n', '<Leader>n', ':noh<CR>')

-- explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>')
map('n', '<Tab>', ':NvimTreeToggle<CR>')

-- better window movement
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- tab switch buffer
map('n', '<Leader><Tab>', ':e#<CR>')

-- tab complete
map('i', '<Tab>', 'pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"', {expr = true});
map('i', '<S-Tab>', 'pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"', {expr = true});


-- kommentary
map("n", "<leader>c<Space>", "<Plug>kommentary_line_default", {noremap = false})
map("n", "<leader>c", "<Plug>kommentary_motion_default", {noremap = false})
map("v", "<leader>c", "<Plug>kommentary_visual_default", {noremap = false})

-- barbar
map("n", "<leader>b", ":BufferPick<CR>")
map("n", "<leader>q", ":BufferClose<CR>")
map("n", "<leader>.", ":BufferNext<CR>")
map("n", "<leader>,", ":BufferPrevious<CR>")


-- telescope
map("n", "<leader>ff",  ":Telescope find_files<CR>")
map("n", "<leader>fg",  ":Telescope live_grep<CR>")
map("n", "<leader>fb",  ":Telescope buffers<CR>")
map("n", "<leader>fh",  ":Telescope help_tags<CR>")

-- nvim-tree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["v"]              = tree_cb("vsplit"),
  ["h"]              = tree_cb("split"),
  ["<C-Space>"]      = tree_cb("preview"),
  ["<Tab>"]          = tree_cb("close"),
  -- default mappings
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["<2-LeftMouse>"]  = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<C-]>"]          = tree_cb("cd"),
  --["<C-v>"]          = tree_cb("vsplit"),
  --["<C-x>"]          = tree_cb("split"),
  ["<C-t>"]          = tree_cb("tabnew"),
  ["<"]              = tree_cb("prev_sibling"),
  [">"]              = tree_cb("next_sibling"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  --["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["c"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
