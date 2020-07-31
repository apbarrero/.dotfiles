" =============================================================================
"  PLUGINS
" =============================================================================
" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" ============================
"  COMMON PLUGINS
" ============================

" vim/plug Help (e.g. :help plug-options)
Plug 'junegunn/vim-plug'

" sensible.vim: Defaults everyone can agree on
Plug 'tpope/vim-sensible'


" ============================
"  APPEAREANCE
" ============================

" Solarized Colorscheme for Vim
Plug 'altercation/vim-colors-solarized'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline
Plug 'ryanoasis/vim-devicons'


" ============================
"  EDITOR PLUGINS
" ============================
""" File Management
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree A tree explorer plugin for vim.
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" Create nice looking images for code snippets
Plug 'segeljakt/vim-silicon'


"""" Code Management
" Commenter
Plug 'scrooloose/nerdcommenter'

" TagBar
Plug 'majutsushi/tagbar'

" endwise.vim
" This is a simple plugin that helps to end certain structures automatically
Plug 'tpope/vim-endwise'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

Plug 'editorconfig/editorconfig-vim'

Plug 'will133/vim-dirdiff'

Plug 'matze/vim-move'

" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" Rainbow Parentheses Improved, https://github.com/luochen1990/rainbow
Plug 'luochen1990/rainbow'

" Vim plugin for selectively illuminating other uses of the current word under the cursor
" https://github.com/RRethy/vim-illuminate
Plug 'RRethy/vim-illuminate'

""" Buffers
" Delete buffers and close files in Vim without closing your windows or messing
" up your layout.
" Plug 'moll/vim-bbye'
"
"This plugin provides a single command that deletes the current buffer and
"handles the current window in a smart way.
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }


""" Git
" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Vim Git runtime files
Plug 'tpope/vim-git'

" vim-gitgutter
" A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'


""" Make
" Modestly enhanced make for Vim.
" Finds the closest parent directory of the current buffer with a Makefile and runs make with the passed arguments.
" Plug 'vshih/vim-make'

" ============================
"  COMPLETION & SYNTAX
" ============================
" Deoplete, Dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Extran snippets
Plug 'honza/vim-snippets'

" Asynchronous Lint Engine
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" Neomake is a plugin for Vim/Neovim to asynchronously run programs.
Plug 'neomake/neomake'

"A (Neo)vim plugin for formatting code.
Plug 'sbdchd/neoformat'


" ============================
"  LANGUAGE SUPPORT
" ============================

" respect the Linux kernel coding style
Plug 'vivien/vim-linux-coding-style'

" nginx (incl. syntax highlighting)
Plug 'chr4/nginx.vim'

" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
Plug 'elzr/vim-json'

" Markdown
Plug 'plasticboy/vim-markdown'

" This small script modifies Vim’s indentation behavior to comply with PEP8 and
" my aesthetic preferences.
Plug 'Vimjas/vim-python-pep8-indent'

" Python Black formatter
Plug 'psf/black'


" Systemd unit files
Plug 'wgwoods/vim-systemd-syntax'

" Ansible
Plug 'pearofducks/ansible-vim'

" Puppet
Plug 'rodjek/vim-puppet'

" YAML
Plug 'stephpy/vim-yaml'

" Dockerfiles
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

" Hashicorp, Terraform, Vagrant, PAcker
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-packer'

" shfmt
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }


" EXTRA



" Initialize plugin system
call plug#end()


" =============================================================================
"  SETTINGS
" =============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required

"
" Settings
"
set clipboard=unnamed           " Operations such as yy, D, and P work with the system clipboard. No need to prefix them with "+ or "*.
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup	                  " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" set ttyscroll=3               " noop on linux ?
set lazyredraw          	      " Wait to redraw

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" do not hide markdown
set conceallevel=0


" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
"set relativenumber
"set norelativenumber

" mail line wrapping
au BufRead /tmp/mutt-* set tw=72

set autoindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \	exe "normal! g`\"" |
          \ endif

  augroup END
else
endif " has("autocmd")

syntax enable
if has('gui_running')
  set transparency=3
  " fix js regex syntax
  set regexpengine=1
  syntax enable
endif
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" let g:hybrid_use_Xresources = 1
" let g:rehash256 = 1
colorscheme solarized
set guifont=Inconsolata:h15
set guioptions-=L

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

" Dont show me any output when I build something
" Because I am using quickfix for errors
"nmap <leader>m :make<CR><enter>

" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <C-n> :cn<CR>
map <C-m> :cp<CR>

nnoremap <silent> <leader>q :Sayonara<CR>

" Replace the current buffer with the given new file. That means a new file
" will be open in a buffer while the old one will be deleted
com! -nargs=1 -complete=file Breplace edit <args>| bdelete #

function! DeleteInactiveBufs()
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor

  "Below originally inspired by Hara Krishna Dara and Keith Roberts
  "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
      silent exec 'bwipeout' i
      let nWipeouts = nWipeouts + 1
    endif
  endfor
  echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Ball :call DeleteInactiveBufs()

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Center the screen
nnoremap <space> zz

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj
map k gk
map j gj

" Just go out in insert mode
imap jk <ESC>l

nnoremap <F6> :setlocal spell! spell?<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"nnoremap <leader>. :lcd %:p:h<CR>
autocmd BufEnter * silent! lcd %:p:h

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Act like D and C
nnoremap Y y$

" Do not show stupid q: window
map q: :q

" sometimes this happens and I hate it
map :Vs :vs
map :Sp :sp

" dont save .netrwhist history
let g:netrw_dirhistmax=0

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Reindent
map <F7> gg=G<C-o><C-o>


" ----------------------------------------- "
" File Type settings
" ----------------------------------------- "
au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" spell check for git commits
autocmd FileType gitcommit setlocal spell

" Cloudformation
autocmd BufNewFile,BufRead *.template,template.yaml,*.cfn.yml set filetype=cloudformation syntax=yaml expandtab ts=2 sts=2 sw=2
" autocmd BufWritePost *.template,template.yaml,*.cfn.yml silent !aws-cloudformation-template-formatter -w % 2>/dev/null


" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


" ----------------------------------------- "
" Plugin configs
" ----------------------------------------- "
" =============================================================================
" APPEAREANCE
" =============================================================================
" ====================
" vim-airline
" ====================
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts=1
endif
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Enable ALE integration
let g:airline#extensions#ale#enabled = 1


" =============================================================================
" EDITOR
" =============================================================================
" ====================
" CtrlP
" ====================
let g:ctrlp_map = '<c-p>'            " Change the default mapping and
let g:ctrlp_cmd = 'CtrlP'            " the default command to invoke CtrlP:
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10          " maximum height of match window
let g:ctrlp_switch_buffer = 'et'     " jump to a file if it's open already
let g:ctrlp_mruf_max=450             " number of recently opened files
let g:ctrlp_max_files=0              " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  CtrlPBufTag
endfunc
command! MyCtrlPTag call MyCtrlPTag()

nmap <C-g> :MyCtrlPTag<cr>
imap <C-g> <esc>:MyCtrlPTag<cr>

nmap <C-b> :CtrlPCurWD<cr>
imap <C-b> <esc>:CtrlPCurWD<cr>

" ====================
" NerdTree
" ====================
" For toggling
nmap <C-e> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let g:NERDTreeQuitOnOpen = 1  " Close NerdTree when opening a file
let g:NERDTreeShowHidden=1    " Show hidden files
let g:NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ====================
" NerdCommenter
" ====================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '#','right': '' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ====================
" TagBar
" ====================
nmap <F8> :TagbarToggle<CR>

" ====================
" vim-multiple-cursors
" ====================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_prev_key='<C-y>'
let g:multi_cursor_skip_key='<C-b>'
let g:multi_cursor_quit_key='<Esc>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" ====================
" vim-better-whitespace
" ====================
" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" ====================
" rainbow
" ====================
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ====================
" vim-illuminate
" ====================
" Time in milliseconds (default 250)
let g:Illuminate_delay = 250
" Don't highlight word under cursor (default: 1)
let g:Illuminate_highlightUnderCursor = 0
" Disable for some filetypes
let g:Illuminate_ftblacklist = ['nerdtree']

" ====================
" vim-make
" ====================
let g:Make_quickfix_always_open = 0

nnoremap <F5> :Make<CR>


" =============================================================================
" CODE MANAGEMENT
" =============================================================================
" ====================
" Fugitive
" ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>


" =============================================================================
" COMPLETION
" =============================================================================
" ====================
" deoplete
" ====================
let g:deoplete#enable_at_startup = 1
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
" let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
" let g:deoplete#sources#go#align_class = 1

" Use partial fuzzy matches like YouCompleteMe
" call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
" call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" let g:python_host_prog = '~/.pyenv/versions/py2/bin/python'
" let g:python3_host_prog = '~/.pyenv/versions/py3/bin/python'

" ====================
" neosnippet
" ====================
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.vim/snippets/'


" =============================================================================
" SYNTAX
" =============================================================================
" ====================
" NeoMake
" ====================
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" " When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" " Full config: when writing or reading a buffer, and on changes in insert and
" " normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)


" ====================
" NeoMake
" ====================
" #augroup fmt
" #  autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END


" =============================================================================
" LANGUAGE SUPPORT
" =============================================================================
" ====================
" vim-markdown
" ====================
" disable folding
let g:vim_markdown_folding_disabled = 1
" allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1
" disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" allow the ge command to follow named anchors in links of the form
" file#anchor or just #anchor, where file may omit the .md extension as usual
let g:vim_markdown_follow_anchor = 1
" highlight frontmatter
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" ====================
" vim-ansible
" ====================
" reset indentation (unindent to column 0) after two newlines in insert-mode
let g:ansible_unindent_after_newline = 1
" provide additional compatibility with stephpy/vim-yaml
let g:ansible_yamlKeyName = 'yamlKey'

let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

" ====================
" vim-json
" ====================
let g:vim_json_syntax_conceal = 0


" ====================
" shfmt
" ====================
let g:shfmt_extra_args = '-i 2'


" ====================
" vim-terraform
" ====================
" override .vimrc indentation syntax for matching files
let g:terraform_align=1
" run terraform fmt on save
let g:terraform_fmt_on_save=1


" vim:ts=2:sw=2:et
