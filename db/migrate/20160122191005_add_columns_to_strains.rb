class AddColumnsToStrains < ActiveRecord::Migration
  def change
    add_column :strains, :image, :string
    add_column :strains, :description, :text
  end
end
