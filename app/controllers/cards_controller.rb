class CardsController < ApplicationController

	# show all cards
	def index
	    @cards = Card.all
	end

	# show single card (will have more info later)
	def show
		@card = Card.find_by(id: params["id"])
	end
end