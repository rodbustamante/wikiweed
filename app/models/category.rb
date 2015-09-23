class Category < ActiveRecord::Base
	has_many :plantCategories
	has_many :plants, through: :plantCategories
end
