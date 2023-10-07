" Filename: .vimrc
" Set leader key to spacebar
let mapleader = " "

" I always want to show the status line at the bottom (0 never, 1 if 2 windows, 2 always)
set laststatus=2

" Info to be shown in the status line
" %f filename, %y filetype, %m modified flag, %r RO flag, %= align to right, %l line, %c column
set statusline=%f\ %y\ %m\ %r\ %=Line:\ %l\ Column:\ %c

" Set Vim's operating mode to nocompatible with Vi (Vim's default behavior).
" This allows Vim to use features not found in standard Vi.
set nocompatible

" Enable line numbers.
set number

" Set tabs to have 4 spaces.
set tabstop=4
set shiftwidth=4
set expandtab

" Enable syntax highlighting.
syntax on

" Automatically indent code.
set autoindent

" Enable line wrapping.
set wrap

" Show matching brackets/parenthesis.
set showmatch

" Set the default search to case-insensitive.
set ignorecase

" But make search case-sensitive if it contains uppercase characters.
set smartcase

" Highlight search results.
set hlsearch

" Enable mouse in all modes
set mouse=a

" Mapping to enter command mode
" inoremap didn't work with obsidian so switched to imap
imap kj <Esc>

" When in visual mode, you can move lines of text up and down
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" When going down or up, centers cursor in the middle of the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Toggle line numbers with mn
nnoremap mn :set number!<CR>

" When searching and do n or N, cursor stays in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" Copy to the system clipboard either in normal or visual mode
" In visual mode, select the text and then do <Leader>y to copy it
" If in normal mode do <Leader>y then 'ap' to copy a paragraph
nnoremap <Leader>y "+y
vmap <Leader>y "+y
nnoremap <Leader>Y "+Y

" Q enters Ex mode, this disables it
nnoremap Q <nop>

" Set cursor to line in insert mode
let &t_SI = "\e[5 q"

" Set cursor to block in normal mode
let &t_EI = "\e[2 q"

" This fixed paste issues in tmux
" https://vi.stackexchange.com/questions/23110/pasting-text-on-vim-inside-tmux-breaks-indentation
if &term =~ "screen"                                                   
    let &t_BE = "\e[?2004h"                                              
    let &t_BD = "\e[?2004l"                                              
    exec "set t_PS=\e[200~"                                              
    exec "set t_PE=\e[201~"                                              
endif

" Last line
