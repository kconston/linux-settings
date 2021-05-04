local function normal_remap()
  local map = vim.api.nvim_set_keymap
  local options = { noremap = false }

end

local function normal_noremap()
  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('n', '<leader>h', ':wincmd h<CR>', options)
  map('n', '<leader>j', ':wincmd j<CR>', options)
  map('n', '<leader>k', ':wincmd k<CR>', options)
  map('n', '<leader>l', ':wincmd l<CR>', options)
  map('n', '<leader>nhl', ':nohl<CR>', options)
  map('n', '<leader>qns', ':qa!<CR>', options)
  map('n', '<leader>lll', '<C-w>v<CR>', options)

  --Quick Reload
  map('n', '<leader>rl', ':source %<CR>', options)

  --Win Split
  map('n', '<leader>vs', ':vsplit<CR> :wincmd l<CR>', options)
  map('n', '<leader>hs', ':split<CR> :wincmd j<CR>', options)

end

local function insert_noremap()
  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('i', 'jk', '<esc>', options)
end

local function other_map()
  local map = vim.api.nvim_set_keymap
end

local function init()
  normal_remap()
  normal_noremap()
  insert_noremap()
  other_map()
end

return {
 init = init
}
