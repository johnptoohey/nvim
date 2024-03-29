call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim' " I think this is a dependency for something. Can't remember but leaving it near the top

" Git support
Plug 'tpope/vim-fugitive' " The git things
Plug 'tpope/vim-rhubarb' " :Gbrowse, hub
Plug 'airblade/vim-gitgutter' " +/-/~ signs in the gutter
Plug 'jreybert/vimagit' " Magit in vim
Plug 'gregsexton/gitv', {'on': ['Gitv']} " :Gitv is a bit like tig
Plug 'junkblocker/patchreview-vim' " Dependency for vim-codereview
Plug 'codegram/vim-codereview' " Use :CodeReview https://github.com/myorganization/myrepo/pulls/1328
Plug 'idanarye/vim-merginal' " view/switch branches with :Merginal

Plug 'will133/vim-dirdiff' " diff

Plug 'junegunn/vim-peekaboo' " show buffers

Plug 'gioele/vim-autoswap' " deal with swap files


Plug 'joereynolds/place.vim' " insertions with ga (non-cursor)

Plug 'jeffkreeftmeijer/vim-numbertoggle'

""" Completion
Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }

""" Latex
Plug 'donRaphaco/neotex', { 'for': 'tex' }

""" Go
Plug 'fatih/vim-go', { 'tag': '*' } " , 'do': ':GoUpdateBinaries' }
Plug 'godoctor/godoctor.vim'
"Plug 'nsf/gocode', {'rtp': 'nvim/'}
Plug 'buoto/gotests-vim'
Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
Plug 'laher/regopher.vim'

""" related to go but not specific
Plug 'FooSoft/vim-argwrap' " Wrap a paremeter list accross multiple lines
Plug 'majutsushi/tagbar' " 'Outline' of current file
Plug 'lvht/tagbar-markdown'
Plug 'w0rp/ale' "syntax & linting

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
""" Other languages
"Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'

Plug 'rstacruz/sparkup', {'rtp': 'vim/'}  """ condensed html

Plug 'prettier/vim-prettier'
Plug 'flowtype/vim-flow'
"Plug 'wokalski/autocomplete-flow'


Plug 'gabrielelana/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
"Plug 'JamshedVesuna/vim-markdown-preview'
"Plug 'suan/vim-instant-markdown'
Plug 'jkramer/vim-checkbox'

""" OMG Scala
Plug 'wannesm/wmgraphviz.vim'

Plug 'kyuhi/vim-emoji-complete'
Plug 'christianrondeau/vim-base64'


""" tmux
Plug 'christoomey/vim-tmux-navigator'
" Plug 'benmills/vimux'
" Plug 'benmills/vimux-golang'
Plug 'christoomey/vim-tmux-runner'

""" tpope
Plug 'tpope/vim-surround'          " Operate on surrounding 
Plug 'tpope/vim-speeddating'       " Increment dates
            \slug 'tpope/vim-repeat'            " Repeat plugins
Plug 'tpope/vim-commentary'        " Comment out blocks
Plug 'tpope/vim-abolish'           " Flexible search
Plug 'tpope/vim-jdaddy'            " JSON text object
Plug 'tpope/vim-obsession'         " Continuously save buffer state
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-sleuth'            " tab/space detection per-file
Plug 'tpope/vim-unimpaired'        " pairs of mappings like [q ]q for quickfix pref/next

""" navigation and fuzzy
Plug 'ctrlpvim/ctrlp.vim' " Find files faster by name
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Find within files
Plug 'ryanoasis/vim-devicons' " icons for NERDTree etc
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pelodelfuego/vim-swoop' " replace across files typa thing
" Plug 'vim-ctrlspace/vim-ctrlspace' "not really using this megabeast
Plug 'sunaku/vim-shortcut' "searchable key mappings
Plug 'haya14busa/incsearch.vim'

""" text objects and editing
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'bkad/CamelCaseMotion'
Plug 'glts/vim-textobj-comment'
"Plug 'jiangmiao/auto-pairs'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'AndrewRadev/splitjoin.vim'

""" writing
Plug 'szw/vim-dict'

""" Appearance and layout
Plug 'ap/vim-buftabline' " tabs across top
Plug 'freeo/vim-kalisi' " theme
Plug 'altercation/vim-colors-solarized' " theme
Plug 'itchyny/lightline.vim' " status across bottom
Plug 'fxn/vim-monochrome' " theme
Plug 'mhartington/oceanic-next'
Plug 'kcsongor/vim-monochrome-light' " theme
Plug 'itchyny/vim-cursorword' " underline word under cursor
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
""" Apps
Plug 'diepm/vim-rest-console' " Rest console
Plug 'itchyny/calendar.vim' " calendar
Plug 'thanthese/Tortoise-Typing' " typing
Plug 'chemzqm/todoapp.vim' " todo
" Plug 'jacobsimpson/nvim-example-python-plugin' " ooh, lets try

""" Completion
if !has('nvim')
	"Plug 'Shougo/neocomplete.vim'
	Plug 'maralla/completor.vim' " Ugh not working for go. Disabling at startup for now and switching back to nvim

	Plug 'ensime/ensime-vim'
endif
if has('nvim')
	Plug 'jodosha/vim-godebug'

	"gonvim
	Plug 'equalsraf/neovim-gui-shim'
	Plug 'dzhou121/gonvim-fuzzy' 


	Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
endif

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" You will also need the following for function argument completion:
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" buggy? jumpy text
" Plug 'osyo-manga/vim-over' " show preview of commands

" All of your Plugs must be added before the following line
call plug#end()

"set runtimepath^=~/d/regopher.vim
