class Filter < ApplicationRecord

	belongs_to :user

	validates :filter_name, presence: true

	# name filter can be blank = show all cards

end
