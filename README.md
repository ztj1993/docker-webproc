# ztj1993/webproc

## 相关链接
- [Reference](https://github.com/jpillora/webproc)
- [DockerHub](https://hub.docker.com/r/ztj1993/webproc)

## 简要说明

这个镜像构建了 [jpillora/webproc](https://github.com/jpillora/webproc) 服务。

发布版本号跟随服务版本号。

## 快速开始

运行 webproc 镜像：
```
docker run -d --name webproc -p 8080:8080 ztj1993/webproc
```

## 环境变量

环境变量主要是对 rttys 的配置。

- PORT: 应用端口，默认 8080
- HTTP_USER: 认证用户
- HTTP_PASS: 认证密码
