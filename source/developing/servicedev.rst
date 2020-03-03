=================
后端开发
=================

环境准备
~~~~~~~~~~~~~~

* golang: 需要golang 1.12或更高版本
* IDE： GoLand、VSCode或其他IDE，根据个人习惯喜好选择即可

代码框架
~~~~~~~~~~~~~~

后端项目GitHub地址: https://github.com/csiabb/donation-service

后端代码目录说明：
::

    +- donation-service
      |- common  后端服务的通用基础模块
      | |- common/log  服务日志模块
      | |- common/rest  服务对外rest接口统一数据封装
      | |- common/metadata  服务版本定义
      |- components  服务依赖的第三方组件封装
      | |- components/database  依赖数据库组件封装
      |- config  服务配置文件结构与解析
      |- context  服务上下文
      |- controllers  服务业务处理实现，按照功能划分组
      | |-controllers/version  服务版本信息查询接口实现
      |- middleware  服务中间件，通过middleware处理后进入业务层处理
      |- models  数据库结构、访问接口定义
      | |-models/impl  数据库访问接口实现
      |- router  服务rest访问接口路由
      |- sampleconfig  服务配置文件
      |- service  后端服务实例
      |- main.go  后端服务进程入口
      |- Makefile  后端项目makfile
      |- README.md  项目readme文档

项目基本规范
~~~~~~~~~~~~~~~~~

文件注释
^^^^^^^^^^^^^^^^

所有新增文件开头必须包含文件注释，注释包含：个人或公司信息（根据自己信息填写）、开源协议。修改已有文件不需要修改文件注释。

注释示例：
::

    /*
    Copyright ArxanChain Ltd. 2020 All Rights Reserved.

    SPDX-License-Identifier: Apache-2.0
    */

import包格式
^^^^^^^^^^^^^^^^

import包分为三部分：系统依赖包、项目自身依赖包、第三方依赖包

import示例：
::

    import (
        "fmt"
        "os"

        "github.com/csiabb/donation-service/common/log"
        "github.com/csiabb/donation-service/common/metadata"
        "github.com/csiabb/donation-service/config"
        "github.com/csiabb/donation-service/service"

        "gopkg.in/alecthomas/kingpin.v2"
    )

API接口URL命名规范
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

本项目对外接口采用RESTful API，所有接口的路径（Endpoint）不使用动词，只使用名词的复数格式；对于操作
由HTTP动作表示：

::

  GET：从服务获取数据
  POST：提交数据到服务

示例：

::

  GET /zoos：列出所有动物园
  POST /zoos：新建一个动物园

单元测试
~~~~~~~~~~~~~~~

为了保障项目代码的质量，项目已集成支持单元测试检查，实现代码时需要实现相应的代码的单元测试。单元测试的第三方依赖使用mock方式解耦。

增加单元测试后，需要在本地运行，保证所有单元测试代码可正常运行，否则代码无法提交到项目中，单元测试检查，可以通过执行**make test**。

编译运行
~~~~~~~~~~~~~~

在项目目录下直接执行make命令即可，默认构建生成项目的二进制，输出路径为build/bin，同时会将sampleconfig下配置文件拷贝到输出目录下。

服务部署
~~~~~~~~~~~~~~

为了方便服务的部署运维，项目支持docker方式部署。

* 生成docker镜像

  在linux系统环境下，直接执行make docker命令即可生成后端服务的docker镜像（csiabb/donation-service）

* 镜像使用说明

  后端服务默认监听服务地址为8888端口

  配置文件路径：/etc/csiabb/donation-service.yaml

  日志输出路径：/var/log/csiabb

  服务数据路径：/opt/csiabb/data

* 启动服务示例

  docker run --name donation-test --hostname donation --restart always 
  -v /data/docker/volumes/donation/conf/donation-service.yaml:/etc/csiabb/donation-service.yaml 
  -v /data/docker/volumes/donation/log:/var/log/csiabb 
  -v /data/docker/volumes/donation/data:/opt/csiabb/data 
  -p 8080:8888 -d csiabb/donation-service

* compose文件参考

::

  version: '2.1'
  services:
    donation:
      container_name: donation
      hostname: donation
      image: csiabb/donation-service
      restart: always
      logging:
        driver: "json-file"
        options:
          max-size: "100m"
          max-file: "10"
      ports:
        - "8888:8888"
      volumes:
        - "/data/docker/volumes/donation/conf/donation-service.yaml:/etc/csiabb/donation-service.yaml"
        - "/data/docker/volumes/donation/data:/opt/csiabb/data"
        - "/data/docker/volumes/donation/log:/var/log/csiabb"
      labels:
        service.type: "csiabb"
        service.name: "donation-service"

项目依赖管理
~~~~~~~~~~~~~~~~~~~~~

本项目采用golang module方式管理依赖包，新增或移除golong module，可通过**make mod**命令直接优化项目的依赖。

关于go mod的更多使用，可以参与如下链接：

    https://studygolang.com/articles/17575/comment/23763
