==========================
参与方式
==========================

开源社区健康良好的发展，离不开各界人士积极的参与，这些人聚集在一起，为了共同目标而一起努力。大家可以通过多种方式为社区
做出贡献，目前所有参与社区贡献的组织和个人名单，请参见 :ref:`维护人员名单 <refMaintainers>`，
:ref:`参与组织名单 <refParticipate>`。

* 做为社区开发项目的使用者

    - :ref:`提交新功能或改进建议 <refFeatureProposal>`
    - `报告Bug`_
    - 帮助测试 :ref:`版本发布计划 <refReleasePlan>` 中提及的功能

* 做为项目的开发者

    - 如果你不能够全职为社区项目进行开发工作，那么建议你从 :ref:`项目管理工具 <refProjectTool>` 中选择那些标记
      为 **help-wanted** 还无人认领的任务（task），并开始相应的工作。
    - 如果你能够为社区项目进行全职开发工作，那么建议你既可以提交新的feature（参见
      :ref:`提交新功能或改进建议 <refFeatureProposal>`）并与自己组建的团队一起去实现它，也可以申请加入到现有的
      团队中，与他们一起完成已有的一些功能开发。你也可以根据自己擅长的领域去 :ref:`项目管理工具中 <refProjectTool>`
      中认领那些尚无人认领的，且优先级较高的feature。


获得帮助
===============

你可以随时通过社区提供的 :ref:`沟通交流工具 <refCommunicateTool>` 或者直接联系
:ref:`相关维护人员 <refMaintainers>` 获取你想得到的帮助，你所提出的问题也可以反过来帮助更多的人，让社区更加活跃，也让
项目相关的文档更加清晰。

报告Bug
===============

如果你发现了项目软件上的或文档相关的Bug，首先应该在 :ref:`Bug管理工具 <refBugReport>` 中查找是否已经有人报告过类似的
问题，如果已经有类似的问题，你可以在其上添加自己的comments，也可以提交自己的fix。如果没有发现，那么非常欢迎你创建Bug给
开源项目，并请确保提供足够详细的信息 （应该尽量包括：复现步骤、运行环境、软件版本、屏幕截图、错误日志/信息、期望的正确行为
等），以方便相关人员定位问题。

提交代码及规范
===================

如果你准备为某个bug提交自己的fix，或为某个任务提交自己的实现前，请先将Bug/Task指派给自己，然后再提交你的Pull Request
（PR）。PR的提交流程可以参考如下文档：

  https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests
  https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork


Review代码
====================

帮助提交者和维护人员review代码，是对开源社区最大的贡献之一，也能帮助你更好的了解项目。维护人员决定PRs是否可以被merge，
而你在review时提供的建议和测试PR的结果也可以为大家提供非常重要的参考。一旦你对PR review或测试完成后，可以将你所发现
的做为comments添加到PR中，或者对该PR +1/-1。


什么是一个好的PR
=====================

* 一个PR只包含对一个问题的修改，这样方便reviewer理解；
* PR中应该包含Bug/Task的链接，方便大家了解这个PR的来龙去脉，节省reviewer查找的时间；
* 应该包含相应的单元测试以及集成测试，可以减少系统的regression，提高代码质量，也避免你的修改会break其他已有的功能，
  同时方便CI/CD集成；
* 单元测试需要避免对外部系统的依赖，例如：数据库，消息中间件，缓存等，以避免其他开发人员无法在自己的环境中，顺利的
  运行测试代码；
* 一个PR中尽量避免300 LOC，否则review一些超大的PR会成为维护人员不可能完成的任务，所以尽量将过于庞大的PR拆分成独立的，
  让人容易理解的，并且能够独立测试的小的PR，分批次来提交；
* commit message应该尽可能的准确，包括一行不超过50个字符的，能说明本次提交目的的标题，之后空一行，再详细描述本次提交
  的内容。每一个commit message的标题都应该包含其相关联Bug/Task的唯一标识，（例如：[DOW-12345]），以方便项目管理上
  的归类。

.. note::
  commit message的一个例子::

        [DOW-12345] 修复首页搜索框无法输入的问题

        原来的输入框只允许输入数字，现在改成使用textField，允许输入
        任何字符。

法律相关
===================

**注意：** 每一个源代码文件的头部都必须包含一段关于Apache Software License 2.0的说明，相关license头模板，请参见：
:ref:`license头模板 <refLicenseHeader>`。

为了让每一位代码贡献者更加简单和方便，我们沿用了Linux® Kernel社区所使用的，与代码贡献相关的法律文档：
`the Developer’s Certificate of Origin 1.1 (DCO) <https://github.com/csiabb/documents/source/related-docs/DCO1.1.txt>`_。


当你在提交patch时，必须在commit meesage中包含一个sign-off的声明。声明如下所示，则表明你已经接受了上述法律条款：
::

    Signed-off-by: John Doe <john.doe@example.com>


使用如下命令，可以自动的将上述声明添加到你的commit message中。
::

    git commit -s
