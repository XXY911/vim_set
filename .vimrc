""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
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
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'            " 必须安装
Plugin 'L9'                           " FuzzyFinder依赖包
Plugin 'FuzzyFinder'                  " 文件快速查找
Plugin 'SirVer/ultisnips'             " Track the engine.
Plugin 'honza/vim-snippets'           " Snippets are separated from the engine. Add this if you want them: Plugin 'unite.vim'
Plugin 'vim-powerline'                " 状态栏增强
Plugin 'kien/rainbow_parentheses.vim' " 括号增强,彩色
Plugin 'trailing-whitespace'          " 增加尾部空格的显示
Plugin 'commentary.vim'               " 注释多行
Plugin 'surround.vim'                 " 补全括号或引号等cs,ds,yss

" wm界面
Plugin 'The-NERD-tree'
Plugin 'winmanager'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'              " buffer插件
Plugin 'ctags.vim'

Plugin 'timestamp.vim'                " 插入最后修改时间
Plugin 'plasticboy/vim-markdown'      " Markdown格式高亮
Plugin 'flazz/vim-colorschemes'
Plugin 'molokai'                      " 配色
Plugin 'Solarized'                    " 配色
Plugin 'Tabular'                      " 注释等格式对齐插件
" Plugin 'bufexplorer.zip' " 打开历史文件 :BufExplorer
" Plugin 'OmniCppComplete' " c/c++不全
" Plugin 'Syntastic'       " 语法检查

call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" 全局设置
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai            " 配色方案
set autowrite                  " 自动保存
set listchars=tab:>-,trail:-   " tab 显示
set mouse=a                    " 鼠标支持
filetype plugin on             " 允许插件
syntax enable                  " 语法高亮
set helplang=cn                " 中文文档
set nu                         " 显示行号
set relativenumber             " 设置相对行号
set nobackup                   " 从不备份
set cursorline                 " 突出显示当前行
set ruler                      " 打开状态栏标尺
set showcmd                    " 显示命令
set showmatch                  " 显示匹配的括号
set ai                         " 自动缩进
set si                         " 只能缩进
set cindent                    " c/c++风格
set backspace=eol,start,indent
set whichwrap+=<,>,h,l         " 退格和方向可以换行
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4                  " tab转化为4个字符
set mouse=n                    " 所有模式使用鼠标
set pastetoggle=<F9>           " 解决复制粘贴格式混乱问题
set showmatch                  " 高亮显示匹配的括号
set matchtime=1                " 匹配括号高亮的时间（单位是十分之一秒）
let &termencoding=&encoding    " 中文设置
set fileencodings=utf-8,gbk    " 中文设置
" solarized
"
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif
"set background=dark "背景黑色"light
"nnoremap <F2> :g/^\s*$/d<CR> "去空行
"set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
"filetype plugin indent on   "对齐线
"map <C-A> ggVG"+y
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips setting
""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"commentary
""""""""""""""""""""""""""""""""""""""""""""""""""
"支持不同文件类型
autocmd FileType apache set commentstring=#\ %s
"gcc:注释一行
"gc:可以注释多行,配合<C-v>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder
""""""""""""""""""""""""""""""""""""""""""""""""""
map ,, :FufCoverageFile!<cr>
let g:fuf_enumeratingLimit = 5000
let g:fuf_coveragefile_prompt = '=>' "美化为=>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" ranbow_parenthese.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"always on:
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自动插入文件头
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.md exec ":call Setmd()"
func Setmd()
    call setline(1,"date: ".strftime("%Y-%m-%d %T"))
    call append(line("."),"tags: ")
    call append(line(".")+1,"---")
    call append(line(".")+2,"")
endfunc
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.html,*.php,*java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    if &filetype=='python'
        call setline(1, "#---------------------------------import---------------------------------------") 
        call append(line("."), "") 
        call append(line(".")+1, "#------------------------------------------------------------------------------") 
        call append(line(".")+2, "") 
        call append(line(".")+3, "###############################################################################")
    endif
    if &filetype=='sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: limbo") 
        call append(line(".")+2, "\# mail: 468137306@qq.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\# Last changed:  TIMESTAMP")
        call append(line(".")+5, "\#########################################################################") 
        call append(line(".")+6, "\#!/bin/bash".expand("%")) 
        call append(line(".")+7, "") 
    endif
    if &filetype=='html' || &filetype=='php'
        call setline(1, "<!--*************************************************************************") 
        call append(line("."), "      > File Name: ".expand("%")) 
        call append(line(".")+1, "      > Author: limbo") 
        call append(line(".")+2, "      > Mail: 468137306@qq.com") 
        call append(line(".")+3, "      > Created Time: ".strftime("%c")) 
        call append(line(".")+4, "      > Last changed:  TIMESTAMP")
        call append(line(".")+5, " ************************************************************************-->") 
        call append(line(".")+6, "")
    endif
    if &filetype=='cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype=='c'
        call setline(1, "/*************************************************************************") 
        call append(line("."), "      > File Name: ".expand("%")) 
        call append(line(".")+1, "      > Author: limbo") 
        call append(line(".")+2, "      > Mail: 468137306@qq.com") 
        call append(line(".")+3, "      > Created Time: ".strftime("%c")) 
        call append(line(".")+4, "      > Last changed:  TIMESTAMP")
        call append(line(".")+5, " ************************************************************************/") 
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif    
    if &filetype=='php' || &filetype=='html' 
        call setline(9,['<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">','<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">','<head>','    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />','    <title></title>','</head>','<body>','</body>','</html>'])
    endif
    if &filetype=='java'
    call setline(9,['public class '.strpart(expand("%"),0,strlen(expand("%"))-5),'{','}'])
    endif
endfunc
autocmd BufNewFile * normal G "新建文件后，自动定位到文件末尾
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" 按F5编译运行
""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'python'
        exec "!python %"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!gcc % -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags=/home/limbo/code/tags
"map  :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
"let Tlist_Sort_Type = "name"    " 按照名称排序
"let Tlist_Use_Right_Window = 1  " 在右侧显示窗口
"let Tlist_Compart_Format = 1    " 压缩方式
"let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
"autocmd FileType java set tags+=D:\tools\java\tags
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags
"set tags=tags;
"set autochdir
"默认打开Taglist
"let Tlist_Auto_Open=1
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag list (ctags) "
""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 0 "在右侧窗口中显示taglist窗口
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" minibuffexploer
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   "<C-h,j,k,l>切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavArrows = 1  "<C-箭头>箭头切换
"let g:miniBufExplMapCTabSwitchBufs = 1   "<C-Tab>切换窗口(有冲突)
"let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
"常用操作
" :e <filename> 打开文件
" :ls    当前打开的buf
" :bn    下一个buf
" :bp    前一个buf
" :b<n>    n是数字，第n个buf
" :b<tab>    自动补齐
" :bd    删除
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
nmap wm :WMToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"omnicppcomplete
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
filetype on
"powerline
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'unicode'
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-multiple-cursors"
""""""""""""""""""""""""""""""""""""""""""""""""""
"<C-N>开启
"<C-X>跳过
"<C-p>删除
"<Esc>退出
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_quit_key_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"let g:multi_cursor_use_default_mapping=0 "map失效
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown"
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_initial_foldlevel= 1
let g:vim_markdown_folding_disabled=1 "去掉折叠
let g:markdown_no_default_key_mappings=1 "默认键失效
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" LASTCHANGED
""""""""""""""""""""""""""""""""""""""""""""""""""
let timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'
set modelines=20
let g:timestamp_rep = strftime("%c")
""""""""""""""""""""""""""""""""""""""""""""""""""
