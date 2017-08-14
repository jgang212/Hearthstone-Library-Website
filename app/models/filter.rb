class Filter < ApplicationRecord

	belongs_to :user

	validates :filter_name, presence: true

	# name, artist filters can be blank = show all cards
	# will validate future fields

end
