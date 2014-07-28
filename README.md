#1 bashrc配置

![](https://github.com/taizilongxu/vim_set/raw/master/pic/1.png)

只需在.bashrc中加入

```bash
PS1="\[\e[37m\][\[\e[31m\]\u\[\e[37m\]@Pig \t\[\e[35m\]\w #\#\[\e[37m\]]\\$\[\e[37m\]"
```

#2 vim插件

以下配置均在根目录的.vimrc文件中配置,墙裂建议用vundle管理vim插件方便快捷(全部用vundle添加插件)
vundle地址:https://github.com/gmarik/Vundle.vim
下面的只做演示，具体配置均在.vimrc文件中

##2.1 Powerline和Molokai，Solarized

三个插件均为美化

推荐等级:5星

![](https://github.com/taizilongxu/vim_set/raw/master/pic/2.png)

```vim
Plugin 'vim-powerline'
Plugin 'molokai'                      " 配色
Plugin 'Solarized'                    " 配色
```

powerline是一款非常好看的状态栏,它基于python,还有一款叫做airline非常轻量级,但感觉还是每powerline好看一些.
Molokai和Solarized大名鼎鼎的配色，不多说
if下边的对齐线是一款叫做indentline的插件，新版的vundle不知道为什么没有找到，可以自己搜索下载

##2.2　Nerdtree,winmanager,taglist,minibufexpl和ctags

推荐等级:４星

从别人转来的，非常实用http://blog.csdn.net/bokee/article/details/6633193

![](https://github.com/taizilongxu/vim_set/raw/master/pic/1.gif)

```vim
Plugin 'The-NERD-tree'
Plugin 'winmanager'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'              " buffer插件
Plugin 'ctags.vim'
```
1. 在vim的normal模式下直接按```wm```调出界面
2. <C + h,j,k,l>可以切换各个分区
3. minibufexpl只能在多个窗口下才显示

##2.3 FuzzyFinder

文件查找插件

推荐等级:４星

![](https://github.com/taizilongxu/vim_set/raw/master/pic/2.gif)


```vim
Plugin 'L9'                           " FuzzyFinder依赖包
Plugin 'FuzzyFinder'                  " 文件快速查找
```

1. 绑定```,,```作为启动
2. ```<C + n,p>```上下翻页
3. 设置的是精确匹配
4. 查找的是当前目录下的文件

##2.4 ultisnips

快速补全插件，妈妈再也不用担心我加班了

推荐等级:４星

![](https://github.com/taizilongxu/vim_set/raw/master/pic/３.gif)

```vim
Plugin 'SirVer/ultisnips'             " Track the engine.
Plugin 'honza/vim-snippets'           " Snippets are separated from the engine. Add this if you want them: Plugin '
```
1. 在~/.vim/bundle/vim-snippets/snippets/python.snippets下可以自定义对应的补全函数
2. ```<C + b,z>```在定义变量出切换
3. ```<tab>```键触发

##2.5 Tabular

也许你需要注释代码更整齐，那么你就得需要这个插件了

推荐等级:3星

![](https://github.com/taizilongxu/vim_set/raw/master/pic/４.gif)
图片操作为```vG:Tab /=```，其中的＝可以替换成需要的符号

```vim
Plugin 'Tabular'                      " 注释等格式对齐插件
```

##2.5 commentary

注释多行，比较常用

推荐等级:４星

![](https://github.com/taizilongxu/vim_set/raw/master/pic/５.gif)

操作```vGgcc```

```vim
Plugin 'commentary.vim'               " 注释多行
```

1. gc注释一行
2. gcc注释多行

##2.6 surround

有时候一些单词或断句需要用引号圈起来，那么这个插件比较有用处啦，推荐这个文章http://blog.csdn.net/lalor/article/details/8095512　，介绍的挺详细的

推荐等级:3星


```vim
Plugin 'surround.vim'                 " 补全括号或引号等cs,ds,yss
```

```
Normal mode
-----------
ds  - delete a surrounding
cs  - change a surrounding
ys  - add a surrounding
yS  - add a surrounding and place the surrounded text on a new line + indent it
yss - add a surrounding to the whole line
ySs - add a surrounding to the whole line, place it on a new line + indent it
ySS - same as ySs

Visual mode
-----------
s   - in visual mode, add a surrounding
S   - in visual mode, add a surrounding but place text on new line + indent it

Insert mode
-----------
<CTRL-s> - in insert mode, add a surrounding
<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
<CTRL-g>s - same as <CTRL-s>
<CTRL-g>S - same as <CTRL-s><CTRL-s>
```

##2.7 rainbow_parentheses

括号颜色增强，比较漂亮

![](https://github.com/taizilongxu/vim_set/raw/master/pic/3.png)

```vim
Plugin 'kien/rainbow_parentheses.vim' " 括号增强,彩色
```