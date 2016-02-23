class Singer < ActiveRecord::Base
	self.table_name = "ng_singers"
	self.primary_key = "ng_singers_id"
	validates :name, presence: true
	validates :sex, presence: true
	validates :dob, presence: true


	def self.search(query)
	    if query
	      where('name LIKE ?', "%#{query}%")
	    else
	      none
	    end
    end
end