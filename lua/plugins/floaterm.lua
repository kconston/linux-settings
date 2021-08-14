local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<leader>fg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazygit<CR>', options)
  map('n', '<leader>fl', '<CMD>FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating n -aHde<CR>', options)
  map('n', '<leader>ft', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating<CR>', options)
end

return {
  init = init
}
