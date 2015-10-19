class ReviewsController < ApplicationController
	before_action :set_plant

	def index
		@reviews = Review.all 
	end

	def create
		@review = current_user.reviews.new(review_params)
		@review.plant = @plant

		respond_to do |format|
			if @review.save
				format.json {render json: "Comentario agregado.", status: :ok }
			else
				format.json {render json: @review.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def set_plant
			@plant = Plant.find_by_slug(params[:plant_id])
		end	 
		
		def review_params
			params.require(:review).permit(:user_id, :plant_id, :title, :body, :score)
		end

end
