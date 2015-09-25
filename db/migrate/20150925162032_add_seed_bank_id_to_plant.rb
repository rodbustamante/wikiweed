class AddSeedBankIdToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :seed_bank_id, :integer
  end
end
