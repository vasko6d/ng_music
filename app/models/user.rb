class User < ActiveRecord::Base
	self.table_name = "ng_users"
	self.primary_key = "ng_users_id"
end