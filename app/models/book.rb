class Book < ActiveRecord::Base
	
	belongs_to :boookedproperty
	# has_many :users
	belongs_to :boookeduser

end