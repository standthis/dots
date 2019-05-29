set number relativenumber
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" last-position-jump
au BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif

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

let mapleader = ","

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
"let g:fzf_command_prefix = 'Fz'

" minpac utility commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

endif

