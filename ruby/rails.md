#Association
model关联

* belongs_to  # 一对一
* has_one  # 一对一
* has_many  # 一对多
* has_and_belongs_to_many  # 神马玩意

#rake tasks
`rake db:create all` 新建config/database.yml中所有数据库
`rake assets:precompile` 预编译所有静态文件
`rake db:migrate` 迁移数据库
`rake db:migrate VERSION=0` 回滚所有数据库改动
`rake db:schema:dump` 将数据库结构导入db/schema.rb
`rake db:structure:dump` 将完整数据库导入到db/structure.sql

#init
rails generate controller home index

* 不要忘了删除默认首页`rm public/index.html`,
* 在config/routes.rb中添加`get "home/index"`,
* 指定首页`root :to => "home#index"`
* rails的config文件是即时生效的，不需要重启server

#environment
`rails server -e production`启动生产环境server
`rails console production`启动生产环境interactive shell

#migrate
##methods
* up
* change
* down
##action methods
* add_column
* add_index
* add_timestamps
* create_table
* remove_timestamps
* rename_column
* rename_index
* rename_table
##execute
```
execute <<-SQL
  ALTER TABLE products
    ADD CONSTRAINT fk_products_categories
    FOREIGN KEY (category_id)
    REFERENCES categories(id)
SQL
```

#ActiveRecord Model
* attr_accessible 表示这些参数可以被修改和访问，与 ruby 的 attr_accessor 不同

#validates
* valid?, invalid?  # 判断数据合法性

##presence  # 非空
class Person < ActiveRecord::Base
  validates :name, :login, :email, :presence => true
end

##exclusion  # 不包含
class Account < ActiveRecord::Base
  validates :subdomain, :exclusion => { :in => %w(www us ca jp),  # 枚举
    :message => "Subdomain(子域) %{value} is reserved." }
end

##inclusion  # 包含
class Coffee < ActiveRecord::Base
  validates :size, :inclusion => { :in => %w(small medium large),
    :message => "%{value} is not a valid size" }
end

##format  # 匹配
class Product < ActiveRecord::Base
  validates :legacy_code, :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }
end

##length  # 长度
class Person < ActiveRecord::Base
  validates :name, :length => { :minimum => 2 }
  validates :bio, :length => { :maximum => 500 }
  validates :password, :length => { :in => 6..20 }
  validates :registration_number, :length => { :is => 6 }
end

##validates_with
[validates_with](http://guides.rubyonrails.org/active_record_validations_callbacks.html#validates_with)