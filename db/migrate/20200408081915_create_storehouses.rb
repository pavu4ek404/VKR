class CreateStorehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :storehouses do |t|
      t.references :peopl,foreign_key: true
      t.references :peopl1,foreign_key: {to_table: 'peopls'}
      t.references :requirement,foreign_key: true 
      t.references :cut,foreign_key: true
      t.float :capacity
      t.timestamps
      
    end
  end
end
