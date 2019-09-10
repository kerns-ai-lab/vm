set nocompatible
filetype off

set exrc
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim.git'
Plugin 'rking/ag.vim.git'
Plugin 'moll/vim-node.git'
"Plugin 'ajh17/VimCompletesMe.git'
"Plugin 'Valloric/YouCompleteMe.git'
Plugin 'lyuts/vim-rtags'
Plugin 'leafgarland/typescript-vim'
Plugin 'romainl/Apprentice'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-titlecase'
Plugin 'christoomey/vim-sort-motion'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" 256 color terminal
set t_Co=256
" Set colorscheme
colorscheme apprentice

" Set of basic vim options
set tabstop=4       " How many spaces per tab
set shiftwidth=4    " How many spaces to autoindent newlines
set expandtab       " Replace tabs with spaces automatically 
set nu              " Enable line numbers
set nowrap          " Disable wordwrap
set colorcolumn=80  " Draws a vertical line at 80 chars
set autochdir " sets cwd to file in view. This allows better omni complete
autocmd BufWritePre * %s/\s\+$//e

" You Complete Me
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Let definitions
let mapleader= " "
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ag_working_path_mode="r"

" ag items.  I need the silent ag.
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut "
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" For simple sizing of splits.
map - <C-W>-
map + <C-W>+

" Remaps.  This is where the magic of vim happens
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nmap <leader>pf :CtrlP<CR>
nmap <leader>ps :Ag<SPACE>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nmap <leader><leader> V
vmap <Leader>y "+y
vmap <Leader>= <C-W><C-=>

" Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags