class CreateWells < ActiveRecord::Migration[6.0]
  def change
    create_table :wells do |t|
      t.string :name
      t.references :explosive,foreign_key: true 
      t.references :cut, foreign_key: true 
      t.timestamps
    end

  end
end
