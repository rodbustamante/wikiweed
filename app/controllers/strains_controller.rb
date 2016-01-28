class StrainsController < ApplicationController

	def index
		@strains = Strain.all 
	end

	def show
		@strain = Strain.find_by_slug(params[:id].downcase)
		strain_id = @strain.id
		
		@plants = Plant.where("strain_id = ?", "#{strain_id}").paginate(:page => params[:page], :per_page => 20)

	end
end
