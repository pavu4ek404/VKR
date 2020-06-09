class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :contract,foreign_key: true 
      t.references :storehouse,foreign_key: true 
      t.timestamps
    end
  end
end
