"""""""""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"--------------------------------------
" Neomake
"--------------------------------------
Plug 'neomake/neomake'
let g:neomake_ctags_maker = {
    \ 'exe': 'ctags',
    \ 'args': ['.'],
    \ }
" autocmd BufWritePre,BufRead *.cpp :Neomake! ctags

"--------------------------------------
" TagBar
"--------------------------------------
" Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
let g:tagbar_width = 50
nmap tb :TagbarToggle<cr>

let g:tagbar_type_tex = {
            \ 'ctagstype' : 'latex',
            \ 'kinds'     : [
            \ 's:sections',
            \ 'g:graphics:1',
            \ 'l:labels:1',
            \ 'r:refs:1',
            \ 'p:pagerefs:1'
            \ ],
            \ 'sort'    : 0
            \ }

"--------------------------------------
" CtrlP
"--------------------------------------
" Fuzzy search file/buffer/tag...
Plug 'ctrlpvim/ctrlp.vim'
" Keybinding
let g:ctrlp_map = '<c-p>'
" Configs
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Ignore irrelevant files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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
map <C-n> :NERDTreeToggle<CR>

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

" to show glyphs
let g:airline_powerline_fonts = 1

"--------------------------------------
" vim-devicons for glyphs/icons
"--------------------------------------
Plug 'ryanoasis/vim-devicons'

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
" Customize format in .clang-format or _clang_format
let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>= :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>= :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>c <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"--------------------------------------
" Using yapf to format python code
"--------------------------------------
" requires sudo pip3 install yapf
autocmd FileType python nnoremap <leader>= :0,$!yapf<Cr>

"--------------------------------------
" jedi-vim for Python auto completion
"--------------------------------------
" requires sudo pip3 install jedi
Plug 'davidhalter/jedi-vim'

"--------------------------------------
" vimtex
"--------------------------------------
" modern vim plugin
Plug 'lervag/vimtex'

"--------------------------------------
" deoplete
"--------------------------------------
" Dark powered asynchronous completion framework
" Note: deoplete requires Neovim with Python3 enabled.
" If :echo has("python3") returns 1, then you're done.
" Otherwise, you may enable it by running: pip3 install neovim
" To invoke omni function: Ctrl+x Ctrl+o
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Enable at startup
let g:deoplete#enable_at_startup = 1
" Disable auto-complete
let g:deoplete#disable_auto_complete = 1
" Make sure the autocompletion will actually trigger using the omnifuncs
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" Alternatively, use Ctrl+l to manually complete
inoremap <silent><expr><C-l> deoplete#mappings#manual_complete()

autocmd CompleteDone * pclose " To close preview window of deoplete automagically

"--------------------------------------
" deoplete-clang
"--------------------------------------
Plug 'zchee/deoplete-clang'
if has('unix')
  let s:uname = system("uname")
  " Assume that llvm is installed via homebrew on MacOS
  " brew install llvm --with-clang
  if s:uname == "Darwin\n"
    let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang'
  endif
endif

"--------------------------------------
" neoinclude
"--------------------------------------
" Include completion framework for neocomplete/deoplete
Plug 'Shougo/neoinclude.vim'

"--------------------------------------
" ulti-snipts
"--------------------------------------
" Use <tab> to expand snipts
Plug 'SirVer/ultisnips'
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-u>"
" Set :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"--------------------------------------
" vim-orgmode
"--------------------------------------
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" Add plugins to &runtimepath
call plug#end()

"--------------------------------------
" vim-devicons
"--------------------------------------
" This plugin must be loaded lastly
" (vim-plug loads the plugins in the same order as they are registered)
" The terminal's font must be set as one of the nerd-fonts
Plug 'ryanoasis/vim-devicons'

" loading the plugin
let g:webdevicons_enable = 1

" necessary for showing glyphs
set encoding=utf8

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

"""""""""""""""""""""""""""""""""""""""
" Other configurations
"""""""""""""""""""""""""""""""""""""""
" Add my own tag file for packages
set tags+=$HOME/Dropbox/Sources/tags;

" Add my own snipptes
set runtimepath+=$HOME/.config/nvim/MySnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/MySnips']

" Filetype system
filetype plugin indent on

" Turn on omni completion
set omnifunc=syntaxcomplete#Complete

" Allow colors, if colors are still not displayed correctly,
" try export TERM=xterm-256color
set t_Co=256

" Turn off blink in normal mode
set gcr=n:blinkon0

" Line numbers
set relativenumber
set number

" Store more cmd history
set history=10000

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
set expandtab

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

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

"--------------------------------------
" Smooth scrolling
"--------------------------------------
set scrolloff=8
set nolazyredraw

"--------------------------------------
" Restore cursor position, window position, and last search after running a
" command.
"--------------------------------------
set ruler

function! Preserve(command)
  " Save the last search.
  let search = @/
  " Save the current cursor position.
  let cursor_position = getpos('.')
  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)
  " Execute the command.
  execute a:command
  " Restore the last search.
  let @/ = search
  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt
  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

"--------------------------------------
" Re-indent the whole buffer.
"--------------------------------------
function! Indent()
  call Preserve('normal gg=G')
endfunction
command -bar -nargs=0 -range=% Indent call Indent()
