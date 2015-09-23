class Plant < ActiveRecord::Base
	belongs_to :family
	has_many :plantCategories

	scope :starts_with, -> (name) {select("id, name").where("name LIKE ?", "%#{name}%")}
end
