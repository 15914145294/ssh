# 替换指定字符串
sed 's/old/new/' file
# 只打印匹配的行
sed -n 's/old/new/p' file
# 直接编辑文件
sed -i 's/old/new/' file
# 全局替换
sed -i 's/old/new/g' file
# 从第n处开始替换
sed -i 's/old/new/Ng' file
# 删除空白行
sed '/^$/d' file
# 作为界定符
[devuser@xinkehu-2 scripts]$ echo sksksksksksk | sed 's:sk:SK:4g'
skskskSKSKSK
[devuser@xinkehu-2 scripts]$ echo sksksksksksk | sed 's|sk|SK|4g'
skskskSKSKSK
# 界定符出现在样式中时，需要进行转译
[devuser@xinkehu-2 scripts]$ echo '/usr/local/bin' | sed 's/\/usr\/local\/bin/\/USR\/LOCAL\/BIN/g'
/USR/LOCAL/BIN

# 删除文件的第二行
sed '2d' file
# 删除文件第二行至最后一行
sed '2d,$d' file
# 删除文件最后一行
sed '$d' file
# 删除所有已my开头的行
sed '/^my/'d file

# 正则表达式\w\+匹配每一个单词，使用[&]替换它，&对应之前所匹配到的单词
[devuser@xinkehu-2 scripts]$ echo this is a test line | sed 's/\w\+/[&]/g'
[this] [is] [a] [test] [line]

# 匹配给定样式中的一部分
[devuser@xinkehu-2 scripts]$ echo just TEST |sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/'       
TEST just

# 打印从第5行开始到第一个包含以this开始的行之间的所有行
sed -n '5,/^this/p' test1.txt
# -e可以执行多个命令 e-->expression
sed -e '1,5d' -e 's/my/MY/g' file

# -r 读入指定的文件内容 并置于匹配的文件行之后,如果匹配到多行，则放置于所有匹配到的行下
sed '/matched/r file' file

# 将test中所以This开头的行写入test1中
sed '/This/w test1' test
# 将行追加到匹配的行之后
sed '/This/a\just shell test' test.txt
# 在指定的行追加
sed '2a\just shell test'  test.txt
# 强内容插入到匹配行的前面
sed '/^This/i\shell insert test' test.txt
# 匹配到以my开头的行，将匹配行的下一行替换为指定的内容
sed '/^my/{n;s/This/this/g;}' file

# 将1,10行内匹配到字符串全部替换为大写
sed '1,10y/abcde/ABCDE/' test.txt

# 打印三行，退出sed
sed '3q' test.txt

# 打印奇数行
sed -n 'p;n' test.txt
sed -n '1~2p' test.txt
# 打印偶数行
sed -n '2~2p' test.txt
sed -n 'n;p' test.txt
