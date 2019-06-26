# DepSubdirMakefile
A solution shows how to compile a project with dependency.
## Brief
DepSubdirMakefile is a tiny project shows how to compile a project which has multi-sub-directory with dependency. In the other words, one or more sub-directory need to be compile firstly bacause other sub-directory required. It's a common suitation in project and DepSubdirMakefile provides a easy and efficient solution. Notice that this DepSubdirMakefile only works on Linux or Unix-like environment.
## Requirement
- gnu-make
- a C compiler (need to be configured via environment varibale "CC")
## Directory Structure
- *build*: &nbsp;makefile entrace for building project.
- *code*: &nbsp;project code, inlude all sub-directory. And directory dep needed to be compiled firstly.
- obj: &nbsp;ouput directory during build.
- AUTHORS
- ChangLog
- LICENSE: &nbsp;DepSubdirMakefile is licensed under the [WTFPL2](https://wtfpl2.com).
- readme.html / readme-zh.html / README.md
- test.sh: &nbsp;one-key test script with Linux Shell format.
- VERSION: &nbsp;version code of DepSubdirMakefile
## How it works & How to make?
Directory dep is a dependency item and needed to be compiled to a dynamic library file(libdep.so) under obj firstly. There is only a add opertaion function in this dynamic library file. Each of other sub-directory will generate a excutable file(bacause of only one .c files under these directory) and try creating a dynamic link to libdep.so. Besides, every executable files have the same name with corresponding .c file add opertaion function will be called in these excutable files.
There are two ways to build this project:
- Execute makefile under directory build. You can get what paramter the makefile supports via  make help . Besides, you can choose which sub-directory which take part in build via command  make  + [name of sub-directory].It's noticed that this way only do build works. If you want to observe running results of target file, you need execute manually.
- Run test.sh. You can get what paramter the script supports via paramter  -h or  --help . This script can complete build works and run target executable files in one time.
## Contribution
You can pull request it or send e-mail to us if you have any words about this project.
