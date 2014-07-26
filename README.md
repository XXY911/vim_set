##bashrc配置

![](https://github.com/taizilongxu/vim_set/raw/master/pic/1.png)

只需在.bashrc中加入

```bash
PS1="\[\e[37m\][\[\e[31m\]\u\[\e[37m\]@Pig \t\[\e[35m\]\w #\#\[\e[37m\]]\\$\[\e[37m\]"
```

##vim配置

以下配置均在根目录的.vimrc文件中配置,墙裂建议用vundle管理vim插件方便快捷(全部用vundle添加插件)
vundle地址:https://github.com/gmarik/Vundle.vim
###1. 全局配置

![](https://github.com/taizilongxu/vim_set/raw/master/pic/2.png)

这个图片里总共用了以下3个插件

```vim
"配色方案
Plugin 'molokai'

"下方状态栏,你值得拥有的状态栏
Plugin 'https://github.com/Lokaltog/vim-powerline.git'

"if下边的对齐线,可能长久未更新,不支持Plugin命令,可自行搜索下载
indentLine 
```

![](https://github.com/taizilongxu/vim_set/raw/master/pic/3.png)

如果想要在创建文件时自动添加各自语言的注释信息,可在.vimrc文档里做如下设置(以下是自己的配置,分别设置了在以md,cpp,c,sh,html,php,java结尾的文档添加的头信息,为编程省去了不少麻烦),注意一下TIMESTAMP是个插件,可以添加最后修改的时间,需要另行用```Bundle 'timestamp.vim'```

```vim
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
```
![](https://github.com/taizilongxu/vim_set/raw/master/pic/4.png)

上图中需要的插件如下:

```vim
"ctag需要在ubuntu apt命令中下载"
Plugin 'ctag.vim'


Plugin 'Winmanager'
"左上"
Plugin 'NERDTree'
"上方"
Plugin 'MiniBufExplorer'
"左下"
Plugin 'Taglist'
```
