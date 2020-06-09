class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.references :well,foreign_key: true 
      t.references :peopl, foreign_key: true
      t.references :peopl1,foreign_key: {to_table: 'peopls'}
      t.datetime :time
      t.float :quantity
      t.timestamps
    end
  end
end
