# all of this is only accessible if logged in
class FiltersController < ApplicationController
	before_action :require_login

	def index
		user = User.find_by(id: session[:user_id])
	    @filters = user.filters    
	end

	def show
		@filter = Filter.find_by(id: params["id"])
		@cards = Card.all
	end

	def new
      	@filter = Filter.new  	
  	end

  	def create
  		user = User.find_by(id: session[:user_id])
	    @filter = Filter.new
	    @filter.filter_name = params["filter_name"]	   
	    @filter.name = params["name"]
	    @filter.artist = params["artist"]
	    @filter.user = user
	    if @filter.save
	      	redirect_to "/filters/#{@filter.id}", notice: 'Filter successfully created.'	    
	    else
	      render "new"
	    end	
	end

	def edit
    	@filter = Filter.find_by(id: params["id"])
	end

	def update
		user = User.find_by(id: session[:user_id])
	    @filter = Filter.find_by(id: params["id"])
	    @filter.filter_name = params["filter_name"]
	    @filter.name = params["name"]
	    @filter.artist = params["artist"]
	    @filter.user = user
	    if @filter.save
	      	redirect_to "/filters/#{@filter.id}", notice: 'Filter successfully updated.'
	    else
	      	render "edit"
	    end
  	end

  	def destroy
	    filter = Filter.find_by(id: params["id"])
	    filter.delete
	    redirect_to "/filters",  notice: 'Filter deleted!'
  	end

  	private
 
	def require_login
		user = User.find_by(id: session[:user_id])
	    if user.blank?
	    	redirect_to root_url, notice: "You need to login first."
	    end
  	end
end