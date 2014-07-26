"map <C-A> ggVG"+y
colorscheme molokai "配色方案
"let g:molokai_original = 1
"colorscheme molokai
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif 
"set background=dark "背景黑色"light
set autowrite "自动保存
set listchars=tab:>-,trail:- "tab 显示
set mouse=a"鼠标支持
filetype plugin on "允许插件
syntax enable "语法高亮
set helplang=cn "中文文档
set nu "显示行号  
set nobackup "从不备份
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set showcmd "显示命令
set showmatch "显示匹配的括号
set ai "自动缩进
set si "只能缩进
set cindent "c/c++风格
set backspace=eol,start,indent
set whichwrap+=<,>,h,l "退格和方向可以换行
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4 "tab转化为4个字符
set mouse=n "所有模式使用鼠标
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"从系统剪切板中复制，剪切，粘贴
144
map <F7> "+y
145
map <F8> "+x
146
"map <F9> "+p
"解决复制粘贴格式混乱问题
set pastetoggle=<F9>

"去空行  
nnoremap <F2> :g/^\s*$/d<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C，C++ 按F5编译运行
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
"""""""""""""""""""""""""""""""""""""
" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag list (ctags) "
"""""""""""""""""""""""""""""""" """"""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
"let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
"let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
"let Tlist_Use_Right_Window = 0 "在右侧窗口中显示taglist窗口
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""minibuffexploer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   
"<C-h,j,k,l>切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
"<C-Tab>切换窗口
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"  
  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  
  
nmap wm :WMToggle<CR> 

""""""""""""""""""""""""""""
"omnicppcomplete
""""""""""""""""""""""""""""
set nocp
filetype on
"powerline
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'unicode'
""""""""""""""""""""""""
"vundle
""""""""""""""""""""""""
set nocompatible              " be iMproved
"filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

    " let Vundle manage Vundle
    " " required! 
    " Bundle 'gmarik/vundle'
    "
    " " My bundles here:
    " "
    " " original repos on GitHub
    " Bundle 'tpope/vim-fugitive'
    " Bundle 'Lokaltog/vim-easymotion'
    " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Bundle 'tpope/vim-rails.git'
    " " vim-scripts repos
    " Bundle 'L9'
    " Bundle 'FuzzyFinder'
    " " non-GitHub repos
    " Bundle 'git://git.wincent.com/command-t.git'
    " " Git repos on your local machine (i.e. when working on your own plugin)
    " Bundle 'file:///Users/gmarik/path/to/plugin'
    " B
    " " ...
    "
    Bundle 'Vundle'
    Bundle 'https://github.com/Lokaltog/vim-powerline.git'
    Bundle 'The-NERD-tree'
    Bundle 'winmanager'
    "Bundle 'taglist.vim'
    Bundle 'minibufexpl.vim'
    Bundle 'bufexplorer.zip'
    Bundle 'OmniCppComplete'
    Bundle 'ctags.vim'
    Bundle 'timestamp.vim'
    Bundle 'indentLine' 
    Bundle 'plasticboy/vim-markdown'
    "Bundle 'supertab'
    Bundle 'Syntastic'
    Bundle 'flazz/vim-colorschemes'
    "Bundle 'molokai'
    Bundle 'commentary.vim'
    "Bundle 'vim-multiple-cursors'
    "Bundle 'vim-gitgutter'
    "Bundle 'bling/vim-airline'

    """"""""""""""""""""""
    "vim-multiple-cursors"
    """"""""""""""""""""""
    "<C-N>开启
    "<C-X>跳过
    "<C-p>删除
    "<Esc>退出
    "let g:multi_cursor_next_key='<C-n>'
    "let g:multi_cursor_prev_key='<C-p>'
    "let g:multi_cursor_quit_key_skip_key='<C-x>'
    "let g:multi_cursor_quit_key='<Esc>'
    "let g:multi_cursor_use_default_mapping=0 "map失效
    
    """"""""""""""""""""""""
    "commentart<gc>多行注解"
    """"""""""""""""""""""""

    """""""""""""""""""
    "Syntastic语法检测"
    """""""""""""""""""
    let g:syntastic_check_on_open=1

    """"""""""""""""""""
    "supertab<C-P><C-N>"
    """"""""""""""""""""
    "let g:SuperTabDefaultCompletionType="context"

    """"""""""""""
    "vim-markdown"
    """"""""""""""
    let g:vim_markdown_initial_foldlevel= 1
    let g:vim_markdown_folding_disabled=1
    let g:markdown_no_default_key_mappings=1

    """"""""""""""""""
    "instant markdown"
    """"""""""""""""""
    "let g:instant_markdown_autostart = 0
    let g:instant_markdown_slow = 1

    "对齐线
      filetype plugin indent on     " required!
    " "
    " " Brief help
    " " :BundleList          - list configured bundles
    " " :BundleInstall(!)    - install (update) bundles
    " " :BundleSearch(!) foo - search (or refresh cache first) for foo
    " " :BundleClean(!)      - confirm (or auto-approve) removal of unused
    " " bundles四个命令
    " git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    " "
    " vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
    " "
    " 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
    " " 安装完之后，在vimrc中，添加Bundle
    " 'XXX'，使得bundle能够加载，这个插件，同时如果
    " " 需要配置这个插件，也是在vimrc中设置即可
    " " see :h vundle for more details or wiki for FAQ
    " " NOTE: comments after Bundle commands are not allowed.
    "中文乱麻
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk

    "LASTCHANGED
    let timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'
    set modelines=20   
    let g:timestamp_rep = strftime("%c")

