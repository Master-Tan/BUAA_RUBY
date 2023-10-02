



# Ruby课程大作业项目设计文档

### 题目：“航送”外卖平台管理系统

---

## 测试网址及账号密码
共有两个端口，分别为 PC 端与 Mobile 端

### PC端
网址：http://20373864.project.rubyapp.act.buaa.edu.cn:9000/manage  
(点击跳转)
- 管理员端（管理商家，管理整个系统）
  - 账号：test-admin-00
  - 密码：123456
- 食堂端 （管理档口及下属等业务功能）
  - 账号：教二
  - 密码：123
- 商家端（管理菜品，查看订单等业务功能）
  - 账号：王伟龙馋嘴鱼
  - 密码：123
  
### Moblie端
网址：http://20373864.project.rubyapp.act.buaa.edu.cn:9000/  
(点击跳转)
- 顾客（用户）端（挑选餐品，下单等业务功能）
  - 账号：test-user-00
  - 密码：123
- 外卖员（骑手）端（查看订单，配送等业务功能）
  - 账号:test-deliver-00
  - 密码:123456

（也可自行注册账号）
这两个端口为Mobile视图，可以使用 Chrome 浏览器的手机模式：
<img src=README/30.png>


## 系统设计

### 需求描述

- 在学习气氛浓厚的北航校园中，同学们忙于学业，辛勤耕耘，常常没有时间去食堂就餐；当学生忙于学习、实验或身体不适、就餐不便的情况下，可以借助平台寻找顺路的同学帮忙带饭，方便同学们的学习生活。
- 本项目以北航食堂为单位，设计一款北航外卖软件，将食堂饭菜配送到到宿舍/实验室

### 系统功能结构图
<div style="margin: auto;">
  <img src=README/3.png width=80%>
</div>

- 对于消费者，有用户注册、用户登录、用户退出登录、用户个人信息的设置和展示、订单状态查看、历史订单查询、食堂/档口筛选与查看、档口菜品筛选与查看、档口菜品挑选、挑选后确认订单。
- 对于骑手，可以接单并派送、管理已接单订单。
- 对于档口，有菜品属性的设置和展示（如价格、描述、菜品图等）、订单的查询和修改、订单的状态更新、订单的配送安排、档口信息的修改和展示。
- 对于食堂，包含所属档口的所有功能，以及下属档口的增删与管理。


## 系统实现

### 开发环境配置
- 前端环境
  - axios：1.2.1
  - unplugin-vue-components：0.22.12
  - vant：4.0.0
  - vue：3.2.41
  - vue-axios：3.5.2
  - vue-router：4.1.6
  - vitejs/plugin-vue：3.2.0
  - vite：3.2.4
  - vite-plugin-style-import：1.4.1

- 后端环境
  - ruby：3.1.3
  - rails：7.0.4
  - sqlite：3.39.2

### 数据流图
<div style="margin: auto;">
  <img src=README/1.png>
</div>

### 基本表定义
- 用户（买家）表 （id，用户名，密码，电话）
- 食堂表 （id，食堂名称）
- 商家（卖家）表 （id，用户名，密码，电话，开始时间，结束时间，商家地址）
- 骑手表 （id，用户名，密码，电话）
- 产品表 （id，所属商家id，名称，价格，喜好数，销量，描述，图片路径，商品类型，上架时间）
- 购物车项表 （id，买家id，产品id，数量，价格，添加时间）
- 订单表 （id，添加时间，买家id，商家id，配送地址，配送电话，订单状态，配送费，打包费，优惠金额，实付金额）
- 订单项表 （id，买家id，产品id，数量，价格，所属订单id）
- 订单平台表 （id，订单id，添加时间，图片路径，详情）
- 用户配送地址表 （id，买家id，联系电话，是否默认地址，详细地址，标签）
- 帮送表 （id，添加时间，give_user_id，get_user_id，配送地址，配送电话，帮送状态）
- 帮送项表 （id，give_user_id，帮送物品详情，所属帮送表id）
- 帮送平台表 （id，订单id，添加时间，图片路径，详情）
- 订单配送表 （id，订单id，骑手id，添加时间，预计到达时间）
- 用户搜索记录表 （id，买家id，搜索记录，添加时间）
- 管理员表 （id，用户名，密码，等级）
- 用户操作日志表 （id，买家id，动作，详情，状态（动作成功与否），添加时间）
- 商家操作日志表 （id，商家id，动作，详情，状态（动作成功与否），添加时间）
- 骑手操作日志表 （id，骑手id，动作，详情，状态（动作成功与否），添加时间）
- 管理员操作日志表 （id，管理员id，动作，详情，状态（动作成功与否），添加时间）
- 评价表 （id，商家id，评价内容，评分）

### 关系模式图
<div style="margin: auto;">
  <img src=README/2.png width=90%>
</div>

### 实现方式
- 前端 PC 端（管理端）
  - 使用 Vue3 + Vite + ElementPlus 的前端（基于 Node.js）
- 前端移动端（业务端）
  - 使用 Vue3 + Vite + Vant4 的前端（基于 Node.js）
- 后端
  - 使用 Ruby + Rails 的后端

## 使用简介

### 用户点餐功能
- 用户点击系统推荐档口、或先点击一个食堂再点击一个档口，即可选择一个档口进行点餐。
<div style="margin: auto;">
  <img src=README/22.png width=30%>
</div>

- 用户在档口中，选定某一菜品后，调整数量点击加入购物车即可点餐。
<div style="margin: auto;">
  <img src=README/23.png width=30%>
</div>

- 用户选择完毕后，点击提交，即可确认餐品。选择配送方式后即可提交订单。
<div style="margin: auto;">
  <img src=README/24.png width=30%>
</div>

- 提交订单后，可在底部导航栏订单界面查看到刚刚提交的订单。
<div style="margin: auto;">
  <img src=README/25.png width=30%>
</div>

- 点击订单详情，可以查看订单的状态和详细信息。并可以进行评价。
<div style="margin: auto;">
  <img src=README/26.png width=30%>
</div>


### 用户帮带功能
- 在广场，用户可以帮助其他用户来进行帮带。点击帮送行，即可领取帮送任务。
<div style="margin: auto;">
  <img src=README/27.png width=30%>
</div>


### 骑手接单功能
- 骑手可以在接单页进行接单。
<div style="margin: auto;">
  <img src=README/28.png width=30%>
</div>

- 点击接单后，可以在订单列表中查看到该订单。送达时点击确认送达即可。
<div style="margin: auto;">
  <img src=README/29.png width=30%>
</div>


### 档口管理功能
- 登录
  - 首先我们登录档口的账户。
<div style="margin: auto;">
  <img src=README/4.png width=80%>
</div>

  - 登录之后可以查看到主页，主页放置了订单列表的快速预览。
<div style="margin: auto;">
  <img src=README/5.png width=80%>
</div>

- 订单相关
  - 点击左侧“订单相关”，再点击“订单列表”，可以看到订单管理面板。
<div style="margin: auto;">
  <img src=README/6.png width=80%>
</div>

  - 点击想要管理的订单右侧的详情，可以进行订单信息修改。
<div style="margin: auto;">
  <img src=README/7.png width=80%>
</div>

  - 点击想要管理的订单右侧的删除，可以删除该订单。
<div style="margin: auto;">
  <img src=README/8.png width=80%>
</div>


- 餐品相关
  - 点击左侧“商家相关”，再点击“菜品列表”，可以看到当前档口餐品列表。
<div style="margin: auto;">
  <img src=README/9.png width=80%>
</div>

  - 点击“创建菜品”可以新增菜品。
<div style="margin: auto;">
  <img src=README/10.png width=80%>
</div>

  - 点击右侧详情可查看菜品详情。
<div style="margin: auto;">
  <img src=README/11.png width=80%>
</div>

  - 点击右侧删除可删除菜品。
<div style="margin: auto;">
  <img src=README/12.png width=80%>
</div>


### 食堂管理功能
食堂管理人员对下属档口的菜品、订单操作与前述一致，可查阅前一节内容。在此介绍其余未提及的内容。

- 档口管理相关
  - 点击左侧“商家相关”，再点击“商家列表”，即可看到下属的档口信息。
<div style="margin: auto;">
  <img src=README/13.png width=80%>
</div>

  - 点击下方创建商家，可以进行档口的增加，增加的档口同时也是该档口的管理员账户，请妥善保管。
<div style="margin: auto;">
  <img src=README/14.png width=80%>
</div>

  - 点击右侧详情和删除可以查看档口信息或删除档口。
<div style="margin: auto;">
  <img src=README/15.png width=80%>
</div>

### 运维管理功能
运维人员对所有食堂下属档口的菜品、订单操作与前述一致；对所有食堂的档口的管理操作和前述一致，可查阅前两节内容。在此介绍其余未提及的内容。
- 管理员管理
  - 点击左侧“管理员相关”，再点击“管理员列表”可以进行新的运维管理账户的添加，支持两级管理员，低一级管理员没有管理员管理权限。
<div style="margin: auto;">
  <img src=README/16.png width=80%>
</div>

  - 点击“日志列表”可以查看管理员操作日志。
<div style="margin: auto;">
  <img src=README/17.png width=80%>
</div>


- 食堂管理
  - 点击左侧“商家相关”，再点击“食堂列表”，可以进行食堂的添加和管理。
<div style="margin: auto;">
  <img src=README/18.png width=80%>
</div>


- 用户管理
  - 点击左侧“用户相关”，可以进行用户的查看、修改、删除、导出操作。
<div style="margin: auto;">
  <img src=README/19.png width=80%>
</div>

  - 点击“导入用户”，可以选择表格文件，从表格批量创建用户。
<div style="margin: auto;">
  <img src=README/20.png width=80%>
</div>


- 骑手管理
  - 点击左侧“骑手相关”可以添加和管理当前系统内骑手账号。
<div style="margin: auto;">
  <img src=README/21.png width=80%>
</div>

- 查看统计数据
  - 对于订单的统计数据，实现了三个维度：用户、时间、档口的订单数量统计。可以在线查看图表统计，也可以导出为 PDF 保存至本地
  - 下面是统计数据的实现效果。
<div style="margin: auto;">
  <img src=README/31.png width=80%>
</div>
<div style="margin: auto;">
  <img src=README/32.png width=80%>
</div>
  