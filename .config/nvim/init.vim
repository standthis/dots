"                           _           
"     _ __   ___  _____   _(_)_ __ ___  
"    | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
"    | | | |  __/ (_) \ V /| | | | | | |
"    |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"                                       
"
" Supposed fix for coc.nvim docs
"set completeopt=noinsert,noselect,menuone
colo gruvbox
let mapleader = ","
"map <SPACE> <Nop>
"let mapleader = " "
nmap <SPACE> ,
" Run current script
nnoremap <leader>r :!%:p
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>; @:
nnoremap <leader>m :!make<CR>

" markdown file linewidth rule
au BufRead,BufNewFile *.md setlocal textwidth=80 spell spelllang=en_us complete+=kspell
au BufRead,BufNewFile *.tex setlocal spell spelllang=en_us complete+=kspell
autocmd BufNewFile,BufReadPost aliasrc setlocal filetype=sh


set expandtab shiftwidth=4 softtabstop=-1
set number relativenumber
set undofile
set splitright
"set ignorecase
"set smartcase

" last-position-jump
au BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif

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
    exe '!git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac'
    " call minpac#update()
  endfun
else
call minpac#init({'verbose': 3})
" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Additional plugins here.
"call minpac#add('junegunn/fzf', { 'do': 'yes n \| ./install' })
call minpac#add('junegunn/fzf.vim')
"call minpac#add('neoclide/coc.nvim', {'do': 'call coc#util#install()'})
"call minpac#add('fatih/vim-go')
"let g:fzf_command_prefix = 'Fz'

" minpac utility commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

endif
