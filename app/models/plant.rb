class Plant < ActiveRecord::Base
	belongs_to :family 
	belongs_to :strain 
	belongs_to :seed_bank 
	has_many :has_categories
	has_many :reviews

	#scopes
	scope :starts_with, -> (name) {select("id, name").where("name LIKE ?", "%#{name}%")}

	#callbacks
	after_create :update_slug
	before_update :assign_slug

	def to_param
		slug
	end

	#metodos privados.
	private
	 
	def assign_slug
	    self.slug = "#{ name.parameterize }"
	end
	 
	def update_slug
	    update_attributes slug: assign_slug
	end
end
