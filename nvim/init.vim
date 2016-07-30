"""""""""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"--------------------------------------
" vim-easy-align
"--------------------------------------
" Align stuff. Usage: gaip= (align paragraph w.r.t "=")
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"--------------------------------------
" vim-fugitive
"--------------------------------------
" Git wrapper.
Plug 'tpope/vim-fugitive'

"--------------------------------------
" nerd-tree, load on toggle
"--------------------------------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"--------------------------------------
" taglist
"--------------------------------------
Plug 'xywei/taglist'

"--------------------------------------
" vim-airline
"--------------------------------------
" status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"--------------------------------------
" vim-operator-user
"--------------------------------------
" define operators easily
Plug 'kana/vim-operator-user'

"--------------------------------------
" vim-clang-format
"--------------------------------------
" c++ formatter using clang-format
Plug 'rhysd/vim-clang-format'
" Customize format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""
" Other configurations
"""""""""""""""""""""""""""""""""""""""
" Add my own tag file for packages
set tags+=$HOME/Dropbox/Sources/tags;

" Allow colors, if colors are still not displayed correctly,
" try export TERM=xterm-256color
set t_Co=256

" Turn off blink in normal mode
set gcr=n:blinkon0

" Line numbers
set number

" Store more cmd history
set history=10000

" No sounds
set visualbell

" Reload files changed outside vim
set autoread

" Turn off swap files (often troubsome,
" for example, when in shared folders)
set noswapfile

" Display all sorts of symbols that are easy to be messed up
set list listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" Wrap lines at convenient points
set wrap
set linebreak

" Indentation
set shiftwidth=2
set softtabstop=2

"--------------------------------------
" TrimSpaces
" get rid of trailing spaces
"--------------------------------------
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

"--------------------------------------
" Highlight cursor
"--------------------------------------
" Ctr+K for searching cursor by highlighting
" current word
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
function FindCursor()
  if !exists("s:highlightcursor")
    let s:highlightcursor=1
    set cursorline
    set cursorcolumn
  else
    unlet s:highlightcursor
    set nocursorline
    set nocursorcolumn
  endif
endfunction
nnoremap <C-K> :call FindCursor()<CR>
