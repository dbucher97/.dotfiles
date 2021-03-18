" Vimrc for Mac setup
set nocompatible
" === Plugins === 

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'benmills/vimux'
Plug 'jiangmiao/auto-pairs'
Plug 'farmergreg/vim-lastplace'
Plug 'alpertuna/vim-header'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'melonmanchan/vim-tmux-resizer'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'ddrscott/vim-side-search'

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim' 
" Languages
Plug 'dart-lang/dart-vim-plugin'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'derekwyatt/vim-fswitch'

" Plug 'lervag/vimtex'

" Plug 'sheerun/vim-polyglot'

call plug#end()

" === Settings ===
" --- Colorschemes ---
set termguicolors
syntax enable
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox
" let g:palenight_terminal_italics=1
hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
" hi CursorLineNr guibg=none ctermbg=none
hi Comment cterm=italic gui=italic

" " --- Leader Key ---
let mapleader = ' '
let maplocalleader = ' '
" 
" " --- General ---
filetype plugin indent on

set ts=2                    " tabs space equals 2 spaces
set softtabstop=2           " tabs space equals 2 spaces
set sw=2                    " shift width for whift commands (>).
set expandtab               " use spaces instead of tabs.
set nu rnu                  " display numbers using relative numbering.
set scrolloff=5             " always keep 5 lines above and below cursor.
set ignorecase              " ignores the case when searching.
set diffopt=filler,vertical " display diffs in vertical split and use filler lines.
set list                    " display list chars.
set listchars+=tab:>\       " display vertical lines in indentaions.
set listchars+=trail:•      " mark trailing whitespaces.
set hidden                  " allow buffer to be hidden without save.
set showmatch               " show matching brackets.
set textwidth=79            " max text width.
set colorcolumn=80          " display colorcolumn
set nojoinspaces            " don't autoinsert two spaces when joining lines with '.'
set formatoptions+=j        " remove comment character when joining lines.
set formatoptions+=n        " indent numbered lists.
set foldmethod=indent       " using indent fold method.
set foldlevelstart=99       " always unfold everythong on open.
let &showbreak='↳ '         " display this char when breaking a line.
set breakindent             " indent wrapped lines.
set breakindentopt=sbr      " use the arrow.
set mouse=a                 " enable mouse support
set scl=yes:1               " always show sign column on left
set splitbelow
set splitright

" set t_ZH=3m
" set t_ZR=23m

" --- Help --- "
command -nargs=* -complete=help Help vertical belowright help <args> 
" --- Plugins ---
" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1
nnoremap <leader>p :CtrlPClearCache<CR>

" indentLines
let g:indentLine_char = '▏'

" nerdcommenter
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
    \ 'dosini': { 'left': '#'}
\ }

" GitGutter
let g:gitgutter_sign_added = "▎"
let g:gitgutter_sign_removed = "▎"
let g:gitgutter_sign_modified = "▎"
let g:gitgutter_sign_modified_removed = "▎"
highlight GitGutterAdd    guifg=#B8BB26 guibg=none ctermfg=2 ctermbg=none
highlight GitGutterChange guifg=#83A598 guibg=none ctermfg=3 ctermbg=none
highlight GitGutterDelete guifg=#FB4934 guibg=none ctermfg=1 ctermbg=none
highlight GitGutterChangeDelete guifg=#D3869B guibg=none ctermfg=1 ctermbg=none

" Airline
" let g:airline#extensions#tabline#enabled = 1

" Matlab Filetype
au! BufRead,BufNewFile *.m set ft=matlab

" Perform Flutter Hot Reload
au! BufWritePost *.dart silent !pkill -SIGUSR1 -F ~/.local/share/flutter.pid

" Vimux
let g:VimuxHeight = "20"
let g:VimuxOrientation = "v"

" VimTeX
let g:tex_flavor = "latex"
let g:vimtex_view_method = "skim"

" AutoPairs
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutJump= '<C-c>'

" Coc.nvim
if has_key(plugs, "coc.nvim")
set hidden
set nobackup
set nowritebackup

set updatetime=300
set shortmess+=c
set pb=20
set ph=10

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

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

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
endif

" Clang-format
let g:clang_format#command = '/usr/local/opt/llvm/bin/clang-format'
let g:clang_format#auto_format = 1

" Vim Header
let g:header_auto_add_header = 0
let g:header_field_author = 'David Bucher'
let g:header_field_author_email = 'David.Bucher@physik.lmu.de'
let g:header_field_copyright = 'David Bucher'

"=== MAPPINGS ===
" --- git ---
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gl :GV<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gvc :GV!<CR>
nnoremap <leader>gvq :GV?<CR>
nnoremap <leader>gw :Gwrite<CR>

" --- buffer ---
nnoremap <silent> <Leader><Tab> :e#<CR>
nnoremap <silent> <Leader>bp :bp<CR>
nnoremap <silent> <Leader>bn :bn<CR>

" --- better split navigation ---
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>wh <C-w>s<C-w>j

" --- clear search results ---
nnoremap <leader>n :noh<cr>

" --- easy-align ---
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

" --- NERDTree ---
nnoremap <silent> <tab> :NERDTreeToggle<CR>

" --- spell checking ---
noremap <Leader>tse :set spell! spelllang=en<CR>:echo 'Toggled en spell check'<CR>
noremap <Leader>tsd :set spell! spelllang=de<CR>:echo 'Toggled de spell check'<CR>

" --- Terminal mode ---
tnoremap <Esc> <C-\><C-n>

" --- Run Scripts ---

augroup scriptbindings
  autocmd! scriptbindings
  au BufNewFile,BufRead *.py,*.sh nnoremap <silent> <leader>r :call VimuxRunCommand("run-script " . bufname("%"))<CR>
augroup end

augroup cppbindings
  autocmd! cppbindings
  au BufNewFile,BufRead *.cpp,*.hpp nnoremap <silent> <leader>r :call VimuxRunCommand("compile")<CR>
  au BufNewFile,BufRead *.cpp,*.hpp nnoremap <silent> <leader>R :call VimuxRunCommand("compile -c")<CR>
  au BufNewFile,BufRead *.cpp nnoremap <silent> <leader>c :FSRight<CR>
  au BufNewFile,BufRead *.hpp nnoremap <silent> <leader>c :FSLeft<CR>
augroup end

if has_key(plugs, "coc.nvim")
augroup latexbindings
  autocmd! latexbindings
  au BufNewFile,BufRead *.tex,*.sty nnoremap <silent> <leader>r :CocCommand latex.Build<CR>
  au BufNewFile,BufRead *.tex,*.sty nnoremap <silent> <leader>v :CocCommand latex.ForwardSearch<CR>
augroup end
endif

" augroup cppbindings
"   autocmd! cppbindings
"   au BufNewFile,BufRead *.ini nnoremap <silent> <leader>r :call VimuxRunCommand("run_mlgen -f -p show ". bufname("%"))<CR>
" augroup end

" nnoremap <silent> <leader>r :call VimuxRunCommand("clear; ./" . bufname("%"))<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vs :VimuxInterruptRunner<CR>
