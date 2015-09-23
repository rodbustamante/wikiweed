class PlantsController < ApplicationController

	def index
		@plants = Plant.all 
	end

	def show
		begin	
			@plant = Plant.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@plant = nil
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

end
