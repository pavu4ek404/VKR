class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :organisation,foreign_key: true 
      t.references :explosive,foreign_key: true 
      t.float :coutn
      t.float :price 
      
      t.timestamps
    end
  end
end
