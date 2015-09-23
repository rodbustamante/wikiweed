class AddFamilyIdToPlant < ActiveRecord::Migration
  def change
    add_reference :plants, :family, index: true
  end
end
