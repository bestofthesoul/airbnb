class Bookedproperty < ActiveRecord::Base
	
	# belongs_to :user
	has_many :bookedusers, through: :books
	
	has_many :books
	

	# has_many :propertytags
	# has_many :tags, through: :propertytags


	validates :bookedproperty, presence: true

end