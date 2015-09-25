class AddFamilyIdToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :family_id, :integer
  end
end
