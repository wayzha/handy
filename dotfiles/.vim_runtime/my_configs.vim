set number relativenumber
set autowrite

# On pressing tab, insert 2 spaces
#set expandtab
# On pressing tab, insert a tab
set noexpandtab
# show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
# when indenting with '>', use 2 spaces width
set shiftwidth=2

# show tabs
:set list
:set listchars=tab:>-,trail:-

# disable brackets auto close
let g:autoclose_on = 0

if has("linux")
  set gfn="Hack Regular":h10
end

#This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

let mapleader = ","

nnoremap <leader>c :tabedit ~/.vim_runtime/my_configs.vim<CR>

nnoremap <leader>op :!open "%"<CR>
nnoremap <leader>uo :PlantumlOpen<CR>

autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy
