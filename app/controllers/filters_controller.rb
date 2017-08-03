# all of this is only accessible if logged in
class FiltersController < ApplicationController

	def index
		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
	      @filters = Filter.all
	    end	    
	end

	def show
		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
			@filter = Filter.find_by(id: params["id"])
			@cards = Card.all
		end
	end

	def new
		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
	      @filter = Filter.new
	    end    	
  	end

  	def create
  		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
		    @filter = Filter.new
		    @filter.filter_name = params["filter_name"]	   
		    @filter.name = params["name"] # will have more filters in the future
		    @filter.user = user
		    if @filter.save
		      	redirect_to "/filters/#{@filter.id}", notice: 'Filter successfully created.'	    
		    else
		      render "new"
		    end
		end
	end

	def edit
		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
	    	@filter = Filter.find_by(id: params["id"])
	    end
	end

	def update
		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
		    @filter = Filter.find_by(id: params["id"])
		    @filter.filter_name = params["filter_name"]
		    @filter.name = params["name"]
		    @filter.user = user
		    if @filter.save
		      	redirect_to "/filters/#{@filter.id}", notice: 'Filter successfully updated.'
		    else
		      	render "edit"
		    end
		end
  	end

  	def destroy
  		user = User.find_by(id: session[:user_id])
	    if user.blank?
	      redirect_to root_url, notice: "You need to login first."
	    else
		    filter = Filter.find_by(id: params["id"])
		    filter.delete
		    redirect_to "/filters",  notice: 'Filter deleted!'
		end
  	end
end