" Plugins
call plug#begin("~/.config/nvim/plugged")

  " Plugin Section
  "colorschemes
  Plug 'joshdick/onedark.vim'
  "Fuzzy Search 
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  "Statusline
  Plug 'itchyny/lightline.vim'
  "intellisense and autocompletion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'w0rp/ale'
  Plug 'sheerun/vim-polyglot'
  " snippets
  Plug 'honza/vim-snippets'
  ""undoTree
  Plug 'mbbill/undotree'
  "css colors
  Plug 'ap/vim-css-color'
  "i3config colors
  Plug 'mboughaba/i3config.vim'
  "code commenting
  Plug 'preservim/nerdcommenter'
  "git from vim
  Plug 'tpope/vim-fugitive'
  "PLugin to autoclose brackets
  Plug 'jiangmiao/auto-pairs'
  "Plugin to wrap text
  Plug 'tpope/vim-surround'
  "Plugin for icons
  Plug 'ryanoasis/vim-devicons'
  "Plugin for startup screen
  Plug 'mhinz/vim-startify'
  "Plugins for latex
  Plug 'lervag/vimtex'
  "Rainbow colored brackets and csv
  Plug 'luochen1990/rainbow'
  "Grammar checker
  Plug 'rhysd/vim-grammarous'
  "Treesitter for better syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  "Shortcut helper
  "Plug 'folke/which-key.nvim'
call plug#end()

"" Neovim config
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file
set number relativenumber " set line number
set wrap " set no soft wrap
set linebreak " only break at words
set nolist " so softwrapping works
set tabstop=4 softtabstop=4 " set tab size
set shiftwidth=4 " affect amount of indentation
set expandtab " set that tab will insert softabstop amount of space characters
set nowritebackup " set to never save backup                                 
set noswapfile " set no swap file 
set nobackup " set no backup file
set breakindent " set every wrapped line will continue visually indented                    
set smartindent " set smart indentation
set ignorecase "set search to case insensitive
set smartcase " set to be case sensitive when there is capital letter, this needs set incsearch to work
set incsearch " for smartcase
set hidden " sp multiple buffers can be open
set updatetime=250 " update faster for autocompletion
set shortmess+=c " for CoC plugin
set noshowmode " set that vim mode is hidden, to incorporate for lightline plugin
set spellsuggest=fast,10
" set leader to space
let mapleader=" "

"" Keymaps
" use ; instead of :
nnoremap ; :
vnoremap ; :
" Map show undo tree
nnoremap <leader>u :UndotreeToggle<CR>
" Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" remove seach highlighting
map <leader>n :noh<CR>
" Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>ts :belowright 12split <bar> term<CR> 
" close panels
nnoremap <leader>x <C-w>c
" Line moving
" " Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Remap for yanking into clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
" " in visual mode
vnoremap <leader>y "+y
vnoremap <leader>p "+p
" make esc exit from the terminal in vim
tnoremap <Esc> <C-\><C-n>
" navigate quickfix
nnoremap <leader><leader>j :cn<CR>
nnoremap <leader><leader>k :cp<CR>
nnoremap <leader><leader>q :copen<CR>
nnoremap <leader><leader>l :.cc<CR>
" map spelling 
nnoremap <F8>  :setlocal spell spelllang=de,en <return>
nnoremap <F9>  :set nospell <return>
" ctrl l to correct the last spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" jk to esc
"inoremap jk <Esc>
"inoremap jj <Esc>
"inoremap kj <Esc>
"" Autocommands
" make F5 run current buffer
autocmd Filetype c,cpp  inoremap <buffer> <F5> <C-o>:update<Bar>execute '!make '.shellescape(expand('%:r'), 1)<CR>
autocmd Filetype python inoremap <buffer> <F5> <C-o>:update<Bar>execute '!python3 '.shellescape(@%, 1)<CR>
autocmd Filetype java   inoremap <buffer> <F5> <C-o>:update<Bar>execute '!javac '.shellescape(@%, 1)<CR>
autocmd Filetype ruby   inoremap <buffer> <F5> <C-o>:update<Bar>execute '!ruby '.shellescape(@%, 1)<CR>
" save the folds in a file and open them when file is opened
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"" Theme settings
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
let g:onedark_hide_endofbuffer = 1
colorscheme onedark
autocmd ColorScheme * highlight CocHighlightText     ctermfg=LightMagenta    guifg=LightMagenta

" RainbowBrackets config
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#ABB2BF','#E5C07B', '#61AFEF', '#C678DD', '#56B6C2'],
\	'ctermfgs': ['cyan', 'lightred', 'lightyellow', 'blue'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\	}
\}
" Latex Plugins config
nnoremap <leader>tt :VimtexCompile<CR>
nnoremap <leader>tv :VimtexView<CR>
nnoremap <leader>tc :VimtexTocToggle<CR>
nnoremap <leader>te :VimtexErrors<CR>
let g:vimtex_toc_config = {'layer_status': {'label':0, 'include':0}, 'show_help':0}
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
autocmd Filetype tex setl spell spelllang=de,en
autocmd Filetype tex setl updatetime=250
" CocExplorer config
noremap <silent> <C-b> :CocCommand explorer<CR>
"Fuzzy search config
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" Lightline
let g:lightline = {
  \     'colorscheme': 'onedark',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
  \         'right': [['cocstatus'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
    \   'gitbranch': 'FugitiveHead'
	\ },
  \ }
"CoC and ALE config
" ALE (Asynchronous Lint Engine)
let g:ale_fixers = {
      \ 'javascript': ['prettier','eslint'],
      \ 'tex': ['latexindent'],
      \ }
let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" COC
" " COC extension
let g:coc_user_config = {}
let g:coc_global_extensions = [
      \ 'coc-clangd', 
      \ 'coc-css', 
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-html', 
      \ 'coc-java', 
      \ 'coc-json', 
      \ 'coc-prettier', 
      \ 'coc-python',
      \ 'coc-snippets', 
      \ 'coc-solargraph',
      \ 'coc-tabnine',
      \ 'coc-tsserver', 
      \ 'coc-vimtex', 
      \ 'coc-sh', 
      \ 'coc-word']
" " To go back to previous state use Ctrl+O
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)

" " remap tab to go thorough autocompletion menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh() 

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" " Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Startify setup
let g:startify_bookmarks = [{'c': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'}, {'i': '~/.i3/config'}]
"" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}
EOF
"" Whichkey
set timeoutlen=500
"lua << EOF
  "require("which-key").setup {
    "-- your configuration comes here TODO
  "}
"EOF
