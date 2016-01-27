class StrainsController < ApplicationController

	def index
		@strains = Strain.all 
	end

	def show
		@strain = Strain.find_by_slug(params[:id])
		
		@plants = Plant.where("strain_id = ?", "#{@strain.id}").paginate(:page => params[:page], :per_page => 20)

	end
end
