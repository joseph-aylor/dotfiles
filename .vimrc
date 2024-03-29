call pathogen#infect()
syntax on
set ruler
set nocompatible
set nobackup
set noswapfile
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set number
set guifont=Lucida_Console:h12
set autoindent
set visualbell
imap qq <ESC>
vmap qq <ESC>
imap <S-Tab> <Esc><<a
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-W>l
nmap <C-o> 090la<Enter><Esc>

" Per filetype tabs
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype typescript setlocal ts=4 sw=4 sts=4 expandtab

" These rely on FZF.vim
map <C-p> :FZF<Enter>
map <C-b> :Buffers<Enter>

set splitbelow
set splitright
set fdm=indent
set foldlevelstart=20
let g:vimwiki_folding='list'
filetype plugin on

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1

set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colorscheme slate

if has("gui_running")
    if has("gui_win32")
        set guifont=Lucida\ Console:h12
    elseif has("gui_macvim")
        set guifont="Monaco\ 14"
    else
        set guifont=Consolas\ 14
    endif
endif

let g:zipPlugin_ext = '*.gqsx'

" This makes airline appear
set laststatus=2
" Since we have airline, this is redundant
set noshowmode
" Use simple Airline theme
" let g:airline_theme='simple'

" Use solarized Airline theme
let g:airline_theme='solarized'

" Syntastic Checkers
" Be sure to install them using package managers (npm, gem)
" Sqlint is a gem BTW
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_eruby_checkers = ['ruby', 'rubocop']
let g:syntastic_coffeescript_checkers = ['coffee', 'coffelint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_sass_checkers = ['sass', 'sass_lint']
let g:syntastic_scss_checkers = ['sass', 'sass_lint']
let g:syntastic_sql_checkers = ['sqlint']
let g:syntastic_python_checkers = ['pycodestyle', 'python', 'flake8', 'pylint']
let g:syntastic_python_flake8_post_args = "--max-line-length=160"
let g:syntastic_python_pycodestyle_post_args = "--max-line-length=160"
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:flake8_max_line_length=100
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'npx eslint'
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Open NERDTree on open
" au VimEnter * NERDTree
" au VimEnter * wincmd p

" Allow for BIG projects
let g:ctrlp_max_files=0

" If ag is available, use that
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" TODO make a conditional for this
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_fixers = ['black', 'prettier', 'eslint', 'tslint']
let g:ale_fix_on_save = 1
