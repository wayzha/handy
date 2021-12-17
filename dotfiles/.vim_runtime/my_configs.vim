set number relativenumber
set autowrite

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

let mapleader = ","

nnoremap <leader>c :tabedit ~/.vim_runtime/my_configs.vim<CR>

nnoremap <leader>op :!open "%"<CR>
nnoremap <leader>uo :PlantumlOpen<CR>

autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy
