set hidden " required by CtrlSpace
if isdirectory('/dev/shm')
	set directory=/dev/shm " in-memory swap files (more risky but nothing sticks around)
endif

filetype plugin indent on    " required
set t_Co=256 " Ignored by nvim

" set list " show whitespace chars
" set listchars is useful in combination with :set list (showing whitespace chars)
set listchars=eol:↲,tab:»\ ,trail:~,extends:⟩,precedes:⟨,space:·
set showbreak=↪
" hi NonText ctermfg=16 guifg=#4a4a59
" hi SpecialKey ctermfg=16 guifg=#4a4a59

set whichwrap+=<,>,h,l,[,] " right-arrow goes to next line
set autochdir " change dir to current file's dir
set autowrite " useful for :bufdo
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set encoding=utf-8

syntax on

set wildmenu                       
set wildmode=list:longest,full 

set mouse=a
set mousemodel=extend

set autowriteall                  " write on :quit
set clipboard=unnamedplus
"set colorcolumn=81                " highlight the 80th column as an indicator

nnoremap <silent> vv <C-w>v       " Bind vv to vertical split 

set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set expandtab       

if exists('g:gui_oni')
    filetype off                  " required
    set noswapfile
endif

if exists('g:gui_oni')
"   set smartcase
"   set noshowmode
"   set noruler
"    set laststatus=0
"    set noshowcmd
endif

if !has('nvim')
	set term=xterm-256color
endif

if has('nvim')
	autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
	tnoremap <Esc> <C-\><C-n>
	command Tsplit split term://$SHELL
	command Tvsplit vsplit term://$SHELL
	command Ttabedit tabedit term://$SHELL
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	"let &t_AB="\e[48;5;%dm"
	"let &t_AF="\e[38;5;%dm""	
	" This is for vim-tmux-navigator in OSX
	nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

set termencoding=utf-8
"set guifont=Source\ Code\ Pro\ ExtraLight:h18
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
"set guifont=GoMono\ Nerd\ Font\ Book:h18
"set completeopt-=preview


if !has('nvim')
	" old completion stuff
	"let g:ycm_complete_in_strings = 1
	"let g:ycm_allow_changing_updatetime = 1000
	"let g:ycm_auto_trigger = 1
	"let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
	"let g:completor_auto_trigger = 1
	"let g:completor_min_chars = 2	
	inoremap _expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
	let g:completor_auto_trigger = 0
        let g:completor_gocode_binary = "$HOME/go/bin/gocode"
endif

set number relativenumber
set hlsearch
set incsearch
"set gdefault " treat :s// as :s//g (and vice versa)
"set smartcase " treat all-lower as case-insensitive while searching
set title

"set clipboard^=unnamed
set clipboard+=unnamedplus

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir -p ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

set backspace=indent,eol,start


" restore cursor _except_ for commit messages
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 


" plugin-specific settings


let g:place_single_character_mode = 0
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" ^set autowrite

let g:WMGraphviz_output = "svg"
let g:WMGraphviz_viewer = "google-chrome"


""" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Rust
let g:rustfmt_autosave = 1

if !exists('g:gui_oni') && !exists('g:GuiLoaded')
    " Start NERDTree when no files specified
    autocmd StdinReadPre * let s:std_in=1
"    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " autocmd BufEnter * NERDTreeMirror
"    autocmd VimEnter * wincmd w
endif

" ESC double tap to save buffer
map <Esc><Esc> :w<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir='mysnippets'
"let g:UltiSnipsSnippetDirectories=['~/.vimsnippets']

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_fixers = {'javascript': ['prettier', 'eslint', 'flow']}

"fzf
 " Better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap q/ :QHist<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" ctrlp
let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if !exists('g:gui_oni')
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif       
let g:over_enable_cmd_window = 1 " vim-over
let g:over_enable_auto_nohlsearch = 1

" let g:used_javascript_libs = 'angularjs,angularui'
let g:argwrap_tail_comma = 1

" Language server
let g:LanguageClient_rootMarkers = {
        \ 'go': ['.git', 'go.mod'],
        \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"    \ 'go': ['go-langserver'],
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'yaml': ['yaml-language-server'],
      \ }

" \ 'go': ['bingo', '--mode', 'stdio', '--logfile', '/tmp/lspserver.log','--trace', ':6060'],
""" vim-checkbox plugin
let g:checkbox_states = [' ', 'X']

let vim_markdown_preview_github=1

let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt-=preview
autocmd CompleteDone * silent! pclose!
inoremap <silent><CR> <C-R>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if (pumvisible())
        return deoplete#close_popup()
    else
        return "\<CR>"
    endif
endfunction
