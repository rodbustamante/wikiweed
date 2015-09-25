class HasFlavor < ActiveRecord::Base
  belongs_to :flavor
  belongs_to :plant
end
