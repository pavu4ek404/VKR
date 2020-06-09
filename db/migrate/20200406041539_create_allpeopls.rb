class CreateAllpeopls < ActiveRecord::Migration[6.0]
  def change
    create_table :allpeopls do |t|
      t.references :peopl,foreign_key: true 
      t.references :sert,foreign_key: true 
      t.references :prof ,foreign_key: true 
      t.timestamps
      
    end
  end
end
