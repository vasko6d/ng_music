class Singer < ActiveRecord::Base
	self.table_name = "ng_singers"
	self.primary_key = "ng_singers_id"
	has_many :albums, foreign_key: 'ng_singers_id'
	validates :name, presence: true, uniqueness: {case_sensitive: false}
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