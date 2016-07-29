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
