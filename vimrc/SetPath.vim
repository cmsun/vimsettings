" 把这个文件放在vim的任意plugin文件夹中，vimrc中会使用“runtime! plugin/SetPath.vim”指令加载这个脚本

if g:isWindows
    let $SYS_PATH = 'E:\ProgramFiles\mingw-w64\x86_64-6.1.0-posix-seh-rt_v5-rev0\mingw64\x86_64-w64-mingw32\include'
    let $CPP_PATH = 'E:\ProgramFiles\mingw-w64\x86_64-6.1.0-posix-seh-rt_v5-rev0\mingw64\lib\gcc\x86_64-w64-mingw32\6.1.0\include\c++'
    let $QT_PATH = 'E:\ProgramFiles\Qt\Qt5.6.0\5.6\mingw64_5.3.0\include'
    let $PYTHON2_PATH = 'E:\ProgramFiles\Python27\Lib'
    let $PYTHON3_PATH = 'E:\ProgramFiles\Python34\Lib'
    let $FOLDER_PATH = 'E:\TagsFiles'
else
    let $SYS_PATH = '/usr/include'
    let $CPP_PATH = '/usr/include/c++/4.8'
    let $QT_PATH = '/opt/Qt5.2.1/5.2.1/gcc_64/include'
    let $PYTHON2_PATH = '/usr/lib/python2.7'
    let $PYTHON3_PATH = '/usr/lib/python3.4'
    let $FOLDER_PATH = '/home/scm/.vim/TagsFiles'  "不能使用~/.vim/TagsFiles路径
endif

"设置gf命令的搜索路径（光标定在头文件上按下gf打开头文件）
"用"\\"代替路径中的"\"，用"\\\ "代替路径中的空格
if g:isWindows
    set path+=.
    set path+=C:\\Program\\\ Files\\\ (x86)\\Borland\\CBuilder6\\Include
    set path+=C:\\Program\\\ Files\\\ (x86)\\Borland\\CBuilder6\\Include\\Vcl
    set path+=C:\\Program\\\ Files\\\ (x86)\\Borland\\CBuilder6\\Include\\Stlport
    set path+=E:\\ProgramFiles\\mingw-w64\\x86_64-6.1.0-posix-seh-rt_v5-rev0\\mingw64\\x86_64-w64-mingw32\\include
    set path+=E:\\ProgramFiles\\mingw-w64\\x86_64-6.1.0-posix-seh-rt_v5-rev0\\mingw64\\x86_64-w64-mingw32\\include\\c++
    set path+=E:\\ProgramFiles\\mingw-w64\\x86_64-6.1.0-posix-seh-rt_v5-rev0\\mingw64\\x86_64-w64-mingw32\\include\\c++\\profile
    set path+=$QT_PATH
    set path+=$QT_PATH\\QtCore
    set path+=$QT_PATH\\QtGui
    set path+=$QT_PATH\\QtWidgets
    set path+=$QT_PATH\\QtNetwork
    set path+=$QT_PATH\\SerialPort
else
    set path+=.
    set path+=$SYS_PATH
    set path+=$CPP_PATH
    set path+=$CPP_PATH/profile
    set path+=$QT_PATH
    set path+=$QT_PATH/QtCore
    set path+=$QT_PATH/QtGui
    set path+=$QT_PATH/QtWidgets
    set path+=$QT_PATH/QtNetwork
    set path+=$QT_PATH/SerialPort
endif
