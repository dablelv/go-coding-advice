# 1.前言
不管是什么语言，开发什么项目，一个稍大的项目，必然要面临如何管理项目结构布局的问题，因为一个简洁清晰的布局是项目可读的关键。

有些语言自身提供了目录结构规范，但对于较为年轻的 Golang，目前官方团队并未提供权威规范。不过不用担心，我们依然有一个规范可以参考，那就是业界推崇的 [Standard Go Project Layout](https://github.com/golang-standards/project-layout)。

# 2.项目布局
## 2.1 整体风格
你的项目结构布局看起来应该像下面这个样子。
```shell
# Go 代码目录
|--cmd 可执行文件目录
|--internal 私有库代码（仅本项目使用）
|--pkg 公有库代码（外部项目可以使用）
|--vendor 外部依赖库

# 服务应用程序目录
|--api 服务对外接口

# Web 应用程序目录
|--web Web 应用程序的组件

# 通用应用目录
|--configs 配置信息
|--init 初始化信息
|--scripts 执行各种构建、安装、分析等操作的脚本
|--build 打包和持续集成
   |-- package 构建依赖包
   |-- ci 持续集成配置与脚本
|--deployments 部署相关
|--test 测试相关
|--README.md 项目说明

# 其他目录
|--docs 项目文档
|--tools 项目工具
|--examples 应用程序和公共库的示例
|--third_party 外部辅助工具
|--githooks Git 钩子
|--assets 项目资源文件
|--website 项目网站数据

# 不应该拥有的目录
|--src 源码目录
```
## 2.2 Go 代码目录
### /cmd
可执行文件目录。

通常只包含一个简单的 main 函数，调用 /internal 和 /pkg 中的代码，作为项目的主应用目录。目录也可以包含多个可执行文件，子目录名称一般与可执行文件相对应（如：/cmd/myapp ）。

不要在该目录下放太多的代码，如果代码可以被其他项目导入使用，请放到 /pkg 目录下， 如果代码不可复用或者你不希望其他项目使用，请放到 /internal 目录下。

### /internal
私有库代码（仅本项目使用）。

这里放不希望被其他应用程序或者库导入的代码。注意：从 Go1.4 起，从编译器层面限制该目录不可被导出，而且不只是项目根目录下的 internal，所有名为 internal 的子目录都不能被导出。

你还可以在 internal 目录内部增加一些代码结构来区分共享和非共享的。虽然它并不是必须的（尤其是小的项目），但是最好能从视觉上区分包的用途。 你实际的代码可以放在 /internal/app/myapp 中，而应用的共享代码可以放在 /internal/pkg/ 目录下。

### /pkg
公有库代码（外部项目可以使用）。

这里放希望被其他应用程序或者库导入的代码，所以在这里放东西之前要三思。

含有 /pkg 目录的项目结构是一种常见的布局模式，但并不是所有人都接受它，一些 Go 社区的人并不推荐它。

### /vendor
外部依赖库。

如果手动管理依赖包可以将依赖包放到该目录，当然推荐使用依赖包管理工具 [Go Modules](https://github.com/golang/go/wiki/Modules) 进行自动化管理。

注意，1.11 开始，官方推荐使用新的依赖管理系统 [Go Modules](https://github.com/golang/go/wiki/Modules)。从 1.13 以后，Go 还启用了模块代理功能(默认使用 https://proxy.golang.org 作为他们的模块代理服务器)。使用 Go Modules，我们并不需要 vendor 目录。

## 2.3 服务应用程序目录
### /api
服务对外接口。

这里是服务对外接口的实现，定义接口时，我们应该遵循 [OpenAPI Specification](https://spec.openapis.org/oas/latest.html)。

## 2.4 Web 应用程序目录
### /web
存放 Web 应用程序特定组件，如静态 Web 资源、服务器端模板和 SPA（Single Page Application）。

## 2.5 通用应用目录
### /configs
配置信息。

如不同环境（测试、正式）的服务配置信息。

### /init
初始化信息。

系统初始化（systemd, upstart, sysv）和进程管理（runit, supervisord）配置。

### /scripts
执行各种构建、安装、分析等操作的脚本。

这些脚本帮助根目录下 Makefile（如果有的话）变得小而简单，例如 [github/hashicorp/terraform/Makefile](https://github.com/hashicorp/terraform/blob/master/Makefile)。

### /build
打包和持续集成。

将你的云( AMI )、容器( Docker )、操作系统( deb、rpm、pkg )包配置和脚本放在 /build/package 目录下。

将你的 CI (travis、circle、drone)配置和脚本放在 /build/ci 目录下。

### /deployments
部署相关。

如 IaaS、PaaS、系统和容器编排部署配置和模板(docker-compose、kubernetes/helm、mesos、terraform、bosh)。注意，在一些存储库中(特别是使用 kubernetes 部署的应用程序)，这个目录被称为 /deploy。

### /test
测试相关。

如放置测试工具和测试依赖数据。对于较大的项目，有一个数据子目录是有意义的。例如，你可以使用 /test/data 或 /test/testdata。请注意，如果你需要忽略目录中的内容，Go 还会忽略以“.”或“_”开头的目录或文件，因此在如何命名测试数据目录方面有更大的灵活性。

### /README.md
项目说明。

Markdown 格式的说明文档，是用户了解一个项目最直观的入口。如果有需要，添加不同语言的 README 将更加人性化，如 简体中文 README_zh-CN.md。

## 2.6 其他目录
### /docs
项目文档。

关于项目的设计文档，用户的使用文档等（除了 godoc 生成的文档之外）均可以放在该目录。

### /tools
项目工具。

项目配套工具，实现这些工具可以使用从 /pkg 和 /internal 导入代码。

### /examples
应用程序和公共库的示例。

丰富的示例将帮助用户更加便捷快速的了解上手一个项目，再加上 README，相得益彰。

### /third_party
外部辅助工具。

项目依赖的第三方工具，比如 Swagger UI。

### /githooks
Git 钩子。

使用 Git 钩子，可以帮忙我们在代码提交时完成一些检测，比如分支名称和 commit 信息是否符合规范。

### /assets
项目资源文件。

项目用到的相关资源文件，比如项目 Logo，README 中引用的图片等。

### /website
项目网站数据。

如果你不使用 Github 页面，则在这里放置项目网站数据。

## 2.7 不应该拥有的目录
### /src
源码目录。

有些 Go 项目确实有一个 src 目，但这通常发生在开发人员有 Java 背景。不同类型的代码应该有自己的目录，而不是全部放到 src 下面，就像不应该拥有 comm 和 util 这样的目录，因为这些名称含义太泛了，违背了单一职责原则。

# 3.小结
这是 Go 应用程序项目的基本布局，是社区 Gopher 们努力的结果。此项目布局是通用的，建议并非强制，当然我们最好遵守，因为这能让我的项目布局看起来更加规范，易于交流和维护。

如果发现此项目布局规范并不适用自己的项目，可在其基础上适当做出改变，不要泥古拘方。

---
# 参考文献
[Standard Go Project Layout](https://github.com/golang-standards/project-layout)
[Wikipedia List of ISO 639-1 codes](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
[Official ISO 639 list](https://www.loc.gov/standards/iso639-2/php/English_list.php)