call pathogen#infect()
syntax on
set ruler
set nocompatible
set nobackup
set noswapfile
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set splitbelow
set splitright

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

colorscheme default

if has("gui_running")
    if has("gui_win32")
        set guifont=Lucida\ Console:h12
        colorscheme slate
    elseif has("gui_macvim")
        set guifont="Monaco\ 14"
        colorscheme slate
    else
        set guifont=Consolas\ 14
        colorscheme slate
    endif
endif

let g:flake8_max_line_length=100

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'

" This makes airline appear
set laststatus=2
" Since we have airline, this is redundant
set noshowmode
" Use simple Airline theme
let g:airline_theme='simple'

let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_typescript_tsc_fname = ''
