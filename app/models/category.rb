class Category < ActiveRecord::Base
	has_many :plant, :through => :hascategory
	has_many :hascategory
end
