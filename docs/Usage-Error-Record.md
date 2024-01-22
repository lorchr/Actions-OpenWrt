# 使用问题记录
## 1. 修改配置出现 `一些项目的值无效,无法保存!`
   1. 检查主机名中是否有空格 括号等特殊字符，这些字符会报错

## 2. Mosdns编译失败
```shell
go_oldversion.go:5:13: cannot use "The version of quic-go you're using can't be built using outdated Go versions. For more details, please see https://github.com/quic-go/quic-go/wiki/quic-go-and-Go-versions." (untyped string constant "The version of quic-go you're using can't be built using outdated Go...) as int value in variable declaration
```

原因是 [quic-go](https://github.com/quic-go/quic-go) 与 [go](https://github.com/golang/go) 的版本不兼容

1. 移除mosdns编译 `.config`
```conf
CONFIG_PACKAGE_mosdns=n
CONFIG_PACKAGE_luci-app-mosdns=n
```

2. [替换旧的mosdns包](https://www.oomake.com/question/15654714) `actions.yaml` 
```shell
# fixed mosdns
rm -rf ./feeds/packages/net/mosdns
cp -r -f ./feeds/第三方源的文件 ./feeds/packages/net/mosdns
```

3. [升级go版本](https://www.right.com.cn/forum/forum.php?mod=viewthread&tid=4057579&page=1#pid10551566) `actions.yaml`
```shell
- name: Setup Go version
  uses: actions/setup-go@v4
  with:
    go-version: 'stable'
```

## 3. 同样的脚本，之前运行正常，后面运行出错
这一般是由于源码更新，导致某些依赖、插件不兼容，过一段时间再执行就可以了
