"Very good vimrc example

"set t_Co=65535
"set t_Co=256
syntax on
"colorscheme default
"set background=dark
"colorscheme darkblue
filetype indent on
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set numberwidth=5
set nowrap
set backspace=2
set cursorline
highlight CursorLine   cterm=none ctermbg=lightgray
"highlight Comment ctermfg=246
"highlight Normal ctermfg=255 ctermbg=Black
set tags=./tags,tags

"if has("gui_running")
"	set columns=150
"	set lines=40
"	set guifont=Monaco\ 13
"	let &guicursor = &guicursor . ",a:blinkon0"
"	colorscheme koehler
"    set guioptions-=m  "remove menu bar
"    set guioptions-=T  "remove toolbar
"endif

set wildmode=list:longest,full
set showmode
set showcmd
set shortmess+=r
filetype on
autocmd FileType make set noexpandtab shiftwidth=8 tabstop=8
autocmd FileType java set expandtab shiftwidth=2 tabstop=2
autocmd FileType xml set expandtab shiftwidth=2 tabstop=2
autocmd FileType xslt set expandtab shiftwidth=2 tabstop=2
autocmd FileType xsd set expandtab shiftwidth=2 tabstop=2
autocmd FileType html set expandtab shiftwidth=2 tabstop=2
autocmd FileType htmldjango set expandtab shiftwidth=2 tabstop=2
autocmd FileType css set expandtab shiftwidth=4 tabstop=4
autocmd FileType javascript set expandtab shiftwidth=4 tabstop=4
autocmd FileType python set shiftwidth=4 tabstop=4
set incsearch
set smartcase
nnoremap <C-P> :!python %<CR>
set matchpairs+=<:>
set showmatch sm
set showtabline=2
set ruler
set scrolljump=1
set scrolloff=3
set nohlsearch
set rulerformat=%30([POS=%04v][LINE=%l/%L]%)
set ignorecase
let c_space_errors=1

map <Esc><Esc> :q<Enter>
imap {<CR> {<CR>}<Esc>O

map <F2> :set paste!<CR>
imap <F2> <Esc>:set paste!<CR>a

"map <F3> <C-w><C-w>
"imap <F3> <Esc><C-w><C-w>

map <F4> :tabnew<CR>:NERDTreeToggle<CR>
imap <F4> <Esc>:tabnew<CR>:NERDTreeToggle<CR>

map <F3> :set number!<CR>
imap <F3> <Esc>:set number!<CR>a

map <F5> :tabnew<CR>:
imap <F5> <Esc>:tabnew<CR>:
"map <C-t> :tabnew<CR>:
"imap <C-t> <Esc>:tabnew<CR>:

imap <C-f> <C-x><C-f>

"inoremap <A-.> <Esc>gt

"noremap <A-,> gT
"inoremap <A-,> <Esc>gT

map <F6> <C-w>s<F3>
imap <F6> <Esc><C-w>s<F3>

map <F7> :tabprev<CR>
imap <F7> <Esc>:tabprev<CR>a

map <F8> :tabnext<CR>
imap <F8> <Esc>:tabnext<CR>a

map <F10> <Esc>:wq<CR>
imap <F10> <Esc>:wq<CR>

map <F12> <Esc>:q!<CR>
imap <F12> <Esc>:q!<CR>

map <C-D> dd<Esc>
imap <C-D> <Esc>dd<Esc>a
vmap <C-D> d<Esc>

map <C-h> :set hlsearch!<CR>
map cn :cn<CR>
map cc :cc<CR>
map cp :cp<CR>

map <Tab> <C-w><C-w>

highlight TabLine cterm=bold ctermbg=251 ctermfg=Black
highlight TabLineFill ctermfg=251
highlight TabLineSel cterm=bold ctermbg=251 ctermfg=Blue

map <F9> <ESC>:NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>

"set nocp
"filetype plugin on
"let OmniCpp_NamespaceSearch = 2
imap <C-@> <C-X><C-O>


 " Highlight bad whitespace: before tabs, at the end, after first
 " non-whitespace.
 autocmd BufWinEnter * match BadWhitespace / \+\ze\t\|[^\t]\zs\t\+\|\s\+$/
 autocmd InsertEnter * match BadWhitespace / \+\ze\t\|[^\t]\zs\t\+\|\s\+\%#\@<!$/
 autocmd InsertLeave * match BadWhitespace / \+\ze\t\|[^\t]\zs\t\+\|\s\+$/
 " Highlight with red.
 highlight BadWhitespace guibg=red ctermbg=red
 " Rehighlight on color scheme change.
 autocmd ColorScheme * highlight BadWhitespace guibg=red ctermbg=red


" Diffing {{{
command! DiffOrig   vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! DiffSvn    let e = &fileencoding | vert new | set bt=nofile | exe 'r ++enc=' . e . ' !svn cat -r base #' | diffthis | wincmd p | diffthis
command! DiffDarcs  vert new | set bt=nofile | exe 'r !darcs show contents # || cat `searchup _darcs`/_darcs/pristine/#' | diffthis | wincmd p | diffthis
command! DiffGit    vert new | set bt=nofile | exe 'r !git show HEAD:#' | diffthis | wincmd p | diffthis
command! DiffHg     vert new | set bt=nofile | exe 'r !hg cat #' | diffthis | wincmd p | diffthis
command! DiffBzr    vert new | set bt=nofile | exe 'r !bzr cat -r last:1 #' | diffthis | wincmd p | diffthis
" }}}

set ffs=unix


function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = "+ "
      break
    endif
  endfor

  " Append the buffer name
  return label . expand('%:t')
endfunction

set guitablabel=%{GuiTabLabel()}

map ct :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

function! FoldCopyright()
	if !exists( "b:foldedCopyright" )
		let b:foldedCopyright = 1
		silent! 1,/\/\*\*/;/\*\//fold
	endif
endfunction
autocmd BufRead *.h,*.cpp execute FoldCopyright()

" select some lines of code, then gl and you can be sure that this fucking piese of code is your own :)
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
au! BufWinLeave * silent mkview
au! BufReadPost * silent loadview

set foldmethod=syntax
"set foldlevelstart=0
set foldnestmax=1
"let javaScript_fold=1
