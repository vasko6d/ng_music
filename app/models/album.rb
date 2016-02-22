class Album < ActiveRecord::Base
	self.table_name = "ng_albums"
	self.primary_key = "ng_albums_id"
	belongs_to :singer

	def self.search(query)
	    if query
	      singer_query = Singer.where('name LIKE ?', "%#{query}%").pluck("ng_singers_id")
	      where('album_name LIKE ? OR ng_singers_id IN (?)', "%#{query}%",singer_query)
	    else
	      none
	    end
    end
end