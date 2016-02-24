class Album < ActiveRecord::Base
	self.table_name = "ng_albums"
	self.primary_key = "ng_albums_id"

	belongs_to :singer, foreign_key: 'ng_singers_id'
	accepts_nested_attributes_for :singer

	validates :album_name, presence: true
	validates :ng_singers_id, presence: true
	validates :release_year, presence: true, length: { is: 4 }
	validates :record_company, presence: true

	def self.search(query)
	    if query
	      singer_query = Singer.where('name LIKE ?', "%#{query}%").pluck("ng_singers_id")
	      where('album_name LIKE ? OR ng_singers_id IN (?)', "%#{query}%",singer_query)
	    else
	      none
	    end
    end
end