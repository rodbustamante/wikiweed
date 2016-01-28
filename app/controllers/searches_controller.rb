class SearchesController < ApplicationController

	def search
		#se define la variable con los criterios de busqueda ingresados
		keyword = params[:keyword][:name]

		@plants = Plant.where("name LIKE ?", "%#{keyword}%")
	end

	def search_ajax
		#se define la variable con los criterios de busqueda ingresados
		keyword = params[:keyword]

		@results = []

		if !keyword.nil?
			
			@plants = Plant.select(:id, :name, :slug).where("LOWER(name) LIKE LOWER(?)", "%#{keyword}%")
			
			if !@plants.empty?
				@results.push({
					'group' => 'Variedades',
					'results' => @plants
				})	
			end
			
			respond_to do |format|
				format.json {render json: @results }
			end
		end
	end
end
