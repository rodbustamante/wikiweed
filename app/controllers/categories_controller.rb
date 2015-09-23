class CategoriesController < ApplicationController

	def index
		@categories = category.all 
	end

	def show
		begin	
			@category = Category.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@category = nil
		end	
	end
end
