scriptencoding utf-8
set encoding=utf-8

" begin of Vundle include
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'mhinz/vim-startify'
Plugin 'wincent/command-t.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'kassio/neoterm'
Plugin 'vim-utils/vim-man'

" syntax check
Plugin 'scrooloose/syntastic'

" syntax plugins
" Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'} " too heavy
Plugin 'rhowardiv/nginx-vim-syntax'
Plugin 'plasticboy/vim-markdown'

" not used
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'kien/ctrlp.vim' " like commandT, but less smart and less fast
" Plugin 'risbra/csv.vim'
" Plugin 'taglist'
" Plugin 'joonty/vdebug'
" Plugin 'wakatime/vim-wakatime'
" Plugin 'daylerees/colour-schemes', {'rtp': 'vim/'}
" Plugin 'lpenz/vimcommander' " http://habrahabr.ru/post/137170/
" Plugin 'yegappan/mru'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required for Vundle

syntax enable




""""""" Basic settings """""""

colorscheme solarized        " let g:solarized_termcolors=256
set background=dark          " color scheme

set clipboard=unnamedplus    " use system clipboard
set number                   " use line numbers

set mouse=a                  " mouse wheel, see :help mouse
" xterm2 breaks the wheel on terminals sending SGR mouse codes, sgr decodes both
if exists('+ttymouse') && has('mouse_sgr')
  set ttymouse=sgr
endif

set laststatus=2             " Always show Powerline
set backspace=indent,eol,start " backspace fix - http://vim.wikia.com/wiki/Backspace_and_delete_problems
set tabstop=4                " Размер табуляции
" set expandtab              " Convert tabs to spaces
set shiftwidth=4             " Размер сдвига при нажатии на клавиши << и >>
set autoindent               " Копирует отступ от предыдущей строки
set smartindent              " Включаем 'умную' автоматическую расстановку отступов
set nowrap                   " Отключаем перенос строк
set linebreak                " Перенос строк по словам, а не по буквам
set showcmd                  " Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана
set showmode
set incsearch
set nowrapscan               " Останавливать поиск при достижении конца файла
set ignorecase               " Игнорировать регистр букв при поиске
set nobackup                 " Отключаем создание бэкапов
set noswapfile               " Отключаем создание swap файлов
set fileencodings=utf-8,cp1251,koi8-r,cp866 " Список кодировок файлов для автоопределения
set visualbell               " Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set whichwrap=b,s,<,>,[,],l,h " Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set foldmethod=manual        " Метод фолдинга - вручную (для обычных файлов)

set keymap=russian-jcukenwin " Настраиваем переключение раскладок клавиатуры по <C-^>
set iminsert=0               " Раскладка по умолчанию - английская
set imsearch=0               " Раскладка по умолчанию - английская

setlocal foldlevelstart=0    " Уровень сокрытия по умолчанию для вновь открытых файлов
setlocal foldmethod=syntax   " Метод фолдинга - по синтаксису

set title                    " Set the terminal's title.

set incsearch                " При поиске перескакивать на найденный текст в процессе набора строки
set showmatch                " Highlighting search results
set hlsearch

set list                     " Better invisible characters.
set listchars=tab:▸\ ,eol:\  " Better invisible characters.

let g:vim_markdown_folding_disabled=1



""""""" GVim """""""
set linespace=3
set guioptions-=T            " Отключаем панель инструментов
set guioptions+=c            " Отключаем графические диалоги
set guioptions-=e            " Отключаем графические табы (текстовые занимают меньше места)
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12





""""""" Hotkeys """""""

" alt-codes will work - http://stackoverflow.com/a/10216459
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
"set timeout timeoutlen=50
set ttimeout ttimeoutlen=50

" esc-esc-esc for exit without save
"map <Esc><Esc><Esc> :q!<CR>

" Сохранить файл по <F2>
nmap <F2> :w!<CR>
imap <F2> <Esc>:w!<CR>
vmap <F2> <Esc>:w!<CR>
inoremap <F2> <c-o>:w<CR>

" Quicker Escaping - http://vim.wikia.com/wiki/Avoid_the_escape_key
imap jj <Esc>

" undo on ctrl-z
imap <c-z> <Esc>u<CR>
inoremap <c-z> <c-o>u

" exit on Esc-0
map <Esc>0 :q<CR>
map <Esc>00 :q!<CR>
map <Esc>09 ZZ<CR>

" Ctrl-n NerdTree
map <F11> :NERDTreeToggle<CR>
map <s-F11> :NERDTreeFind<CR>

" CpmmandT \t \b \m
nnoremap <silent> <leader>m :CommandTMRU<CR>

" move lines - http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Ускоренное передвижение по тексту
nmap <C-H> 5h
nmap <C-J> 5j
nmap <C-K> 5k
nmap <C-L> 5l

" Клавиши быстрого редактирования строки в режиме вставки
"imap <C-H> <BS>
imap <C-J> <Left>
imap <C-K> <Right>
imap <C-L> <Del>

" language switch on ctrl-f
cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>
nmap <silent> <C-F> a<C-^><Esc>
vmap <silent> <C-F> <Esc>a<C-^><Esc>gv

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
" привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

" Ctrl-Space autocomplete Onmicomplete, отсюда - http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" switch tabs on ctrl+pageX
map <c-PageDown> gt
map <c-PageUp> gT

" repeat last command on F5
nmap <F5> @:

" select all selected for multiedit
vmap <F3> "sy:MultipleCursorsFind <c-r>s<CR>

" select next result of vimgrep
nmap <F3> :cn<CR>

" Ctrl-a show all search results
map <c-a> :cw<CR>
"map <c-a> :g//p<CR>

" copy selection to system clipboard in visual mode
" paste from system clipboard in insert mode
vmap <F5> "+y
imap <F5> <c-o>:set paste<CR><c-o>"+P<c-o>:set nopaste<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

set timeoutlen=300
" nmap <c-w> viw
nmap <c-w><c-w> viw
imap <c-w><c-w> viw
nmap <c-w><c-w><c-w> vip
imap <c-w><c-w><c-w> vip











""""""" Custom commands """""""

" reload vim
command! Reload so ~/.vimrc

" G search - contextual search in current file - http://vim.wikia.com/wiki/Find_in_files_within_Vim
command! -nargs=+ G execute 'silent grep! -B3 -F3 <args> %' | copen 10
