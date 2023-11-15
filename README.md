![在这里插入图片描述](/assets/imgs/banner.png)

# 本书由来

Go 语言自 2009 年诞生以来，因其出色的并发能力、高效的性能和简洁的语法，已在各大厂商的后台高并发业务场景崭露头脚，甚至有取代传统后台服务开发语言 C++ 和 Java 之势。

Go 不仅易用，也很易学，这得益于与之匹配的丰富学习资料。[Go 官方网站](https://go.dev/doc/)已有系统全面的指导文档，新手可以快速通过官方资料，轻松上手。此外，第三方资料，也有百家争鸣之势。有介绍 Go 
语言基础和实战的，有对 Go 源码进行剖析介绍实现原理的，有介绍高并发场景下实战指导的，也有介绍使用 Go 进行高性能编程的，等等。很遗憾的是，没有发现一个系统介绍 Go 编码建议的，因此，本书应运而生。

本书[《Go 编码建议》](https://github.com/dablelv/go-coding-advice)所述内容谈不上是 Go 的最佳实践，但希望能够帮助广大 Gopher 向 Go 的最佳实践迈出更近一步。

# 内容简介

各个公司或组织，都有各自不同的 Go 编码规范，但大同小异。规范是一种倡导，不遵守并不代表错误，但当大家都遵守规范时，你会发现，整个世界将变得整洁有序。

本文结合官方编码建议，大厂编码规范、开源技术书籍和自身项目经验，尽可能以简短的语言给出一套行之有效 Go 编码建议，让您的代码高效易读。

本书主要分为四个方面：

- 项目布局

项目布局参考业界认可度较高的 [Standard Go Project Layout](https://github.com/golang-standards/project-layout)，给出布局建议。一个清晰的项目结构，能帮忙我们高效有序的管理与日俱增的业务代码。不会随着代码量的递增，项目代码变得凌乱而不堪入目。

- 编码风格

编码风格从简洁易读的角度出发，参考 Go 官方 [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
，并结合自身项目团队编码规范，力争给出全面、认可度较高的编码风格，帮助大家写出风格统一的简洁高效的代码。

- 功能实践

Go 虽然简单，但其功能特性却不单一。其丰富的语言特性，在使用时还是有很多不同的姿势。本书从功能特性出发，给出 Go 实践建议，帮助我们更好的使用 Go 写出更优质的代码。

- 高性能编码

高效的代码是我们每一个 coder 的共同追求。为书写效率更高的代码，本文将结合 Go 语言特性，从常用数据结构、内存管理和并发，三个方面给出相关建议。

本文所述内容均为参考意见，并非标准。其中许多是 Go 的通用准则，其他扩展内容也参考了很多官方指南，包括但不限于。
- [Effective Go](https://golang.org/doc/effective_go.html)
- [Golang Wiki | Go Common Mistakes](https://github.com/golang/go/wiki/CommonMistakes)
- [Golang Wiki | Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
- [The Go Programming Language Specification](https://golang.org/ref/spec)
- [The Go Programming Frequently Asked Questions (FAQ)](https://go.dev/doc/faq)

# 目标读者

如果您是 Go 初学者，建议先了解下官方入门指南 [A Tour of Go](https://go.dev/tour/)，这是入门 Go 的最佳读物。

如果是想全面了解 Go 语法知识和语言特性与，也建议先略过本书。Go 官方文档 [The Go Programming Language Specification](https://golang.org/ref/spec) 和 [Effective Go](https://golang.org/doc/effective_go.html)，以及第三方书籍 [Go 语言圣经](https://books.studygolang.com/gopl-zh/) 也是不错的选择。

如果是想深入了解 Go 语言实现原理，还是建议先略过本书。虽然本书略有涉及，但不够全面。Go 源码应该是你的首选，再结合精彩的第三方分析，如 [Go 语言设计与实现](https://draveness.me/golang/)，应该会大有收获。

那么到底是谁适合阅读本书呢？如果你是一位有 Go 开发经验的 Gopher，想更好地管理 Go 代码，想写出更加高效易读的 Go 代码，想让自己拥有一个更好的编码风格， 想离 Go 最佳实践更近一步，建议看看本书。

# 互动勘误

如果你对文章内容有任何疑问和建议，欢迎在应相应章节下留言探讨。

本书为开源书籍，希望得到大家的协同共建，不断迭代丰富。如果有你的建议和 PR，它将会变得更好。