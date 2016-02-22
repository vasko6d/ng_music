class Singer < ActiveRecord::Base
	self.table_name = "ng_singers"
	self.primary_key = "ng_singers_id"
	has_many :albums
end