"           _           
"    __   _(_)_ __ ___  
"    \ \ / / | '_ ` _ \ 
"     \ V /| | | | | | |
"      \_/ |_|_| |_| |_|
"                       
colo gruvbox

set bg=dark
let mapleader = ","

"map <SPACE> <Nop>
"let mapleader = " "
nmap <SPACE> ,
" Run current script
noremap <C-q> :confirm qall<CR>
nnoremap <leader>x :!chmod +x %:p<CR>
nnoremap <leader>s :!%:p<CR>
nnoremap <leader>r :!rake<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>; @:
nnoremap <leader>m :!make<CR>
nnoremap <leader>g :!git add -u && git commit -m "lit update" && git push origin master<CR>
nnoremap <leader>e :!go run %:p<CR>
nnoremap <leader>R :Rg<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>/ :!mpc<CR>

" markdown file linewidth rule
augroup filetype_settings
  " Clear this autocmd group so that the settings won't get loaded over and
  " over again
  autocmd!

  au BufRead,BufNewFile *.md setlocal textwidth=80 spell spelllang=en_us complete+=kspell
  au BufRead,BufNewFile *.tex setlocal spell spelllang=en_us complete+=kspell 
  autocmd BufNewFile,BufReadPost aliasrc setlocal filetype=sh
  autocmd FileType make setlocal noexpandtab

augroup END

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
set clipboard=unnamed
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set undofile
set splitright
set number relativenumber
set incsearch
set ignorecase
set smartcase
set cursorcolumn
set cursorline
set pastetoggle=<F2>
set shortmess=I
"set shellcmdflag=-ic "breaks vim

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Easy pane naviation 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Give :terminal Esc behavior
tnoremap <Esc> <C-\><C-n>

" minpac
packadd minpac
let s:plugins = exists('*minpac#init')
if !s:plugins "{{{
  fun! InstallPlug() " Bootstrap plugin manager on new systems.
    exe '!git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
    " call minpac#update()
  endfun
else
call minpac#init({'verbose': 3})
" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Additional plugins here.
"call minpac#add('junegunn/fzf', { 'do': 'yes n \| ./install' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
"call minpac#add('michaeljsmith/vim-indent-object')
"call minpac#add('easymotion/vim-easymotion')

"call minpac#add('neoclide/coc.nvim', { 'rev': '*', 'do': { -> pack#coc_install() } })
"call minpac#add('fatih/vim-go')
"let g:fzf_command_prefix = 'Fz'

" minpac utility commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

endif
