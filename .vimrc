" 常用设置
" 设置行号
set number
set background=dark
colorscheme hybrid
" 按 F2 进入粘贴模式
set pastetoggle=<F2>
" 高亮搜索
set hlsearch
" 设置折叠方式
set foldmethod=indent
syntax on

" 一些方便的映射
let mapleader=','
let g:mapleader=','

" 使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
" 使用 jj 进入 normal 模式 
inoremap jj <Esc>`^

" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" json 格式化
com! FormatJSON %!python3 -m json.tool


" 插件设置，这里使用了 vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" 安装插件只需要把 github 后缀的地址放到这里重启后执行：PlugInstall ，就好了

" vim 开屏信息
Plug 'mhinz/vim-startify'

" vim 文件目录树
Plug 'preservim/nerdtree'

" vim 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 增加代码缩进线条
Plug 'Yggdroot/indentLine'

" vim-hybrid 主题
Plug 'w0ng/vim-hybrid'

" vim 模糊搜索器
Plug 'ctrlpvim/ctrlp.vim'

" vim 可视区域内快速搜索
Plug 'easymotion/vim-easymotion'

" normal 模式下增加，删除，修改成对的内容,如引号
Plug 'tpope/vim-surround'

" vim 模糊搜索
" 要单独安装Ag
" sudo apt-get install silversearcher-ag
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 批量搜索替换插件
Plug 'brooth/far.vim'

" wakatime
Plug 'wakatime/vim-wakatime'

" 代码浏览软件（代码大纲）需要安装插件
" https://github.com/universal-ctags/ctags/blob/master/docs/autotools.rst
Plug 'majutsushi/tagbar'

" go 语言
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" vim python 扩展工具
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" 高亮感兴趣的单词
Plug 'lfv89/vim-interestingwords'

" vim 代码补全
" 还有一个coc.nvim，没有安装
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" vim 代码格式化(需要配置)
Plug 'sbdchd/neoformat'

" vim 静态检查
Plug 'dense-analysis/ale'

" vim 快速注释
Plug 'tpope/vim-commentary'

" vim 中使用 git 命令
Plug 'tpope/vim-fugitive'

" vim 里显示文件变动
Plug 'airblade/vim-gitgutter'

" vim 里浏览代码提交记录
Plug 'junegunn/gv.vim'

" vim markdown 拓展
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" vim markdown 浏览
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" vim markdown 光标生成目录
Plug 'mzlogin/vim-markdown-toc'

""""""""""
""""""原文作者安装的插件
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" vim 文件目录树配置
filetype plugin indent on
"autocmd vimenter * NERDTree
nnoremap <leader>v :NERDTreeFind<CR>
nnoremap <leader>g :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$', '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',]

" vim 模糊搜索器配置
let g:ctrlp_map = '<c-p>'
" 在~/.agignore添加一行node_modules
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore =  {
			\ 'dir': '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
			\}
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
if executable('ag')
	" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lighting fast, respects .gitignore
	" and .agignore. Ignores hidden files by default.
	let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
	" ctrl+p ignore files in .gitignore
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif	

" vim 可视区域内快速搜索
nmap ss <Plug>(easymotion-s2)

"vim go配置
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" python mode 配置
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120

" vim 代码浏览软件配置
nnoremap <leader>t :TagbarToggle<CR>

" vim 代码补全配置
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" vim 显示文件变动设置
set updatetime=100 "100ms变一次

" vim markdown 拓展设置，增加 Latex 支持
let g:vim_markdown_math = 1

" vim markdown 浏览配置
let g:mkdp_path_to_chrome = "/usr/bin/google-chrome"
" Path to the chrome or the command to open chrome (or other modern browsers).
" If set, g:mkdp_browserfunc would be ignored.

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" Callback Vim function to open browser, the only parameter is the url to open.

let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

let g:mkdp_open_to_the_world = 0
" Set to 1, the preview server will be available to others in your network.
" By default, the server only listens on localhost (127.0.0.1).

" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview

" vim markdown 光标生成目录设置
let g:vmt_auto_update_on_save = 0
