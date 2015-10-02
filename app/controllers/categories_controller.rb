class CategoriesController < ApplicationController

	def index
		@categories = Category.all 
	end

	def show
		@category = Category.find_by_slug(params[:id])
		
		if !@category.nil? 
			@title = "Variedades de Marihuana " + @category.name.capitalize
		else 
			redirect_to action: :index	
		end	
	end
end
