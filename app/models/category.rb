class Category < ActiveRecord::Base
	has_many :has_categories
	has_many :plants, through: :has_categories

	# callbacks
	after_create :update_slug
	before_update :assign_slug

	#redefinimos el metodo to_param
	 def to_param
	    name
	 end

	# metodos privados
	private

	def assign_slug 
		self.slug = "#{name.parameterize}"
	end

	def update_slug
		update_attributes slug: assign_slug
	end
end
