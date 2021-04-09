if exists('g:vscode')
  echo 'VSCODE YA!'
else
  call plug#begin('~/.config/nvim/autoload')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'ghifarit53/tokyonight-vim'  
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/telescope.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'voldikss/vim-floaterm'
  Plug 'takac/vim-hardtime'
  Plug 'ntk148v/vim-horizon'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug' ]}
  call plug#end()
  
  let mapleader = " "
  set hidden
  set nobackup
  set nowritebackup
  set cmdheight=2
  set shortmess+=c
  set smartindent
  set smarttab
  set splitright
  set shiftwidth=2
  set laststatus=2
  set noerrorbells tabstop=4 softtabstop=4
  set nowrap
  set smartcase
  set expandtab
  set number relativenumber
  set noshowmode
  set termguicolors
  set encoding=utf-8
  set updatetime=300


  let g:tokyonight_style = 'night'
  let g:tokyonight_enable_italic = 0
  silent! colorscheme tokyonight
 
  "'' Lightline ''"
  if filereadable(expand("~/.config/nvim/autoload/lightline.vim/plugin/lightline.vim"))
   let g:lightline = { 'colorscheme': 'tokyonight'}
  endif

  autocmd FileType json syntax match Comment +\/\/.\+$+
  
  augroup numbertoggle
    silent autocmd!
    silent autocmd BufEnter,FocusGained,InsertLeave
    silent autocmd BufLeave,FocusLost,InsertEnter
  augroup END

  "'' Floaterm ''"
  if filereadable(expand("~/.config/nvim/autoload/vim-floaterm/plugin/floaterm.vim"))
    nnoremap <leader>fr :FloatermNew ranger<CR>
    nnoremap <leader>ft :FloatermNew --wintype=floating --autoclose=2<CR>
  endif
  
  "'' FZF ''"
  if filereadable(expand("~/.config/nvim/autoload/fzf.vim/plugin/fzf.vim"))
   let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/node_modules/**,.git/*,**/*.pem}"'
   let $FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

   nnoremap <leader>ff :Files<CR>
   nnoremap <leader>fg :Rg<CR>
  endif

  "'' COC ''"
  if filereadable(expand("~/.config/nvim/plugged/coc.nvim/plugin/coc.vim"))
    let g:coc_global_extensions=[
      \'coc-groovy',
      \'coc-angular',
      \'coc-floaterm',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-sh',
      \'coc-tsserver',
      \]   
 endif


  inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif
  
  " Symbol renaming
  nmap <leader>rn <Plug>(coc-rename)
  
  " Formatting selected code.
  xmap <leader>f <Plug>(coc-format-selected)
  nmap <leader>f <Plug>(coc-format-selected)

  " Remaps
  inoremap jk <esc>
  nnoremap <leader>h :wincmd h<CR>
  nnoremap <leader>j :wincmd j<CR>
  nnoremap <leader>k :wincmd k<CR>
  nnoremap <leader>l :wincmd l<CR>
  nnoremap <leader>nhl :nohl<CR>
  nnoremap <leader>qns :qa!<CR>
  nnoremap <leader>lll <C-w>v<CR>
  "quick reload
  nnoremap <leader>rl :source %<CR>
  
  map Q <Nop>
endif
