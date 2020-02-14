# 编写项目文档

所有与项目相关的文档，包括：项目介绍、项目管理、版本说明、贡献方式、技术标准等，都以reStructuredText（rst）格式提供，并放在source目录下。

一些有关rst文档格式的说明可以参考以下文档：

http://www.pythondoc.com/sphinx/rest.html

https://www.cnblogs.com/seayxu/p/5603876.html

https://docutils.readthedocs.io/en/sphinx-docs/user/rst/quickstart.html

https://docutils.readthedocs.io/en/sphinx-docs/ref/rst/directives.html

# 编译html文档

这些项目文档可以通过以下方式编译成html文件，并方便的通过浏览器进行浏览。

在编译之前需要预先安装以下软件：
* Python3
* Pip

然后运行如下命令，成功后用浏览器打开 `build/html/index.html` 进行阅读：
``` bash
make all

```
