class AddStrainIdToPlant < ActiveRecord::Migration
  def change
    add_reference :plants, :strain, index: true
  end
end
