class ReviewsController < ApplicationController
	before_action :set_plant

	def index
		@reviews = Review.all 
	end

	def create
		if user_signed_in?
			@review = current_user.reviews.new(review_params)
			@review.plant = @plant

			respond_to do |format|
				if @review.valid?
					if @review.save
						format.json {
										render json: {
												:review => @review,
												:user => @review.user,
												}, 
										status: :ok
									}
					else
						format.json {render json: @review.errors, status: :unprocessable_entity }
					end
				else
					format.json {render json: @review.errors, status: :unprocessable_entity}
				end
			end
		else 
			respond_to do |format|
				format.json {render json: 'Acción exclusiva sólo para usuarios registrados', status: :unprocessable_entity}
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
