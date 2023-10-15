# rails是怎么启动的

- 当执行 `rails server` 后，主要会启动一个 `web` 服务器程序 `（如puma）`，然后这个 `web` 服务器会把收到的请求路由给 `rails` 程序。
- 请根据课件里提供的信息，并查阅相关资料，写一个说明文档，说明 `rails server` 命令执行后，到 `rails` 工程被启动，发生了什么？相关 `Gemfile` 里列出的 `gem` 包是如何被加载的？
- 用 `Markdown` 语法，写一个 `lab7.md` 文件，提交到 `git` ， `master` 分枝

答：
- 输入 `rails s` 这个命令的时候，项目会加载项目 `bin/rails.rb` 这个文件
- 这个文件中定义了一个 `APP_PATH` 即程序项目文件： `config/application.rb` ，并加载了 `config/boot` ，`boot`文件负责完成 `bundle` 的初始化
- 然后加载了 `rails/commands`文件，处理传入的 `command` 参数 `s` 映射为 `server`，然后使用 `Rails::Command.invoke command, ARGV` 传入 `invoke` 函数的 `full_namespace` 中，然后经过一系列的函数传递与处理后调用了 `initializable.rb` 的 `run` 函数，然后此函数使用 `instance_exec` 传输了参数，最后调用 `server.start` 方法，此方法打印了控制台信息，然后使用 `super` 调用父类 `Rack::Server#start` 方法，最终会加载项目 `config` 目录下的`environment.rb` 这个文件，启动了服务器程序，在 `config/environment.rb` 程序中加载了 `config/application.rb` ，此程序又加载了 `config/boot.rb` ，此程序又加载了 `bundler/setup.rb`，最终在此文件中完成了对 `bundler.rb` 的调用以完成 `Gemfile` 中的 `gem` 包的加载