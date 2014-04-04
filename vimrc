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


fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


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

set foldmethod=syntax


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



" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"


