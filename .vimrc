"Set cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
"easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"more normal split behaviour
set splitbelow
set splitright
"use ; instead of :
nnoremap ; :
vnoremap ; :

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType tex nnoremap <buffer> <F10> :!latexindent -w '%:p' <return> <return>

syn on
set linebreak
set ruler
set tabstop=4
set expandtab
set showmatch
set number relativenumber
set autoindent
set clipboard=unnamed
set incsearch
set ignorecase
set smartcase
map <F8>  :setlocal spell spelllang=de,en <return>
map <F9>  :set nospell <return>
"persisitent unods
set undofile
set undodir=~/.vim/undodir

set nocompatible
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'

"" Add plugins here
"" Track the engine.
"Plugin 'SirVer/ultisnips'

"" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<s-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"Plugin 'LaTeX-Box-Team/LaTeX-Box'
""continous compiling
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_quickfix=2
"Plugin 'preservim/nerdtree'
"Plugin 'miyakogi/conoline.vim'
"Plugin 'mboughaba/i3config.vim'
"Plugin 'arcticicestudio/nord-vim'
"call vundle#end()

"filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete
""nerdtree mapping
"map <C-n> :NERDTreeToggle<CR>
""nerdtree LineNumbers
"let NERDTreeShowLineNumbers=1
""-----------------------------------------------------------------------
""Statusline
""colors
"hi Base guibg=#212333 guifg=#212333
"hi Mode guibg=#82aaff guifg=#181824 gui=bold
"hi Filetype guibg=#292d3e guifg=#929dcb
"hi LineCol guibg=#82aaff guifg=#181824 gui=bold

""set Nord Theme
"augroup nord-overrides
  "autocmd!
  "autocmd ColorScheme nord highlight Comment ctermfg=14
  "autocmd ColorScheme nord highlight Visual cterm=bold ctermbg=8 ctermfg=none
"augroup END
"colorscheme nord
"mode getter
  let g:currentmode={
      \'n' : 'Normal ',
      \'no' : 'N·Operator Pending ',
      \'v' : 'Visual ',
      \'V' : 'V·Line ',
      \'^V' : 'V·Block ',
      \'s' : 'Select ',
      \'S': 'S·Line ',
      \'^S' : 'S·Block ',
      \'i' : 'Insert ',
      \'R' : 'Replace ',
      \'Rv' : 'V·Replace ',
      \'c' : 'Command ',
      \'cv' : 'Vim Ex ',
      \'ce' : 'Ex ',
      \'r' : 'Prompt ',
      \'rm' : 'More ',
      \'r?' : 'Confirm ',
      \'!' : 'Shell ',
      \'t' : 'Terminal '
      \}

" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    hi Modi guifg=#efefef guibg=#212333 gui=bold
    hi Filename guifg=#efefef guibg=#212333
    return expand('%:t').'*'
  else
    hi Modi guifg=#929dcb guibg=#212333
    hi Filename guifg=#929dcb guibg=#212333
    return expand('%:t')
  endif
endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction



" We'll use this for the active statusline
function! ActiveLine()
  let statusline = ""
  let statusline .= "%#Base#"

  " Current mode
  let statusline .= "%#Mode# %{ModeCurrent()}"

  " Make the colour highlight normal
  let statusline .= "%#Base#"
  let statusline .= "%="
  
  " Current modified status and filename
  let statusline .= "%#Modi# %{CheckMod(&modified)} "
  
  " Current filetype
  let statusline .= "%#Filetype# %{CheckFT(&filetype)} "
  
  " Current line and column
  let statusline .= "%#LineCol# Ln %l, Col %c "

  return statusline
endfunction

" We'll use this for the inactive statusline
function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""
  let statusline .= "%#Base#"

  " Full path of the file
  let statusline .= "%#LineCol# %F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END

set laststatus=2
set noshowmode
