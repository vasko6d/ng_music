class Singer < ActiveRecord::Base
	self.table_name = "ng_singers"
	self.primary_key = "ng_singers_id"
	
	def self.search(query)
	    if query
	      where('name LIKE ?', "%#{query}%")
	    else
	      none
	    end
    end
end