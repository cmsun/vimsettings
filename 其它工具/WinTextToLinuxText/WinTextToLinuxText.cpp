#include <stdio.h>
#include <string.h>
#include <string>
#include <vector>
using namespace std;

//可以使用dos2unix命令来完成一样的功能

#define SIZE 2048

int main(int argc, char *argv[])
{
    char buff[SIZE];
    unsigned len;
    FILE *fpin = NULL, *fpout = NULL;
    vector<string> args;
    string outname;

    //第一个参数为程序名（C语言标准默认），第2个参数为输入参数
    if(argc <= 1)
    {
        //从屏幕获取文件名，因此支持管道操作
        //scanf("%s%s", args, ch);

        while(gets(buff) != NULL)
        {
            args.resize(args.size() + 1);
            args.back().assign(buff);
        }
    }
    else
    {
        for(int i = 1; i < argc; i++)
        {
            args.resize(args.size() + 1);
            args.back().assign(argv[i]);
        }
    }

    for(unsigned int i = 0; i < args.size(); i++)
    {
        fpin = fopen(args[i].c_str(), "rb");
        if(fpin == NULL)
        {
            printf("can not open the input file: %s", args[1].c_str());
            continue;
        }

        outname = args[i] + "~";

        fpout = fopen(outname.c_str(), "wb");
        if(fpout == NULL)
        {
            printf("can not create output file: %s", outname.c_str());
            fclose(fpin);
            continue;
        }

        //从文件读取内容,当读到最后的内容的时候feof()不会返回true,只有读到最后内容的之后的内容才会返回true
        fgets(buff, SIZE, fpin);
        while(!feof(fpin))
        {
            len = strlen(buff);
            if(len > 3 && (unsigned char)buff[len-2] == 0x0d && (unsigned char)buff[len-1] == 0x0a)
            {
                ((unsigned char *)buff)[len-2] = 0x0a;
                ((unsigned char *)buff)[len-1] = '\0';
            }
            fputs(buff, fpout);
            fgets(buff, SIZE, fpin);
        }

        fclose(fpin);
        fclose(fpout);
        remove(args[i].c_str());
        rename(outname.c_str(), args[i].c_str());
    }
}
