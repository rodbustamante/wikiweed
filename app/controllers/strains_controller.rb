class StrainsController < ApplicationController

	def index
		@strains = Strain.all 
	end

	def show
		@strain = Strain.find_by_slug(params[:id])
		
		if !@strain.nil? 
			@title = "Variedades de Marihuana " + @strain.name.capitalize
		else 
			#redirect_to action: :index	
		end	
	end
end
