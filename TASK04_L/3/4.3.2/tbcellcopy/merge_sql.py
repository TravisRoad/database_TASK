import sys
import getopt
import os
import re


# def dealopt(argv):
#     inputfile = ''
#     outputfile = ''
#     try:
#         opts, args = getopt.getopt(argv, "hi:o:v:", ["idir=", "ofile=", "v="])
#     except getopt.GetoptError:
#         print('test.py -i <inputfile> -o <outputfile> -v <variety>')
#         sys.exit(2)
#     for opt, arg in opts:
#         if opt == '-h':
#             print('test.py -i <inputfile> -o <outputfile> -v <variety>')
#             sys.exit()
#         elif opt in ("-i", "--idir"):
#             inputfile = arg
#         elif opt in ("-o", "--ofile"):
#             outputfile = arg
#     print('输入的文件为：', inputfile)
#     print('输出的文件为：', outputfile)

def match(v):
    ptn = r".*\." + v
    lz = os.listdir()
    i = 0
    while i < len(lz):
        if re.match(ptn, lz[i]) == None:
            lz.pop(i)
            i -= 1
        i += 1
    return lz

def select(x):
    lz = list(x)
    if '0'<=lz[0]<='9':
        if '0'<=lz[1]<='9':
            return int(x[:2])
        else:
            return int(x[:1])
    else:
        return 0


def output(v: str):
    lz = match(v)
    lz.sort(key=select)
    for file in lz:
        with open(file, "r", newline="", encoding="utf-8") as f:
            lzz = f.readlines()
            print("- " + file)
            print("```"+v)
            for line in lzz:
                if line[-2:] == '\r\n':
                    print(line[:-2])
                else:
                    print(line)
            print("```\n")

output("sql")
