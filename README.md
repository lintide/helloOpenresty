# 安装
```
$ brew install homebrew/nginx/openresty
```

# 运行 demo
```
$ git clone https://github.com/lintide/helloOpenresty

$ cd helloOpenresty

$ openresty -p `pwd` -c conf/ngnix.conf
```

在调试阶段，可以使用以下命令重新载入程序

```
$ openresty -s reload
```
