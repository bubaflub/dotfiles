set statusline=%3.3(%M%)\ buffer(%n):\ %f%*\ %y\ %=chr:\ %3b\ 0x%02B\ \|\ %P:\ ln\ %l/%L\ col\ %2c
set laststatus=2 
set guifont=Anonymous\ Pro:h14.00
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set backspace=2
set list
set listchars=tab:▸\ ,eol:¬
set hidden
set wildmode=longest,list
if has("autocmd")
  set filetype=on
  autocmd BufWritePre *.rb,*.js,*.pl,*.pm,*.t :call <SID>StripTrailingWhitespaces()
  filetype plugin indent on

  autocmd BufReadPost *
    \ if line("\"") > 1 && line("'\"") <= line("$") |
    \  exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

colorscheme ego

noremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

map <D-S-right> gt
map <D-S-left> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
set grepprg=ack
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
nnoremap <F5> :GundoToggle<CR>
