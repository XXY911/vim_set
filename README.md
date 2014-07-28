#1 bashrc配置

![](https://github.com/taizilongxu/vim_set/raw/master/pic/1.png)

只需在.bashrc中加入

```bash
PS1="\[\e[37m\][\[\e[31m\]\u\[\e[37m\]@Pig \t\[\e[35m\]\w #\#\[\e[37m\]]\\$\[\e[37m\]"
```

#2 vim插件

以下配置均在根目录的.vimrc文件中配置,墙裂建议用vundle管理vim插件方便快捷(全部用vundle添加插件)
vundle地址:https://github.com/gmarik/Vundle.vim

##2.1 FuzzyFinder

```vim
Plugin 'L9'                           " FuzzyFinder依赖包
Plugin 'FuzzyFinder'                  " 文件快速查找
```





