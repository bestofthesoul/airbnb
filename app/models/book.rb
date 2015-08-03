class Book < ActiveRecord::Base
	
	belongs_to :property
	# has_many :users
	belongs_to :user

end