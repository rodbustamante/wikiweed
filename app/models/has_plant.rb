class HasPlant < ActiveRecord::Base
  belongs_to :plant
  belongs_to :growshop
end
