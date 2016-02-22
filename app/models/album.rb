class Album < ActiveRecord::Base
	self.table_name = "ng_albums"
	self.primary_key = "ng_albums_id"
	has_one :singer
end