local function set_lspaugroup()
  vim.api.nvim_command("augroup lsp")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType java lua require'jdtls'.start_or_attach({cmd = {'/home/kconston/jdts-launch-script.sh'}})")
  vim.api.nvim_command("augroup END")
end

local set_vim_g = function()
  vim.g.mapleader = " "
end

local set_vim_o = function()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = true,
    hidden = true,
    scrolloff = 3,
    softtabstop = 2,
    showmode = false,
    termguicolors = true
  }

  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  --vim.cmd('set term=xterm-256color')
  vim.cmd('set encoding=utf8')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set splitright')
  vim.cmd('set tabstop=2')
  vim.cmd('set updatetime=300')
end

local set_vim_wo = function()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local set_autocmd = function()
  vim.api.nvim_command("autocmd FileType python BracelessEnable +fold +highlight")
end

local function init()
  vim.g.python3_host_prog = "~/.virtualenvs/nvim/bin"
  set_lspaugroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
	set_autocmd()
end

return {
    init = init
}
