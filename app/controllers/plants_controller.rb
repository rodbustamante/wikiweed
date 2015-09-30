class PlantsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

	def index
		@plants = Plant.all 
	end

	def show
		@plant = Plant.find_by_slug(params[:id])

		if !@plant.nil? 
			@title = @plant.name.capitalize
		else 
			redirect_to action: :index	
		end	
	end

	def update
			
	end

	def autocomplete
		@plants = Plant.starts_with(params[:name])

		respond_to do |format|
	      format.json  { render :json => @plants, :status => :ok }
	    end
	end 

	def record_not_found
		redirect_to action: :index
	end

end
