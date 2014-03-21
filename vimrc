set completeopt=menuone,longest

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=lightgray

let g:jedi#show_call_signatures = "0"

" let g:solarized_contrast = "high"
let g:pymode_rope=0

" execute pathogen#infect()

" let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_async=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_balloons=1
let g:syntastic_ignore_files=['^/usr/lib/']
" let g:syntastic_mode_map={ 'mode': 'active',
                         \ 'active_filetypes': [],
                         \ 'passive_filetypes': [] }
" use own config file:
" let g:syntastic_python_pylint_args = '--msg-template="{path}:{line}: [{msg_id}] {msg}" -r n --rcfile=~/.pylintrc'

" rebind f1 calls :SyntasticCheck.
" let g:syntastic_python_checkers = ['pylint']
" :map <special> <F1> :SyntasticCheck<CR>
" somehow make it work from insert mode too
" :imap <special> <F1> <Escape>:SyntasticCheck<CR>

let g:voom_default_mode='python'


" automatically remove trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" always yank to system clipboard as well
set clipboard=unnamed
set go+=a
set mouse=a

" not vi compatible, things like filetype work then
set nocompatible
set number
set wrap

" set cindent
" set autoindent
" disable all the annoying bells and whistles
set noerrorbells visualbell t_vb=

syntax enable
set ls=2 " continuously show file name
set formatoptions+=o " continue comment marker in new lines
set scrolloff=3 " context lines around cursor
set tabstop=1
set shiftwidth=2
set expandtab
set incsearch
set ignorecase
set softtabstop=1
set textwidth=80
set wrapmargin=80
set nohls
set shortmess=Ta
" filetype indent on
set background=dark
colorscheme solarized


set showmatch

" keymap timeouts
set ttimeoutlen=200
set timeoutlen=2000

:command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
:command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"


" fold doxygen comments
" syntax region DoxComment start="\/\*\!|\/\*\*" end="\*\*\/" transparent fold
set foldmethod=marker
" highlight Folded term=None ctermfg=1 ctermbg=NONE
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

nnoremap <C-o> :pop <Enter>


" cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

    cnoreabbrev <expr> csa
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
    cnoreabbrev <expr> csf
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
    cnoreabbrev <expr> csk
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
    cnoreabbrev <expr> csr
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
    cnoreabbrev <expr> css
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
    cnoreabbrev <expr> csh
          \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')


  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif


" load cscope.out db on startup
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocsverb " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set csverb   " switch back to verbose mode
    endif
endfunction
au BufEnter /* call LoadCscope()

:vmenu PopUp.Comments.Add :s/^/\/\//<CR>
:vmenu PopUp.Comments.Remove :s/^..//<CR>

":set fdm=expr
":set fde=getline(v:lnum)=~'^\\s\/'?1:getline(prevnonblank(v:lnum))=~'^\\s\/'?1:getline(nextnonblank(v:lnum))=~'^\\s*\/'?1:0

" everything that's yanked goes to clipboard
:set go+=a

" in insert mode, press F12 to paste without
" ugly indentation "
set pastetoggle=<F12>

" source /home/alice/.vim/autotag.vim

inoremap <F3> <C-O>za
nnoremap <F3> za
onoremap <F3> <C-C>za
vnoremap <F3> zf

inoremap <F4> <C-O>zA
nnoremap <F4> zA
onoremap <F4> <C-C>zA
vnoremap <F4> zF

:filetype plugin indent on

" map leader for c file support
" let g:C_MapLeader  = ','

set backupdir=~/.vim/tmp
execute "set directory=". &backupdir
silent execute '!mkdir -p '. &backupdir

" :command! -nargs=+ Calc :py print <args>
" :py from math import *

:map align Align


" set cmdheight=2
:command! -nargs=1 Here :silent !here <args>
:cabbrev here <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Here' : 'here')<CR>


" be consistent (go to EOL) with capitalized C and D commands
nnoremap Y y$

" xlcip usage
":map <F3> "*y
":map <F4> "*p
":map <F5> "*d

" take care of switching comment signs
"autocmd filetype matlab inoremap // %
"inoremap /// /* */

set nofoldenable

" insert mode to command mode
 " imap ii <Esc>:

" normal mode to cmd mode
nnoremap ff :
"" command mode to normal mode
"cnoremap ff  <BS> <Esc> <Esc>

" delete and insert on line above
" nnoremap ddi dd <Esc> O

" search and replace for entire file
" with sr --> :%s/arg1/arg2/g
" with src --> :%s/arg1/arg2/gc
" nnoremap sr

"    :com is -nargs=1 i <args1> Esc

" treat wrapped lines like real lines
nnoremap <Up> gk
nnoremap <Down> gj

" reload file
noremap <F7> :edit!<CR>
noremap <F10> :wq<CR>
:noremap <F3> :set hls!<CR>
:noremap <F4> :set number!<CR>

" expand braces
":inoremap {      {}<Left>
":inoremap {<CR>  {<CR>}<Esc>O
":inoremap {{     {
":inoremap {}     {}
":inoremap [     []<Left>
":inoremap (     ()<Left>
":inoremap \"     \"\"<Left>
":inoremap '     ''<Left>

" if file extension = c, then expand Enter
" without any open brackets before into ;<enter>
" :inoremap <CR> ;<CR>

" fix annoying typos
:com W :w
:com Q :q
:com Wq :wq
" match Todo /\s\+$/ "

" shift enter for inserting newlines in command mode
:noremap <S-CR> o<Esc> get to work
:noremap <CR> i<CR><Esc>

:map <Space> i<Space><Esc>l
:map <BS> hx<Esc>


" UNUSED
"
" Doxygen-support
" let g:Doxy_FormatDate = '%B %d, %Y'
" let g:Doxy_ExCommandLeader = 'Dox'
" :map Dox dox

" Doxygen stuff "
" somehow get this to add the date "
" let g:date = strftime("%Y-%m-%d")
" exec "normal o".s:interCommentTag.g:DoxygenToolkit_dateTag.l:date

"let g:DoxygenToolkit_paramTitle = Parameters:
"let g:DoxygenToolkit_compactOneLineDoc = "no"
"let g:DoxygenToolkit_returnTag = "\\return "
"let g:DoxygenToolkit_remarkTag = "\\remarks         "
"let g:DoxygenToolkit_briefTag_enumName = "yes"
"let g:DoxygenToolkit_briefTag_structName = "yes"
"let g:DoxygenToolkit_dateTag = "\\date            "
"let g:DoxygenToolkit_authorTag = "\\author          "
"let g:DoxygenToolkit_paramTag_pre = "\\param[]         "
"let g:DoxygenToolkit_briefTag_pre = "\\note            "
"let g:DoxygenToolkit_blockHeader = "!*************************************************************************"
"let g:DoxygenToolkit_blockFooter = "**************************************************************************"
"let g:DoxygenToolkit_authorName="Alice Ellmer"



