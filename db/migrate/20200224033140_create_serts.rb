class CreateSerts < ActiveRecord::Migration[6.0]
  def change
    create_table :serts do |t|
      t.string :name_sert
      t.references :peopl, foreign_key: true 
      t.timestamps
    end
  end
end
