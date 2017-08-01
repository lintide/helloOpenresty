# 安装
```
$ brew install homebrew/nginx/openresty
```

# 运行 demo
```
$ git clone https://github.com/lintide/helloOpenresty

$ cd helloOpenresty

$ openresty -p `pwd` -c conf/nginx.conf
```

在调试阶段，可以使用以下命令重新载入程序

```
$ openresty -s reload
```

# 指令

# API

# 向外发起 http 请求

我们以上的介绍都是把 openresty 作为 http 服务器，但我们在处理某些事务需要跟外部服务协助，向外部 http 服务发起请求时该怎么办呢？这里介绍一个库

[lua-resty-http](https://github.com/pintsized/lua-resty-http)

1. 下载库
  ```
  $ mkdir libs
  $ cd libs
  $ git clone https://github.com/pintsized/lua-resty-http
  ```

2. 在 nginx.conf 文件中设置库文件搜索路径
  ```
  http {
      lua_package_path "libs/lua-resty-http/lib/?.lua;;";

      server { ... }
  }
  ```

3. 使用 lua-resty-http

  `app/httpc.lua`
  ```lua
  local http = require "resty.http"
  local httpc = http.new()
  local res, err = httpc:request_uri("http://httpbin.org/get", {
    method = "GET"
  })

  if not res then
    ngx.say("failed to request: ", err)
    return
  end

  ngx.say(res.body)
  ```

4. https 请求

  出现错误：`self signed certificate in certificate chain`

  解决方案
  ```lua
  local res, err = httpc:request_uri("https://github.com/", {
    method = "GET",
    ssl_verify = false,
  })
  ```

# Tests

use vs code plugin **REST Client**

###
GET http://localhost:8080/mysql

###
GET http://localhost:8080/redis
