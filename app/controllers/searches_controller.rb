class SearchesController < ApplicationController

	def search
		#se define la variable con los criterios de busqueda ingresados
		keyword = params[:keyword]

		@results = []

		if !keyword.nil?
			
			@plants = Plant.select(:id, :name, :slug).where("name LIKE ?", "%#{keyword}%")
			
			if !@plants.empty?
				@results.push({
					'group' => 'Variedades',
					'results' => @plants
				})	
			end
			
			respond_to do |format|
				format.json {render json: @results }
				format.html {render searches_search_path}
			end
		end
	end
end
