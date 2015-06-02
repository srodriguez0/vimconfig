set shell=/bin/bash
set background=dark
set mouse=a
set history=500
set hidden
set nocompatible
set splitbelow
set splitright
set t_Co=256
syntax on
filetype plugin indent on                  " required
filetype indent off
set tabstop=4
set shiftwidth=4
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'powerline/powerline'
Plugin 'spf13/vim-colors'
Plugin 'spf13/vim-autoclose'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"YCM options
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview


"airline options
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"extras
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_detect_modified=1
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Config
function! AirlineInit()
	let g:airline_section_a=airline#section#create(['mode',' ','branch'])
	let g:airline_section_b=airline#section#create_left(['%f'])
	let g:airline_section_c=airline#section#create(['filetype'])
	let g:airline_section_x=airline#section#create(['%P'])
	let g:airline_section_y=airline#section#create(['%B'])
	let g:airline_section_z=airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()


"ctrlP
set wildignore+=*/tmp/*,*/Music/*,*/Documents/*,*/Downloads/*,*.swp,*.zip

" This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
"
" " To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
"
" " Move to the next buffer
nmap <leader>l :bnext<CR>
"
" " Move to the previous buffer
nmap <leader>h :bprevious<CR>
"
" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bw :bn <BAR> bd #<CR>
"
" " Show all open buffers and their status
nmap <leader>bl :ls<CR>

"Vertical Split Buffer
function VerticalSplitBuffer(buffer)
	execute "vert belowright sb" a:buffer
endfunction
" "mapping
command -nargs=1 Vbf call VerticalSplitBuffer(<f-args>)
