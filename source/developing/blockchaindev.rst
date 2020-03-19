=================
区块链相关开发
=================

为了不依赖于某一具体区块链底层技术，我们需要提供一层adapter对底层区块链进行封装，抽象出通用的接口以供上层应用
使用。各个区块链底层的厂商，可根据自己的实际情况对通用接口进行实现，并通过配置文件的修改达到与上层应用无缝对接
的目标。

adapter对业务系统提供统一的API接口，adapter服务可以通过配置选择使用一个或多个底层区块链网络，对关键数据进行保存。

区块链适配层服务API
---------------------------

创建用户
^^^^^^^^^^^^^

为每个用户在区块链上创建一条上链记录，保证用户的真实可靠，防止用户造假，所有上链的数据均关联到区块链上的唯一用户。

URL：/api/v1/blockchain/accounts
Method：POST
Request Example：
::

    {
        "account_id":"Unique user ID"
    }
    `account_id`:业务系统中用户的唯一标识

Response Example：
::

    {
        "id":"blockchain id"
    }
    `id`:区块链系统返回的唯一id

上链公示数据
^^^^^^^^^^^^^^^^^^

捐赠人或机构公示捐赠信息、公益机构接收或分发时，将公示信息记录到区块链上。

URL：/api/v1/blockchain/publicities
Method：POST
Request Example：
::

    {
        "uid":"blockchain user id",
        "publicity":"publicity json string"
    }
    `uid`:创建用户时区块链系统返回的唯一id
    `publicity`:公示数据的json字符串

Response Example：
::

    {
        "id":"blockchain id"
    }
    `id`:区块链系统返回的唯一id

数据上链结果异步通知
^^^^^^^^^^^^^^^^^^^^^^^^^

区块链系统写入数据结果，通过异步回调通知业务系统。

通知信息结果：
::

    {
        "blockchain":"arxanchain",
        "id":"blockchain id",
        "block_num": 2345,
        "tx_id": "",
        "time":1583826856
    }
    `blockchain`:底层区块链名称
    `id`:上链时区块链系统返回的唯一id
    `block_num`:上链数据在区块链中的区块编号
    `tx_id`:上链数据对应的唯一交易ID
    `time`:上链时间

接收到异步通知后业务系统返回处理结果：
::

    {
        "code":"success",
        "msg":""
    }
