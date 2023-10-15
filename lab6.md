#### 题目

- 安装rails时，会安装一些gem包，
  - activejob、activemodel、activerecord、activesupport、actionmailer、actionpack、actionview、…

- 上面这些 gem 包都是干什么的？请根据课上提供的信息，检索资料后写一个简要的小结，给出这些 gem 包的功能描述，以及在 rails 工程里的作用。

#### 答

Sail 的框架与库：

- `Active Record`: 是 `MVC`中的 `M(模型)` 是系统中负责表示业务数据和逻辑的层；`Active Record` 有助于创建和使用数据需要持久存储到数据库的业务对象；它是 `Active Record` 模式的一种实现，是对对象关系映射系统的描述

- `Active Model`: 包含用于开发需要 `Active Record` 上的某些功能的类的各种模块；`Active Model` 允许 `Action Pack` 助手与普通的 `Ruby` 对象进行交互；`Active Model ` 还有助于构建自定义 `ORM` 以在 `Rails` 框架之外使用

- `Active Pack`: 一个用于处理和响应 `Web` 请求的框架；它提供了路由机制（将请求 `URL` 映射到动作）、定义实现动作的控制器和生成响应。简而言之，`Action Pack` 提供了 `MVC` 范式中的控制器层；使用 `Ruby on Rails` 框架，用户只能直接与 `Action Controller` 模块交互。默认情况下会激活必要的 `Action Dispatch` 功能，并且 `Action View` 呈现由 `Action Controller` 隐式触发；但是，这些模块被设计为独立运行，可以在 `Rails` 之外使用

- `Action View`: 一个用于处理视图模板查找和呈现的框架，提供了在构建 `HTML` 表单、 `Atom` 提要等时提供帮助的视图助手； `Action View` 处理的模板格式是 `ERB` （嵌入式 `Ruby` ，通常用于在 `HTML` 中内联简短的 `Ruby` 片段）和 `XML Builder`

- `Active Mailer`: 一个设计电子邮件服务层的框架；这些层用于合并代码，用于发送忘记的密码、注册时的欢迎愿望、计费发票以及任何其他需要向个人或其他系统发出书面通知的用例； `Action Mailer`  本质上是一个围绕 `Action Controller` 和 `Mail gem` 的包装器。它提供了一种使用模板制作电子邮件的方法，就像 `Action Controller` 使用模板呈现视图一样；此外， `Action Mailer` 类亦可用于处理传入的电子邮件

- `Active Mailbox`: 将传入的电子邮件路由到类似控制器的邮箱，以便在 `Rails` 中进行处理；它附带了 `Mailgun` 、 `Mandrill` 、 `Postmark` 和 `SendGrid` 的入口。您还可以通过内置的 `Exim` 、 `Postfix` 和 `Qmail` 入口直接处理入站邮件；入站电子邮件 `InboundEmail` 使用 `Active Record` 和功能生命周期跟踪转换为记录，通过 `Active Storage` 将原始电子邮件存储在云存储上，并通过默认焚化处理负责任的数据；这些入站电子邮件使用 `Active Job` 异步路由到一个或多个专用邮箱，这些邮箱能够直接与域模型的其余部分进行交互。

- `Active Job`: 一个用于声明作业并使它们在各种队列后端运行的框架；重点是确保所有 `Rails` 应用程序都有一个工作基础设施；然后，我们可以在此基础上构建框架功能和其他 `gem` ，而不必担心各种作业运行器之间的 `API` 差异助于构建自定义 `ORM` 以在 `Rails` 框架之外使用。

- `Active Cable`: 将 `WebSockets` 与 `Rails` 应用程序的其余部分无缝集成。它允许以与 `Rails` 应用程序的其余部分相同的样式和形式用 `Ruby` 编写实时功能，同时仍然具有高性能和可扩展性。它是一个提供客户端 `JavaScript` 框架和服务器端 `Ruby` 框架的全栈产品。您可以访问使用 `Active Record` 或您选择的 `ORM` 编写的完整域模型

- `Active Storage`: 使上传和引用 `Amazon S3` 、 `Google Cloud Storage` 或 `Microsoft Azure Storage` 等云服务中的文件变得简单，并将这些文件附加到 `Active Records` ；支持拥有一个主服务并在其他服务中镜像以实现冗余；它还提供用于测试或本地部署的磁盘服务，但重点是云存储；文件可以从服务器上传到云端，也可以直接从客户端上传到云端

- `Active Text`: 为 `Rails` 带来了丰富的文本内容和编辑功能。它包括处理从格式到链接到引用到列表到嵌入图像和画廊的所有内容的 `Trix` 编辑器；`Trix` 编辑器生成的富文本内容保存在其自己的 `RichText` 模型中，该模型与应用程序中的任何现有 `Active Record` 模型相关联。任何嵌入的图像（或其他附件）都会使用 `Active Storage` 自动存储并与包含的 `RichText` 模型相关联

- `Active Support`: 负责提供 `Ruby` 语言扩展和实用程序；它在语言级别提供了更丰富的底线，既针对 `Rails` 应用程序的开发，也针对 `Ruby on Rails` 本身的开发
