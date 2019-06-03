"           _           
"    __   _(_)_ __ ___  
"    \ \ / / | '_ ` _ \ 
"     \ V /| | | | | | |
"      \_/ |_|_| |_| |_|
"                       

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

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Highlight line color
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Easy pane naviation 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Statusline and vertsplit highlight
hi statusline term=NONE cterm=NONE gui=NONE ctermfg=grey ctermbg=NONE guifg=darkblue guibg=white
hi statuslinenc term=NONE cterm=NONE gui=NONE ctermfg=grey ctermbg=NONE guifg=darkblue guibg=darkblue
hi VertSplit ctermfg=black ctermbg=NONE
" hi StatusLine ctermbg=white ctermfg=black 
" hi StatusLineNC ctermbg=white ctermfg=black

" Give :terminal Esc behavior
tnoremap <Esc> <C-\><C-n>
