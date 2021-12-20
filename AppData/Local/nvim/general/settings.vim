syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
" set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler			                          " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set colorcolumn="99999"                 " fixes indentline for now
set iskeyword+=-	                      " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
" set foldmethod=manual                   " folding, set to "expr" for treesitter based folding
" set foldexpr=""                         " set to "nvim_treesitter#foldexpr()" for treesitter based folding
" set guifont=monospace:h17               " the font used in graphical neovim applications
" set timeoutlen=100                      " time to wait for a mapped sequence to complete (in milliseconds)
" set updatetime=300                      " faster completion
" set signcolumn                          " always show the sign column, otherwise it would shift the text each time
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set tabstop=2                           " Insert 2 spaces for a tab
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set numberwidth=5                       " Line numbers width
set showtabline=1                       " 0: never 1: only if there are at least two tab pages
set laststatus=2                        " if is equal to 0 Always display the status line
" set cursorline                        " Enable highlighting of the current line
" set background=dark                     " tell vim what the background color looks like
" set showtabline=2                     " 2: Always show tabs
" set laststatus=0                      " Always display the status line
" set backspace=indent,eol,start        " allow backspacing over everything in insert mode
set visualbell                          " visual bell instead of beeping
set virtualedit=all                     " allow cursor bypass end of line
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory
" set sidescroll=5                        " The minimal number of columns to scroll horizontally
set sidescrolloff=10                    " Minimal number of screen lines to keep at the left and right side of the cursor
set scrolloff=4                         " Minimal number of screen lines to keep above and below the cursor
set ignorecase		                      " Do case insensitive matching
set smartcase	 	                        " Do smart case matching
" set completeopt=menu,menuone,noselect   " required by nvim-cmp
set completeopt=menu,menuone,noinsert   " required by nvim-cmp

" Stop newline continution of comments
" au FileType * set fo-=c fo-=r fo-=o
au BufEnter * set fo-=c fo-=r fo-=o

" whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=cyan guibg=cyan
autocmd InsertLeave * redraw!
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWritePre * :%s/\s\+$//e

" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

"jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" You can't stop me (save file as sudo)
" cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
cmap w!! w !sudo tee %

" to autoformat eslint(javascript) on save
" autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>

" disable nvimtree status
" au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif

" enable terminal insert by default
" au WinEnter * if &buftype == 'terminal' | startinsert | endif

" toggle status line
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noruler
        set laststatus=0
        set cmdheight=3
        set noshowcmd
        " set nonumber
    else
        let s:hidden_all = 0
        set ruler
        set laststatus=2
        set cmdheight=2
        set showcmd
        " set number
    endif
endfunction
nnoremap <silent> <C-z> :call ToggleHiddenAll()<CR>

autocmd TermOpen * setlocal noruler laststatus=0 cmdheight=3 noshowcmd nonumber | startinsert
autocmd TermEnter * setlocal noruler laststatus=0 cmdheight=3 noshowcmd nonumber | startinsert
autocmd TermLeave * set ruler laststatus=2 cmdheight=2 showcmd
autocmd TermClose * set ruler laststatus=2 cmdheight=2 showcmd
" autocmd TermClose * close
" autocmd TermClose * quit
" autocmd TermOpen * call feedkeys("i")

" WindowSwap
function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction

command! Wswap :call WinBufSwap()
" map <C-v> :call WinBufSwap()<CR>

function! SwitchWindow(count) abort
    let l:current_buf = winbufnr(0)
    exe "buffer" . winbufnr(a:count)
    exe a:count . "wincmd w"
    exe "buffer" . l:current_buf
    wincmd p
endfunction
" nnoremap <C-x> :call SwitchWindow(v:count1)<CR>
" tnoremap <C-x> <C-\><C-n>:call SwitchWindow(v:count1)<CR><Esc>

function! SwitchWindow2()
    let thiswin = winnr()
    let thisbuf = bufnr("%")
    let lastwin = winnr("#")
    let lastbuf = winbufnr(lastwin)
    exe "buffer" . lastbuf
    wincmd p
    exe "buffer" . thisbuf
    wincmd p
endfunction
" nnoremap <C-x> :call SwitchWindow2()<CR>
" tnoremap <C-x> <C-\><C-n>:call WinBufSwap()<CR><Esc>

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction
" nmap <silent> <C-m> :call MarkWindowSwap()<CR>
" nmap <silent> <C-x> :call DoWindowSwap()<CR>
