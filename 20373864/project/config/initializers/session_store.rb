# Ruby on Rails提供的session存储方案：
# PStore(文件存储，默认方式)
# ActiveRecordStore(数据库)
# DRbStore
# FileStore
# MemoryStore
#
# 配置后面可添加{ :expire_after => 12.hours }指定session失效时间，value为时间对象，如Rails.application.config.session_store :active_record_store，{ :expire_after => 12.hours }
# Rails.application.config.session_store :active_record_store