syntax on
colorscheme darkblue

set shiftwidth=3  " operation >> indents 3 columns; << unindents 3 columns
set tabstop=3     " an hard TAB displays as 3 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=3 " insert/delete 3 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" Statusline settings including git branch
" (requires git-vim plugin)
set laststatus=2
set statusline=
set statusline+=[%{GitBranch()}]	" include git working branch
set statusline+=%t			" file name tail
set statusline+=%m			" modified flag
set statusline+=%=			" right alignment
set statusline+=%cC\ %l/%LL		" column and line number

au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/cucumber.vim

let mapleader = ','

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>
